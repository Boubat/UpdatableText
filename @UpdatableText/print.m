function print(obj,newText)
  newText = [obj.prefix newText obj.suffix];
  deleteFormerText = repmat('\b',1,obj.lastPrintLength);
  newPrintLength = fprintf([deleteFormerText newText]);
  % newPrintLength also counts printed backspaces (\b) positively
  obj.lastPrintLength = newPrintLength - obj.lastPrintLength;
end