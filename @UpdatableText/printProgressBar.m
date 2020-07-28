function printProgressBar(obj,fraction,varargin)
  % The length of the progress bar is the only optional argument.
  % The progress bar default length is 20 characters.

  if nargin == 3
    progressBarLength = varargin{1};
  else
    progressBarLength = 20;
  end

  numberOfProgressCharacters = fix(progressBarLength*fraction);
  obj.progressBar = ['[',...
   repmat('=',1,numberOfProgressCharacters),...
   repmat(' ',1,progressBarLength-numberOfProgressCharacters),...
   ']'];
  
  obj.print();
end