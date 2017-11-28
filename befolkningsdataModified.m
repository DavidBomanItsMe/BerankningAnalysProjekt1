% Befolkningsdata for Uppsala respektive Jamtland
% under aren 1805 till 2000

x=[1805:5:2000]';
y_Uppsala=[84141 80577 80099 80216 81897 81742 84777 85294 87700 89323 90877 ...
   92536 96766 100519 104371 111019 116406 121091 123015 123863 ...
   125610 128171 132400 136718 139954 138201 139155 138098 146415 ...
   154660 161383 167722 184701 217730 230028 243585 251852 268835 ...
   288475 294196]';   
y_Jamtland=[31819 33179 35015 36894 39122 42225 44239 45769 49077 52271 56127 ...
   61218 68071 70463 75756 83623 93091 100455 104259 111391 113229 ...
   118115 124541 133536 136300 134514 136407 138722 143213 144063 ...
   144393 139799 130848 125243 133433 134934 134190 135726 135584 ...
   129566]'; 

A=[x.^2 x ones(40,1)];

AT = transpose(A);

ATA = AT*A;

ATy = AT*y_Uppsala;

ATy_uppsala = AT*y_Uppsala;

ATy_Jamtland = AT*y_Jamtland;

K = cond(ATA);

xNew = (x - 1900);

ANew = [xNew.^2 xNew ones(40, 1)];

ANewT = transpose(ANew);

ANewTANew = ANewT * ANew;

KNew = cond(ANewTANew);

ANewTy_Uppsala = ANewT * y_Uppsala;

c = [ANewTANew ANewTy_Uppsala];

answer1_Uppsala = ANewTANew \ ANewTy_Uppsala;

ANewTy_Jamtland = ANewT * y_Jamtland;

answer1_Jamtland = ANewTANew \ ANewTy_Jamtland;

funUppsala = polyval(answer1_Uppsala, xNew);
plot(x, funUppsala, '*');

funJamtland = polyval(answer1_Jamtland, xNew);
plot(x, funJamtland, '*');

plot(x,y_Uppsala,'*');
hold on
plot(x,y_Jamtland,'ro');
xlabel('Ar')
ylabel('Antal invanare')
title('Befolkningsdata')
legend('Uppsala','Jamtland','Location','NorthWest');
set(gca,'FontSize',16);