% initialize map, search start and goal as well as the solution map
Map = zeros(11,9);
Map(1,:) = -1; Map(11,:) = -1; Map(:,1) = -1; Map(:,9)     = -1;
Map(9,2) = -1; Map(10,2) = -1; Map(10,3)= -1; Map(5:6,5:8) = -1;

SearchStart = [3,7];
SearchGoal  = [9,6];
        
SolutionMap = Inf*ones(size(Map)); %store g-values in here.

xmax = size(Map,1);
ymax = size(Map,2);

% visited matrix 
visited = Map;

% queue to track nodes that have unvisited edges (concatenate vertically)
queue = SearchStart;
SolutionMap(SearchStart(1), SearchStart(2)) = 0;

% BF search
while ~isempty(queue)
    % dequeue first element
    current = queue(1,:);
    queue(1,:) = [];
    
    x = current(1);
    y = current(2);
    visited(x,y) = 1;
    
    neighbours = [x, y-1; x, y+1; x-1, y; x+1, y]';
    
    for neighbour = neighbours
        % do not traverse edges
        if Map(neighbour(1),neighbour(2)) == -1
            continue;
        end   

        if visited(neighbour(1),neighbour(2)) ~= 1
            % enqueue unexplored neighbour
            queue = [queue; neighbour(1) neighbour(2)];
            SolutionMap(neighbour(1), neighbour(2)) = SolutionMap(x,y) + 1;
            
            % mark current neighbour as visited
            visited(neighbour(1), neighbour(2)) = 1;
            
        end
        
        if visited(SearchGoal(1), SearchGoal(2)) == 1
            disp('done!')
            break
        end
        
        
    end
end
        
% visualize the solution map (g values)
SolutionMap
imagesc(SolutionMap)
set(gca,'dataAspectRatio',[1 1 1])