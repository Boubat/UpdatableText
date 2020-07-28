maxIteration = 6000;



greetings = UpdatableText;
welcomeMessage = 'This demo is about to start';
for i = 1:length(welcomeMessage)
  greetings.print(welcomeMessage(1:i));
  pause(0.05);
end
pause(1);
for i = 1:length(welcomeMessage)
  greetings.print(welcomeMessage(1:end-i));
  pause(0.05);
end
welcomeMessage = {'Let''s' 'go'};
for i = 1:length(welcomeMessage)
  greetings.print(welcomeMessage{i});
  pause(0.4);
end
greetings.erase();




elapsedTime = UpdatableText('Elapsed time: ',' milliseconds.');
tic
for i = 1:maxIteration
  elapsedTime.print(num2str(i));
  pause(0.001);
end
toc
fprintf('\n')



progression = UpdatableText('',' Progression in percent.');
tic
for i = 1:maxIteration
  progression.printPercent(i/maxIteration);
  pause(0.001);
end
toc
fprintf('\n')



progression = UpdatableText('',' Progression with default progress bar.');
tic
for i = 1:maxIteration
  progression.printProgressBar(i/maxIteration);
  pause(0.001);
end
toc
fprintf('\n')



progression = UpdatableText('',' Progression in percent and a 5 characters long progress bar.');
tic
for i = 1:maxIteration
  progression.printPercent(i/maxIteration);
  progression.printProgressBar(i/maxIteration,5);
  pause(0.001);
end
toc
fprintf('\n')



progression = UpdatableText('',' Progression in percent and a 50 characters long progress bar.');
tic
for i = 1:maxIteration
  progression.printPercent(i/maxIteration);
  progression.printProgressBar(i/maxIteration,50);
  pause(0.001);
end
toc
fprintf('\n')



progression = UpdatableText('',' Progression in percent, default progress bar and special iteration printed out.');
tic
for i = 1:maxIteration
  progression.printPercent(i/maxIteration);
  progression.printProgressBar(i/maxIteration);
  if not(mod(i,1000))
    progression.printAbove(sprintf('Step %d completed',i));
  end
  pause(0.001);
end
toc
fprintf('\n')



outerProgression = UpdatableText('Outer loop ');
innerProgression = UpdatableText('Inner loop ');
outerProgression.print('0/6 ');
outerProgression.printProgressBar(0,6);
tic
for i = 1:6
  for j = 1:100
    innerProgression.print(sprintf('step %d ',i));
    innerProgression.printPercent(j/100);
    pause(0.01);
  end
  innerProgression.erase();
  outerProgression.print(sprintf('%d/%d ',i,6));
  outerProgression.printProgressBar(i/6,6);
  innerProgression.print();
end
toc
fprintf('\n')