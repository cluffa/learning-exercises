module bob
  implicit none
contains
  function hey(statement)
    character(100) :: hey
    character(len=*), intent(in) :: statement
    character(100) :: tr_statement
    INTEGER :: statement_len
    statement_len = LEN(TRIM(statement))
    IF (SCAN(statement(statement_len-1:statement_len),"?")>0) THEN
      IF (SCAN(statement(1:statement_len),"abcdefghijklmnopqrstuvwxyz0123456789-,.!':)")==0) THEN
        hey = "Calm down, I know what I'm doing!"
      ELSE
        hey = "Sure."
      END IF
    ELSE IF (SCAN(statement,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-,.!'?")==0) THEN
      hey = "Fine. Be that way!"
    ELSE IF (SCAN(statement(2:statement_len),"abcdefghijklmnopqrstuvwxyz")==0) THEN
      IF (SCAN(statement(2:statement_len),"ABCDEFGHIJKLMNOPQRSTUVWXYZ")>0) THEN
        hey = "Whoa, chill out!" 
      ELSE
        hey = "Whatever."
      END IF
    ELSE
      hey = "Whatever."
    END IF
  end function hey
end module bob
