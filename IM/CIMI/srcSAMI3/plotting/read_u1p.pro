

; E x B drift (vertical - u1p)

  close,1

  u1p  = dblarr(nz,nf,nl+1,nt)
  tmpt   = dblarr(nz,nf,nl,nt)
  tmp0   = dblarr(nz,nf,nl)

  openr,1,dir+'u1pu.dat',/f77_unformatted

  print,' reading dene '

  for i = 0,nt-1 do begin
    print,i 
    readu,1,tmp0
    tmpt(*,*,*,i) = tmp0
  endfor

  u1p(*,*,0:nl-1,*) = tmpt
  u1p(*,*,nl,*)     = u1p(*,*,0,*)

  close,1

  delvar,tmpr,etmp

  end