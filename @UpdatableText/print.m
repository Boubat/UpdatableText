function print(obj,varargin)
  if nargin == 2
    obj.text = varargin{1}; 
  end

  newPrintText = [obj.getFormerTextPrintableDeleter(),...
    obj.prefix,... 
    obj.text,... 
    obj.percent,...
    obj.progressBar,...
    obj.suffix];
  newPrintLength = fprintf(newPrintText);

  obj.lastPrintLength = newPrintLength - obj.lastPrintLength;
end