program EncodeDecodeExample

    use module_encode_lists
    implicit none
    integer(kind=8)               :: n_halos_tree, i, j
    character(2000)               :: encodedString
    character(2000), allocatable  :: IDs_children_wBH(:), bh_ids_retrieval(:)
    integer(kind=8), allocatable  :: number_of_BHs(:), halo_ids(:), bh_ids_aux(:), sdo_num_bhs(:)
    n_halos_tree = 10

    allocate(IDs_children_wBH(n_halos_tree), number_of_BHs(n_halos_tree), sdo_num_bhs(n_halos_tree))

    number_of_BHs = [0,1,4,3,6,7,0,0,7,0]
    halo_ids = [1,2,3,4,5,6,7,8,9,10]

    do i=1, n_halos_tree
        allocate(bh_ids_aux(number_of_BHs(i)))
        bh_ids_aux = halo_ids(1:number_of_BHs(i))
        print*,'bh_ids_aux: ', bh_ids_aux
        call EncodeList(bh_ids_aux, encodedString)
        IDs_children_wBH(i) = encodedString
        deallocate(bh_ids_aux)
    end do

    do j=1, size(IDs_children_wBH)
        call DecodeList(IDs_children_wBH(j), bh_ids_aux)
        print*,'bh_ids_aux_size ',  size(bh_ids_aux)
        sdo_num_bhs(j) = size(bh_ids_aux)
        !deallocate(bh_ids_aux)
    end do 

    print*,'number of BHs', number_of_BHs
    print*,'IDs_children_wBH', IDs_children_wBH
    print*,'number of BHs retrieved', sdo_num_bhs

end program EncodeDecodeExample
  