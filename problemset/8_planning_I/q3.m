% parameter
tol      =  0.01;
maxIter  = 50;

% initialize map
Map = zeros(11,9);
Map(1,:) = -1; Map(11,:) = -1; Map(:,1) = -1; Map(:,9)     = -1;
Map(9,2) = -1; Map(10,2) = -1; Map(10,3)= -1; Map(5:6,5:8) = -1;

% initialize search start and goal locations
SearchStart = [3,7];
SearchGoal  = [9,6];

% initialize iterative search
SearchSolution = zeros(size(Map));
SearchSolution(Map==-1)=1;   %set obstacle cells to "1"
SearchSolution(Map==0) =0.5; %set free cells to "0.5"
SearchSolution(SearchGoal(1),SearchGoal(2)) = 0;

% iteratively solve the discrete Laplace Equation with Dirichlet boundary conditions
iter = 1;
max_update_val = inf; % initialise update to be something big
previous_solution = SearchSolution;

mapsize = size(Map);

while iter < maxIter &&  max_update_val > tol
    previous_solution = SearchSolution;

    for x = 1:mapsize(1)
        for y = 1:mapsize(2)

            % if potential is 0 or 1 do not update
            if previous_solution(x,y) == 0 || previous_solution(x,y) == 1
                SearchSolution(x,y) = previous_solution(x,y);
            
            else
            % else, update based on neighbours
                SearchSolution(x,y) =  (previous_solution(x+1,y) + ...
                                        previous_solution(x-1,y) + ...
                                        previous_solution(x, y+1) + ...
                                        previous_solution(x, y-1))/4;
            end
        end
    end
    
    % update while loop conditions
    max_update_val = max(abs(SearchSolution - previous_solution),[],'all')
    iter = iter + 1;
end



% visualize the solution
imagesc(SearchSolution)
set(gca,'dataAspectRatio',[1 1 1])