function printPercent(obj,fraction)
  obj.percent = ['(' sprintf('%.2f',100*fraction) '%%)'];
  obj.print();
end