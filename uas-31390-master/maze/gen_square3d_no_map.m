function gen_square3d_no_map( square )
    vert = [square(1,1) square(2,1) square(3,1); ...
            square(1,2) square(2,1) square(3,1); ...
            square(1,2) square(2,2) square(3,1); ...
            square(1,1) square(2,2) square(3,1); ...
            square(1,1) square(2,1) square(3,2); ...
            square(1,2) square(2,1) square(3,2); ...
            square(1,2) square(2,2) square(3,2); ...
            square(1,1) square(2,2) square(3,2)];
    fac = [1 2 6 5;2 3 7 6;3 4 8 7;4 1 5 8;1 2 3 4;5 6 7 8];

    patch('Vertices',vert,'Faces',fac,...
          'FaceVertexCData',hsv(6),'FaceColor','flat')
    hold on

end

