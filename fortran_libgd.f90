module fortran_libgd
  use iso_c_binding
  implicit none

  integer(c_int), parameter :: gdArc    = 0_c_int,&
                               gdPie    = 0_c_int,&
                               gdChord  = 1_c_int, &
                               gdNoFill = 2_c_int,&
                               gdEdged  = 4_c_int
  
  
  interface

     function gd_fopen(filename, modus) bind(c, name = 'fopen')
       import::  c_ptr, c_char
       implicit none
       type(c_ptr) :: gd_fopen
       character(kind= c_char),   intent(in) :: filename(*), modus(*) 
     end function gd_fopen

     function gd_fclose(filepointer) bind(c, name = 'fclose')
       import:: c_ptr,c_int
       implicit none
       type(c_ptr), value  :: filepointer
       integer(c_int) :: gd_fclose
     end function gd_fclose

     function gdImageCreate(xsize, ysize) bind(c, name = 'gdImageCreate')
       import:: c_ptr, c_int
       implicit none
       type(c_ptr) :: gdImageCreate
       integer(c_int), value :: xsize, ysize
     end function gdImageCreate


     function gdImageCreateTrueColor(xsize, ysize) bind(c, name = 'gdImageCreateTrueColor')
       import:: c_ptr, c_int
       implicit none
       type(c_ptr) :: gdImageCreateTrueColor
       integer(c_int), value :: xsize, ysize
     end function gdImageCreateTrueColor
     

     subroutine gdImageDestroy(imagepointer) bind(c, name = 'gdImageDestroy')
       import:: c_ptr
       implicit none
       type(c_ptr), value :: imagepointer
     end subroutine gdImageDestroy

     function gdImageColorAllocate (imagepointer, r, g, b) bind(c, name = 'gdImageColorAllocate')
       import c_int, c_ptr
       implicit none
       integer(c_int) :: gdImageColorAllocate
       type(c_ptr), value :: imagepointer
       integer(c_int), value :: r, g, b
     end function gdImageColorAllocate

     function gdImageColorAllocateAlpha (imagepointer, r, g, b, a) bind(c, name = 'gdImageColorAllocateAlpha')
       import c_int, c_ptr
       implicit none
       integer(c_int) :: gdImageColorAllocateAlpha
       type(c_ptr), value :: imagepointer
       integer(c_int), value :: r, g, b, a
     end function gdImageColorAllocateAlpha


     subroutine gdImageLine (imagepointer, x1, y1, x2, y2, color) bind(c, name = 'gdImageLine')
       import c_int, c_ptr
       implicit none
       type(c_ptr)   , value :: imagepointer
       integer(c_int), value :: x1, y1, x2, y2, color
     end subroutine gdImageLine

    subroutine gdImageDashedLine (imagepointer, x1, y1, x2, y2, color) bind(c, name = 'gdImageDashedLine')
       import c_int, c_ptr
       implicit none
       type(c_ptr)   , value :: imagepointer
       integer(c_int), value :: x1, y1, x2, y2, color
     end subroutine gdImageDashedLine
     
    subroutine gdImageRectangle (imagepointer, x1, y1, x2, y2, color) bind(c, name = 'gdImageRectangle')
       import c_int, c_ptr
       implicit none
       type(c_ptr)   , value :: imagepointer
       integer(c_int), value :: x1, y1, x2, y2, color
     end subroutine gdImageRectangle

      
    subroutine gdImageFilledRectangle (imagepointer, x1, y1, x2, y2, color) bind(c, name = 'gdImageFilledRectangle')
       import c_int, c_ptr
       implicit none
       type(c_ptr)   , value :: imagepointer
       integer(c_int), value :: x1, y1, x2, y2, color
     end subroutine gdImageFilledRectangle
    
    
    subroutine gdImageEllipse (imagepointer, mx, my, w, h, color) bind(c, name = 'gdImageEllipse')
       import c_int, c_ptr
       implicit none
       type(c_ptr)   , value :: imagepointer
       integer(c_int), value :: mx, my, w, h, color
     end subroutine gdImageEllipse

      
    subroutine gdImageFilledEllipse (imagepointer, mx, my, w, h, color) bind(c, name = 'gdImageFilledEllipse')
       import c_int, c_ptr
       implicit none
       type(c_ptr)   , value :: imagepointer
       integer(c_int), value :: mx, my, w, h, color
     end subroutine gdImageFilledEllipse

    subroutine gdImageArc (imagepointer, mx, my, w, h, a1, a2, color) bind(c, name = 'gdImageArc')
       import c_int, c_ptr
       implicit none
       type(c_ptr)   , value :: imagepointer
       integer(c_int), value :: mx, my, w, h, a1, a2, color
     end subroutine gdImageArc

    subroutine gdImageFilledArc (imagepointer, mx, my, w, h, a1, a2, color, s) bind(c, name = 'gdImageFilledArc')
       import c_int, c_ptr
       implicit none
       type(c_ptr)   , value :: imagepointer
       integer(c_int), value :: mx, my, w, h, a1, a2, color,s 
     end subroutine gdImageFilledArc
     

     subroutine gdImageFill (imagepointer, x,y , color) bind(c, name = 'gdImageFill')
       import c_int, c_ptr
       implicit none
       type(c_ptr)   , value :: imagepointer
       integer(c_int), value :: x,y , color
     end subroutine gdImageFill

     subroutine gdImageString (imagepointer, fontpointer, x,y, s, color)&
          bind(c, name='gdImageString')
       import c_int, c_char, c_ptr
       implicit none
       type(c_ptr), value        :: imagepointer
       type(c_ptr), value        :: fontpointer
       integer(c_int),value      :: x,y
       character(kind= c_char),   intent(in) :: s(*)       
       integer(c_int), value     :: color
     end subroutine gdImageString
     
     subroutine gdImagePng (imagepointer, filepointer) bind(c, name = 'gdImagePng')
       import c_ptr
       implicit none
       type(c_ptr), value :: imagepointer
       type(c_ptr), value :: filepointer
     end subroutine gdImagePng

     
     subroutine gdImageJpeg (imagepointer, filepointer, quality) bind(c, name = 'gdImageJpeg')
       import c_ptr, c_int
       implicit none
       type(c_ptr), value :: imagepointer
       type(c_ptr), value :: filepointer
       integer(c_int), value :: quality
     end subroutine gdImageJpeg

     function gdFontGetGiant() bind(c, name = 'gdFontGetGiant')
       import c_ptr
       implicit none
       type(c_ptr) :: gdFontGetGiant
     end function gdFontGetGiant

     function gdFontGetLarge() bind(c, name = 'gdFontGetLarge')
       import c_ptr
       implicit none
       type(c_ptr) :: gdFontGetLarge
     end function gdFontGetLarge
     
     function gdFontGetMediumBold() bind(c, name = 'gdFontGetMediumBold')
       import c_ptr
       implicit none
       type(c_ptr) :: gdFontGetMediumBold
     end function gdFontGetMediumBold
    
     function gdFontGetSmall() bind(c, name = 'gdFontGetSmall')
       import c_ptr
       implicit none
       type(c_ptr) :: gdFontGetSmall
     end function gdFontGetSmall
    
     function gdFontGetTiny() bind(c, name = 'gdFontGetTiny')
       import c_ptr
       implicit none
       type(c_ptr) :: gdFontGetTiny
     end function gdFontGetTiny

     
     
  end interface
  
end module fortran_libgd


