classdef UpdatableText < handle
% message = UpdatableText()
% message = UpdatableText(prefix)
% message = UpdatableText(prefix,suffix)
%
% Use the print(text) method to update the text printed in the command window.
% Handy if you can't or don't want to use the waitbar() function. 
% Prefix, text, and suffix are concatenated and used in a fprintf() call
% so format them to be fprintf() compliant.
% 
% Example:
%
%    maxIteration = 1000;
%    prefix = 'progression: (';
%    suffix = ['/' num2str(maxIteration) ')'];
%    progression = UpdatableText(prefix,suffix);
%
%    for i = 1:maxIteration
%      progression.print(num2str(i));
%      pause(0.1);
%    end
%
% Beware not to print anything else in the command window while
% an UpdatabaleText is being used since updating an UpdatableText
% deletes characters among the last printed characters.

  properties (Access = private)
    lastPrintLength = 0;
    prefix = '';
    suffix = '';
  end

  methods 

    function obj = UpdatableText(varargin)
      if nargin >= 1
        assert(ischar(varargin{1}),'The first argument must be a char array to set the prefix.');
        obj.prefix = (varargin{1});
      end
      if nargin >= 2
        assert(ischar(varargin{2}),'The second argument must be a char array to set the suffix.');
        obj.suffix = (varargin{2});
      end
    end

  end

end