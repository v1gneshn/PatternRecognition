%q3
text1='MATLAB is a program for solving engineering and mathematical problems. The basic MATLAB objects are vectors and matrices, so you must be familiar with these before making extensive use of this program.';
text2="MATLAB works with essentially one kind of object, a rectangular numerical matrix. Here is some basic information on using MATLAB matrix commands.";
text1_dot=regexp(lower(text1),'\.','split');
text1_comma=regexp([text1_dot{:}],'\,','split');
text1_final=regexp([text1_comma{:}],' ','split')'; 
[val1,unique_1, original_1] = unique(text1_final);
n1 = accumarray(original_1,1);
out1=table(val1,n1);
text2_dot=regexp(lower(text2),'\.','split');
text2_comma=regexp([text2_dot{:}],'\,','split');
text2_final=regexp([text2_comma{:}],' ','split')';
[val2,unique_2, original_2] = unique(text2_final);
n2 = accumarray(original_2,1);
out2=table(val2,n2);
val=unique([val1',val2']);
diff1=setdiff(val,val1);
diff2=setdiff(val,val2);

val_1=[val1',diff1];
n_1=[n1',zeros(size(diff1))];
out_1=containers.Map(val_1,n_1);
keys_1 = out_1.keys;
values_1 = out_1.values;
[sortedKeys_1, sortIdx] = sort( keys_1 );
sortedValues_1 =  cell2mat(values_1( sortIdx ));

val_2=[val2',diff2];
n_2=[n2',zeros(size(diff2))];
out_2=containers.Map(val_2,n_2);
keys_2 = out_2.keys;
values_2 = out_2.values;
[sortedKeys_2, sortIdx] = sort( keys_2 );
sortedValues_2 = cell2mat(values_2( sortIdx ));

dotproduct=sortedValues_1.*sortedValues_2;
inp1=(sum(sortedValues_1.^2))^0.5;
inp2=(sum(sortedValues_2.^2))^0.5;
cosine_angle=sum(dotproduct)/(inp1*inp2)
cosine_distance=1-cosine_angle