module tst_utils

  use iso_var_str
  use variable
  use dictionary

  implicit none
  
  integer, parameter :: is = selected_int_kind(9)
  integer, parameter :: sp = selected_real_kind(p=6)
  integer, parameter :: dp = selected_real_kind(p=15)

  interface assert
     module procedure assert_0d
     module procedure assert_1d
     module procedure assert_2d
  end interface assert

  private :: assert_0d, assert_1d, assert_2d
  
contains

  subroutine show_mem()
    call system("free | grep Mem | awk '{print $1,$2/1024,$3/1024,$4/1024}'")
  end subroutine show_mem

  subroutine assert_0d(log,msg)
    logical, intent(in) :: log
    character(len=*) :: msg
    if ( .not. log ) then
       write(*,*) msg
       stop
    end if
  end subroutine assert_0d
  subroutine assert_1d(log,msg)
    logical, intent(in) :: log(:)
    character(len=*) :: msg
    if ( .not. all(log) ) then
       write(*,*) msg
       stop
    end if
  end subroutine assert_1d
  subroutine assert_2d(log,msg)
    logical, intent(in) :: log(:,:)
    character(len=*) :: msg
    if ( .not. all(log) ) then
       write(*,*) msg
       stop
    end if
  end subroutine assert_2d

end module tst_utils
