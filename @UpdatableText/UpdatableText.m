classdef UpdatableText < handle
% message = UpdatableText()
% message = UpdatableText(prefix)
% message = UpdatableText(prefix,suffix)
%
% Use the print(text) method to update the text printed in the command window.
% Prefix, text, and suffix are concatenated and used in a fprintf() call
% so format them to be fprintf() compliant.
% 
% Example:
%
%   maxIteration = 1000;
%   prefix = 'Elapsed time: ';
%   suffix = ' milliseconds.';
%   elapsedTime = UpdatableText(prefix,suffix);
%   for i = 1:maxIteration
%     elapsedTime.print(num2str(i));
%     pause(0.001);
%   end
%
% A percentage value and/or a progress bar can be added with a provided
% fraction number.
% 
% Example:
%
%   maxIteration = 1000;
%   prefix = 'Elapsed milliseconds: ';
%   elapsedTime = UpdatableText(prefix);
%   for i = 1:maxIteration
%     elapsedTime.print(num2str(i));
%     elapsedTime.printPercent(i/maxIteration);
%     elapsedTime.printProgressBar(i/maxIteration);
%     pause(0.001);
%   end
%
% Text can be printed above the updated text.
% 
% Example:
%
%   maxIteration = 1000;
%   prefix = 'Elapsed milliseconds: ';
%   elapsedTime = UpdatableText(prefix);
%   for i = 1:maxIteration
%     elapsedTime.print(num2str(i));
%     elapsedTime.printPercent(i/maxIteration);
%     elapsedTime.printProgressBar(i/maxIteration);
%     if not(mod(i,100))
%       elapsedTime.printAbove(sprintf('%d milliseconds elapsed',i));
%     end
%     pause(0.001);
%   end
%
% Beware not to print anything else in the command window while
% an UpdatabaleText is being used since updating an UpdatableText
% deletes characters among the last printed characters.

  properties (Access = private)
    lastPrintLength = 0;

    prefix = '';
    text = '';
    percent = '';
    progressBar = '';
    suffix = '\n';
  end



  methods (Access = public)

    function obj = UpdatableText(varargin)
      if nargin >= 1
        assert(ischar(varargin{1}),'The first argument must be a char array to set the prefix.');
        obj.prefix = varargin{1};
      end
      if nargin >= 2
        assert(ischar(varargin{2}),'The second argument must be a char array to set the suffix.');
        obj.suffix = [varargin{2} '\n'];
      end
    end

  end



  methods (Access = private)

    formerTextDeleter = getFormerTextPrintableDeleter(obj);

  end

end