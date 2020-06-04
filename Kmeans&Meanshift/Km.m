function Ikm = Km(I,K) 

%% K-means Segmentation (K=Number of Clusters))

I = im2double(I);
F = reshape(I,size(I,1)*size(I,2),3);                 % Color Features
%% K-means
ClusterCenters = F( ceil(rand(K,1)*size(F,1)) ,:);             % Cluster Centers
DistanceAndLabels   = zeros(size(F,1),K+2);                         % Distances and Labels
KIterations   = 10;                                           % K-means Iteration
for n = 1:KIterations
   for i = 1:size(F,1)
      for j = 1:K  
        DistanceAndLabels(i,j) = norm(F(i,:) - ClusterCenters(j,:));      
      end
      [Distance, ClusterCenter] = min(DistanceAndLabels(i,1:K));                % 1:K are Distance from Cluster Centers 1:K 
      DistanceAndLabels(i,K+1) = ClusterCenter;                                % K+1 is Cluster Label
      DistanceAndLabels(i,K+2) = Distance;                          % K+2 is Minimum Distance
   end
   for i = 1:K
      A = (DistanceAndLabels(:,K+1) == i);                          % Cluster K Points
      ClusterCenters(i,:) = mean(F(A,:));                      % New Cluster Centers
      if sum(isnan(ClusterCenters(:))) ~= 0                    % If CENTS(i,:) Is Nan Then Replace It With Random Point
         NC = find(isnan(ClusterCenters(:,1)) == 1);           % Find Nan Centers
         for Ind = 1:size(NC,1)
         ClusterCenters(NC(Ind),:) = F(randi(size(F,1)),:);
         end
      end
   end
end

X = zeros(size(F));
for i = 1:K
idx = find(DistanceAndLabels(:,K+1) == i);
X(idx,:) = repmat(ClusterCenters(i,:),size(idx,1),1); 
end
Ikm = reshape(X,size(I,1),size(I,2),3);

end
