ls ~/X &> /dev/null || ln -s /dev/null ~/X
ls ~/_ &> /dev/null || ln -s ~/PA2/rooms ~/_
cd ~/PA2;sudo rm -rf rooms;tar -xf rooms.tar
cd rooms/receivingRoom;PS1=">"

alias x='cat'
alias score='echo You have scored `(cd ~/_/treasureRoom; ls *[gcmts][oei][nl][vedu]* 2>~/X| wc -l 2>~/X)`0 points.'
alias quit='score ;exit '
alias nogo='echo You cannot go that way.'
alias n='basename `pwd` | fgrep -hw "s" -&>~/X && cd .. || cd n&>~/X && disp || nogo'
alias nw='basename `pwd` | fgrep -hw "se" -&>~/X && cd ..|| cd nw&>~/X && disp|| nogo'
alias e='basename `pwd` | fgrep -hw "w" -&>~/X && cd .. || cd e&>~/X && disp || nogo'
alias d='basename `pwd` | fgrep -hw "u" -&>~/X && cd .. || cd d&>~/X && disp || nogo'
alias s='basename `pwd` | fgrep -hw "n" -&>~/X && cd .. || cd s&>~/X && disp || nogo'
alias sw='basename `pwd` | fgrep -hw "ne" -&>~/X && cd ..|| cd sw&>~/X && disp|| nogo'
alias w='basename `pwd` | fgrep -hw "e" -&>~/X && cd .. || cd w&>~/X && disp || nogo'
alias se='echo `ls` 2>~/X| fgrep -hwv "se" -&>~/X&& basename `pwd` | fgrep -hw "nw" -&>~/X && cd ..  || cd se&>~/X && disp || nogo'
alias ne='echo `ls` 2>~/X| fgrep -hwv "ne" -&>~/X&& basename `pwd` | fgrep -hw "sw" -&>~/X && cd ..  || cd ne&>~/X && disp || nogo'
alias u='echo `ls` 2>~/X| fgrep -hwv "u" -&>~/X&& basename `pwd` | fgrep -hw "d" -&>~/X && cd ..   || cd u&>~/X && disp || nogo'

alias l='mv 1 9&>~/X; disp'
alias disp='(basename `pwd` |xargs ls -l 2>~/X|cut -c1 2>~/X| fgrep -hw "l" - &>~/X&&cd ..)||echo a &> ~/X  &&(ls 1 2>~/X&& head -n1 description||cat description;(mv 9 1;dispmessages;))'
alias dispmessages='fgrep -hw `ls | cat -n | cut -c1-7 --complement | paste ~/_/es -` -h ~/_/There | cut -d";" -f1; ls > /dev/null'

alias i='echo You currently have:;(cd ~/_/i/i;ls | xargs -n1 echo "A" | fgrep -h "A " )'
alias getall='mv *[akrgvow][cxemptl][oeyslpird]* ~/_/i/_&>~/X||echo Nothing to take.; (cd ~/_/i/_;ls | xargs -n1 echo "Taken: a" | fgrep -h "Taken: a ")&&mv ~/_/i/_/* ~/_/i/i&>~/X'
alias dropweight='(cd ~/i/i/;ls weight &>~/X)&& pwd | fgrep -h "Room/e/n/e" -&>~/X&& cd ..&& (mv d .d;ln -s ~/_/buttonRoom d);(cd ~/i/i/;ls weight &>~/X||echo "You do not have that.";(mv ~/i/i/weight .))&&(echo `ls` 2>~/X| fgrep -hw "button" -&>~/X)&& echo "A passageway opens.")2>~/X'
alias press='(cat | fgrep -hw "passageway" -&>~/X&& cat button || echo "You cannot press that.") <'
alias put='echo `ls` 2>~/X|fgrep -hw "urinal" - &>~/X&&(mv ~/_/i/i/*[gcmts][oei][nl][vedu]* ~/_ && echo "You hear it plop down in some water below."||echo "No treasure to put into it.")||( echo `ls` 2>~/X|fgrep -hw "chute" - &>~/X&&(mv ~/_/i/i/*[gcmts][oei][nl][vedu]* ~/_/treasureRoom && echo "You hear it slide down the chute and off into the distance."||echo "No treasure to put into it."))||echo "Nothing to put treasures into."'
alias flush='echo `ls` 2>~/X|fgrep -hw "urinal" &>~/X&& echo "Whoooosh!!" ||echo "I see nothing to flush.";mv ~/_/*[gcmts][oei][nl][vedu]* ~/_/treasureRoom && score'

l