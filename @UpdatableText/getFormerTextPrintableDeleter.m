function output = getFormerTextPrintableDeleter(obj)
  output = repmat('\b',1,obj.lastPrintLength);
end