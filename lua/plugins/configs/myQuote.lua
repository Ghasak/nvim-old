--
--          ███╗░░██╗██╗░░░██╗██╗███╗░░░███╗  ░██████╗░█████╗░██╗███╗░░██╗███████╗░█████╗░███████╗
--          ████╗░██║██║░░░██║██║████╗░████║  ██╔════╝██╔══██╗██║████╗░██║██╔════╝██╔══██╗██╔════╝
--          ██╔██╗██║╚██╗░██╔╝██║██╔████╔██║  ╚█████╗░██║░░╚═╝██║██╔██╗██║█████╗░░██║░░╚═╝█████╗░░
--          ██║╚████║░╚████╔╝░██║██║╚██╔╝██║  ░╚═══██╗██║░░██╗██║██║╚████║██╔══╝░░██║░░██╗██╔══╝░░
--          ██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║  ██████╔╝╚█████╔╝██║██║░╚███║███████╗╚█████╔╝███████╗
--          ╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝  ╚═════╝░░╚════╝░╚═╝╚═╝░░╚══╝╚══════╝░╚════╝░╚══════╝
--
--                       ░██████╗░██╗░░░██╗░█████╗░████████╗███████╗░██████╗
--                       ██╔═══██╗██║░░░██║██╔══██╗╚══██╔══╝██╔════╝██╔════╝
--                       ██║██╗██║██║░░░██║██║░░██║░░░██║░░░█████╗░░╚█████╗░
--                       ╚██████╔╝██║░░░██║██║░░██║░░░██║░░░██╔══╝░░░╚═══██╗
--                       ░╚═██╔═╝░╚██████╔╝╚█████╔╝░░░██║░░░███████╗██████╔╝
--                       ░░░╚═╝░░░░╚═════╝░░╚════╝░░░░╚═╝░░░╚══════╝╚═════╝░
--
-- Check: https://raw.githubusercontent.com/erossignon/qod4outlook/master/quotes.txt

math.randomseed( os.time() ) -- For random header.

local QUOTS = {
{ "“ Dogs have Owners, Cats have Staff.”"};
{ "“ I do not fear computers. I fear lack of them.” – Isaac Asimov "};
{ "“ A computer once beat me at chess, but it was no match for me at kick boxing.” – Emo Philips "};
{ "“ Computer Science is no more about computers than astronomy is about telescopes.” – Edsger W. Dijkstra "};
{ "“ The computer was born to solve problems that did not exist before.” – Bill Gates "};
{ "“ Software is a gas; it expands to fill its container.” – Nathan Myhrvold "};
{"“ Standards are always out of date.  That’s what makes them standards.” – Alan Bennett "};
{" “I do not fear computers. I fear lack of them.” – Isaac Asimov"};
{" “Dogs have Owners, Cats have Staff.”"};
{" “A computer once beat me at chess, but it was no match for me at kick boxing.” – Emo Philips"};
{" “Computer Science is no more about computers than astronomy is about telescopes.” – Edsger W. Dijkstra"};
{" “The computer was born to solve problems that did not exist before.” – Bill Gates"};
{" “Software is a gas; it expands to fill its container.” – Nathan Myhrvold"};
{" “Standards are always out of date.  That’s what makes them standards.” – Alan Bennett"};
{" “Physics is the universe’s operating system.”  – Steven R Garman"};
{" “It’s hardware that makes a machine fast.  It’s software that makes a fast machine slow.” – Craig Bruce"};
{" “The greatest enemy of knowledge is not ignorance, it is the illusion of knowledge.” – Stephen Hawking"};
{" “The more you know, the more you realize you know nothing.” – Socrates"};
{" “Tell me and I forget.  Teach me and I remember.  Involve me and I learn.” – Benjamin Franklin"};
{" “Real knowledge is to know the extent of one’s ignorance.” – Confucius"};
{" “If people never did silly things, nothing intelligent would ever get done.” – Ludwig Wittgenstein"};
{" “Getting information off the Internet is like taking a drink from a fire hydrant.”– Mitchell Kapor"};
{" “If you think your users are idiots, only idiots will use it.”– Linus Torvalds"};
{" “From a programmer’s point of view, the user is a peripheral that types when you issue a read request.” – P. Williams"};
{" “Where is the ‘any’ key?” – Homer Simpson, in response to the message, “Press any key”"};
{" “Computers are good at following instructions, but not at reading your mind.” – Donald Knuth"};
{" “There is only one problem with common sense; it’s not very common.” – Milt Bryce"};
{" “Your most unhappy customers are your greatest source of learning.” – Bill Gates"};
{" “The Internet?  We are not interested in it.” – Bill Gates, 1993"};
{" “The best way to get accurate information on Usenet is to post something wrong and wait for corrections.” – Matthew Austern"};
{" “In a room full of top software designers, if two agree on the same thing, that’s a majority.” – Bill Curtis"};
{" “Programs must be written for people to read, and only incidentally for machines to execute.”– Abelson and Sussman"};
{" “We have to stop optimizing for programmers and start optimizing for users.” – Jeff Atwood"};
{" “Low-level programming is good for the programmer’s soul.”– John Carmack"};
{" “It’s OK to figure out murder mysteries, but you shouldn’t need to figure out code.  You should be able to read it.”    – Steve McConnell"};
{" “If we wish to count lines of code, we should not regard them as ‘lines produced’ but as ‘lines spent.’”– Edsger Dijkstra"};
{" “Programming can be fun, so can cryptography; however they should not be combined.”– Kreitzberg and Shneiderman"};
{" “Before software should be reusable, it should be usable.”– Ralph Johnson"};
{" “If you automate a mess, you get an automated mess.”– Rod Michael"};
{" “Looking at code you wrote more than two weeks ago is like looking at code you are seeing for the first time.”– Dan Hurvitz"};
{" “It is easier to change the specification to fit the program than vice versa.”– Alan Perlis"};
{" “Code generation, like drinking alcohol, is good in moderation.”– Alex Lowe"};
{" “Simplicity, carried to the extreme, becomes elegance.”– Jon Franklin"};
{" “A program is never less than 90% complete, and never more than 95% complete.”– Terry Baker"};
{" “The best way to predict the future is to implement it.”– David Heinemeier Hansson"};
{" “We need above all to know about changes; no one wants or needs to be reminded 16 hours a day that his shoes are on.”– David Hubel"};
{" “Make everything as simple as possible, but not simpler.”– Albert Einstein"};
{" “Today, most software exists, not to solve a problem, but to interface with other software.”– IO Angell"};
{" “Good specifications will always improve programmer productivity far better than any programming tool or technique.”– Milt Bryce"};
{" “The difference between theory and practice is that in theory, there is no difference between theory and practice.”– Richard Moore"};
{" “Don’t document the problem, fix it.”– Atli Björgvin Oddsson"};
{" “As a rule, software systems do not work well until they have been used, and have failed repeatedly, in real applications.”– Dave Parnas"};
{" “If the code and the comments do not match, possibly both are incorrect.”– Norm Schryer"};
{" “I think it’s a new feature.  Don’t tell anyone it was an accident.”– Larry Wall"};
{" “If you don’t handle [exceptions], we shut your application down.  That dramatically increases the reliability of the system.”– Anders Hejlsberg"};
{" “When debugging, novices insert corrective code; experts remove defective code.”– Richard Pattis"};
{" “In a software project team of 10, there are probably 3 people who produce enough defects to make them net negative producers.”– Gordon Schulmeyer"};
{" “I think it is inevitable that people program poorly.  Training will not substantially help matters.  We have to learn to live with it.”– Alan Perlis"};
{" “Program testing can be a very effective way to show the presence of bugs, but is hopelessly inadequate for showing their absence.”– Edsger Dijkstra"};
{" “There’s no obfuscated Perl contest because it’s pointless.”– Jeff Polk"};
{" “Java is the most distressing thing to hit computing since MS-DOS.”– Alan Kay"};
{" “There are only two things wrong with C++:  The initial concept and the implementation.”– Bertrand Meyer"};
{" “It was a joke, okay?  If we thought it would actually be used, we wouldn’t have written it!”– Mark Andreesen, speaking of the HTML tag BLINK"};
{" “Web Services are like teenage sex.  Everyone is talking about doing it, and those who are actually doing it are doing it badly.”– Michelle Bustamante"};
{" “Perl: The only language that looks the same before and after RSA encryption.”– Keith Bostic"};
{" “XML is not a language in the sense of a programming language any more than sketches on a napkin are a language.” – Charles Simonyi"};
{" “BASIC is to computer programming as QWERTY is to typing.”– Seymour Papert"};
{" “It has been discovered that C++ provides a remarkable facility for concealing the trivial details of a program — such as where its bugs are.”– David Keppel"};
{" “UNIX is simple.  It just takes a genius to understand its simplicity.”– Dennis Ritchie"};
{" “Some people, when confronted with a problem, think ‘I know, I’ll use regular expressions.’  Now they have two problems.”– Jamie Zawinski"};
{" “The only truly secure system is one that is powered off, cast in a block of concrete and sealed in a lead-lined room with armed guards.”– Gene Spafford"};
{" “Being able to break security doesn’t make you a hacker anymore than being able to hotwire cars makes you an automotive engineer.”– Eric Raymond"};
{" “Companies spend millions of dollars on firewalls, encryption and secure access devices, and it’s money wasted, because none of these measures address the weakest link in the security chain.”– Kevin Mitnick"};
{" “If you think technology can solve your security problems, then you don’t understand the problems and you don’t understand the technology.”– Bruce Schneier"};
{" “Hoaxes use weaknesses in human behavior to ensure they are replicated and distributed.  In other words, hoaxes prey on the Human Operating System.”– Stewart Kirkpatrick"};
{" “Passwords are like underwear: you don’t let people see it, you should change it very often, and you shouldn’t share it with strangers.”– Chris Pirillo"};
{" “I am not out to destroy Microsoft, that would be a completely unintended side effect.”– Linus Torvalds"};
{" “Yes, we have a dress code. You have to dress.”– Scott McNealy, co-founder of Sun Microsystems"};
{" “In an information economy, the most valuable company assets drive themselves home every night.  If they are not treated well, they do not return the next morning.”– Peter Chang"};
{" “It’s better to wait for a productive programmer to become available than it is to wait for the first available programmer to become productive.”– Steve McConnell"};
{" “I’m not one of those who think Bill Gates is the devil.  I simply suspect that if Microsoft ever met up with the devil, it wouldn’t need an interpreter.”– Nicholas Petreley"};
{" “Two years from now, spam will be solved.”– Bill Gates, 2004"};
{" “The problem of viruses is temporary and will be solved in two years.”– John McAfee, 1988"};
{" “Computer viruses are an urban legend.”– Peter Norton, 1988"};
{" “In 2031, lawyers will be commonly a part of most development teams.”– Grady Booch"};
{" “I don’t know what the language of the year 2000 will look like, but I know it will be called Fortran.”– CA Hoare, 1982"};
{" “In the future, computers may weigh no more than 1.5 tonnes.”– Popular mechanics, 1949"};
{" “I see little commercial potential for the Internet for at least ten years.”– Bill Gates, 1994"};
{" “Before man reaches the moon, mail will be delivered within hours from New York to California, to Britain, to India or Australia.”– Arthur Summerfield, 1959, United States Post"};
{" “The best way to predict the future is to implement it.” That is the spirit that has made computers and the internet what it is today."};
{" “in a room where people think similar – not much thinking is done…” =))"};
{" “It’s hardware that makes a machine fast. It’s software that makes a fast machine slow.”– Craig Bruce"};
{" “Computers are useless.  They can only give you answers.”(Pablo Picasso)"};
{" “Computers are like bikinis. They save people a lot of guesswork.”(Sam Ewing)"};
{" “They have computers, and they may have other weapons of mass destruction.”(Janet Reno)"};
{" “The question of whether computers can think is like the question of whether submarines can swim.”(Edsger W. Dijkstra)"};
{" “The city’s central computer told you?  R2D2, you know better than to trust a strange computer!”(C3PO)"};
{" “Never trust a computer you can’t throw out a window.”(Steve Wozniak)"};
{" “Hardware: The parts of a computer system that can be kicked.”(Jeff Pesis)"};
{" “Most software today is very much like an Egyptian pyramid with millions of bricks piled on top of each other, with no structural integrity, but just done by brute force and thousands of slaves.”(Alan Kay)"};
{" “I’ve finally learned what ‘upward compatible’ means.  It means we get to keep all our old mistakes.”(Dennie van Tassel)"};
{" “There are two major products that come out of Berkeley: LSD and UNIX.  We don’t believe this to be a coincidence.”(Jeremy S. Anderson)"};
{" “19 Jan 2038 at 3:14:07 AM”(End of the word according to Unix–2^32 seconds after January 1, 1970)"};
{" “Every operating system out there is about equal… We all suck.”(Microsoft senior vice president Brian Valentine describing the state of the art in OS security, 2003)"};
{" “Microsoft has a new version out, Windows XP, which according to everybody is the ‘most reliable Windows ever.‘  To me, this is like saying that asparagus is ‘the most articulate vegetable ever.‘ “(Dave Barry)"};
{" “The Internet?  Is that thing still around?”  (Homer Simpson)"};
{" “The Web is like a dominatrix.  Everywhere I turn, I see little buttons ordering me to Submit.”(Nytwind)"};
{" “Come to think of it, there are already a million monkeys on a million typewriters, and Usenet is nothing like Shakespeare.”(Blair Houghton)"};
{" “The most amazing achievement of the computer software industry is its continuing cancellation of the steady and staggering gains made by the computer hardware industry.”(Henry Petroski)"};
{" “True innovation often comes from the small startup who is lean enough to launch a market but lacks the heft to own it.”(Timm Martin)"};
{" “It is not about bits, bytes and protocols, but profits, losses and margins.”(Lou Gerstner)"};
{" “We are Microsoft.  Resistance Is Futile.  You Will Be Assimilated.”(Bumper sticker)"};
{" “The bulk of all patents are crap.  Spending time reading them is stupid.  It’s up to the patent owner to do so, and to enforce them.”Linus Torvalds)"};
{" “Controlling complexity is the essence of computer programming.”(Brian Kernigan)"};
{" “The function of good software is to make the complex appear to be simple.”(Grady Booch)"};
{" “Any fool can use a computer.  Many do.”(Ted Nelson)"};
{" “There are only two industries that refer to their customers as ‘users’.”(Edward Tufte)"};
{" “Most of you are familiar with the virtues of a programmer.  There are three, of course: laziness, impatience, and hubris.”(Larry Wall)"};
{" “The trouble with programmers is that you can never tell what a programmer is doing until it’s too late.”(Seymour Cray)"};
{" “That’s the thing about people who think they hate computers.  What they really hate is lousy programmers.”(Larry Niven)"};
{" “Don’t worry if it doesn’t work right.  If everything did, you’d be out of a job.”(Mosher’s Law of Software Engineering)"};
{" “Measuring programming progress by lines of code is like measuring aircraft building progress by weight.”(Bill Gates)"};
{" “Writing code has a place in the human hierarchy worth somewhere above grave robbing and beneath managing.”(Gerald Weinberg)"};
{" “First learn computer science and all the theory.  Next develop a programming style.  Then forget all that and just hack.”(George Carrette)"};
{" “First, solve the problem. Then, write the code.”(John Johnson)"};
{" “Optimism is an occupational hazard of programming; feedback is the treatment.”(Kent Beck)"};
{" “To iterate is human, to recurse divine.”(L. Peter Deutsch)"};
{" “The best thing about a boolean is even if you are wrong, you are only off by a bit.”(Anonymous)"};
{" “Should array indices start at 0 or 1?  My compromise of 0.5 was rejected without, I thought, proper consideration.”(Stan Kelly-Bootle)"};
{" “There are only two kinds of programming languages: those people always bitch about and those nobody uses.”(Bjarne Stroustrup)"};
{" “The use of COBOL cripples the mind; its teaching should therefore be regarded as a criminal offense.”(E.W. Dijkstra)"};
{" “I think Microsoft named .Net so it wouldn’t show up in a Unix directory listing.”(Oktal)"};
{" “There is no programming language–no matter how structured–that will prevent programmers from making bad programs.”(Larry Flon)"};
{" “Computer language design is just like a stroll in the park.  Jurassic Park, that is.”(Larry Wall)"};
{" “Fifty years of programming language research, and we end up with C++?”(Richard A. O’Keefe)"};
{" “Writing in C or C++ is like running a chain saw with all the safety guards removed.”(Bob Gray)"};
{" “In C++ it’s harder to shoot yourself in the foot, but when you do, you blow off your whole leg.”(Bjarne Stroustrup)"};
{" “C++ : Where friends have access to your private members.”(Gavin Russell Baker)"};
{" “One of the main causes of the fall of the Roman Empire was that–lacking zero–they had no way to indicate successful termination of their C programs.”(Robert Firth)"};
{" “Java is, in many ways, C++–.”(Michael Feldman)"};
{" “Saying that Java is nice because it works on all OSes is like saying that anal sex is nice because it works on all genders.”(Alanna)"};
{" “If Java had true garbage collection, most programs would delete themselves upon execution.”(Robert Sewell)"};
{" “Software is like sex: It’s better when it’s free.”(Linus Torvalds)"};
{" “The only people who have anything to fear from free software are those whose products are worth even less.”(David Emery)"};
{" “Good code is its own best documentation.”(Steve McConnell)"};
{" “Any code of your own that you haven’t looked at for six or more months might as well have been written by someone else.”(Eagleson’s Law)"};
{" “Good programmers use their brains, but good guidelines save us having to think out every case.”(Francis Glassborow)"};
{" “You can’t have great software without a great team, and most software teams behave like dysfunctional families.”(Jim McCarthy)"};
{" “If debugging is the process of removing bugs, then programming must be the process of putting them in.”(Edsger W. Dijkstra)"};
{" “I don’t care if it works on your machine!  We are not shipping your machine!”(Vidiu Platon)"};
{" “Programming is like sex: one mistake and you’re providing support for a lifetime.”(Michael Sinz)"};
{" “There are two ways to write error-free programs; only the third one works.”(Alan J. Perlis)"};
{" “You can either have software quality or you can have pointer arithmetic, but you cannot have both at the same time.”(Bertrand Meyer)"};
{" “Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.”(Martin Golding)"};
{" “To err is human, but to really foul things up you need a computer.”(Paul Ehrlich)"};
{" “A computer lets you make more mistakes faster than any invention in human history–with the possible exceptions of handguns and tequila.”(Mitch Radcliffe)"};
{" “Everything that can be invented has been invented.” (Charles H. Duell, Commissioner, U.S. Office of Patents, 1899)"};
{" “I think there’s a world market for about 5 computers.” (Thomas J. Watson, Chairman of the Board, IBM, circa 1948)"};
{" “But what is it good for?” (Engineer at the Advanced Computing Systems Division of IBM, commenting on the microchip, 1968)"};
{" “There is no reason for any individual to have a computer in his home.” (Ken Olson, President, Digital Equipment Corporation, 1977)"};
{" “640K ought to be enough for anybody.” (Bill Gates, 1981)"};
{" “Windows NT addresses 2 Gigabytes of RAM, which is more than any application will ever need.” (Microsoft, on the development of Windows NT, 1992)"};
{" “We will never become a truly paper-less society until the Palm Pilot folks come out with WipeMe 1.0.”    (Andy Pierson)"};
{" “If it keeps up, man will atrophy all his limbs but the push-button finger.”(Frank Lloyd Wright)"};
{" ere are so many men who can figure costs, and so few who can measure values.  ~Author UnknownTh"};
{" e most dangerous kind of waste is the waste we do not recognize.  ~Shigeo ShingoTh"};
{" ur lean process should be a lean process.  ~Author UnknownYo"};
{" ere is nothing so useless as doing efficiently that which should not be done at all.  ~Peter F. DruckerTh"};
{"  you need a new process and don't install it, you pay for it without getting it.  ~Ken StorkIf"};
{" erything can be improved.  ~Clarence W. BarronEv"};
{" llful waste brings woeful want.  ~Thomas FullerWi"};
{" ateurs work until they get it right.  Professionals work until they can't get it wrong.  ~Author UnknownAm"};
{" ture does constant value stream mapping - it's called evolution.  ~Carrie LatetNa"};
{" n't waste time learning the tricks of the trade.  Instead, learn the trade.  ~James CharltonDo"};
{" ste is a tax on the whole people.  ~Albert W. AtwoodWa"};
{" en solving problems, dig at the roots instead of just hacking at the leaves.  ~Anthony J. D'Angelo, The College Blue BookWh"};
{" bad system will beat a good person every time.  ~W. Edwards DemingA "};
{"  are too busy mopping the floor to turn off the faucet.  ~Author UnknownWe"};
{" tch the little things; a small leak will sink a great ship.  ~Benjamin FranklinWa"};
{" e essential question is not, How busy are you? but What are you busy at?  ~Oprah WinfreyTh"};
{" relentless barrage of why’s is the best way to à your mind to pierce the clouded veil of thinking caused by the status quo.  Use it often.  ~Shigeo ShingoA"} ;
{" e world we have created is a product of our thinking; it cannot be changed without changing our thinking.  ~Albert EinsteinTh"};
{"  you don't know where you are going, you will probably end up somewhere else.  ~Lawrence J. PeterIf"};
{" provement usually means doing something that we have never done before.  ~Shigeo ShingoIm"};
{" rk expands so as to fill the time available for its completion.  ~C. Northcote Parkinson, 1958"};
{"  environment where people have to think brings with it wisdom, and this wisdom brings with it kaizen [continuous improvement].  ~Teruyuki MinouraAn"};
{" e impossible is often the untried.  ~Jim GoodwinTh"};
{" e man who will use his skill and constructive imagination to see how much he can give for a dollar, instead of how little he can give for a dollar, is bound to succeed.  ~Henry FordTh"};
{" eat ideas need landing gear as well as wings.  ~C.D. JacksonGr"};
{" fferent isn't always better, but better is always different.  ~Author UnknownDi"};
{"  who rejects change is the architect of decay.  The only human institution which rejects progress is the cemetery.  ~Harold WilsonHe"};
{" vest a few moments in thinking.  It will pay good interest.  ~Author UnknownIn"};
{" n't water your weeds.  ~Harvey MacKayDo"};
{" u must have long-range goals to keep you from being frustrated by short-range failures.  ~Charles C. NobleYo"};
{" don't like a man to be too efficient.  He's likely to be not human enough.  ~Felix FrankfurterI "};
{"  all efficiency experts were laid end to end - I'd be in favor of it.  ~Al DiamondIf"};
{" e half of knowing what you want is knowing what you must give up before you get it.  ~Sidney HowardOn"};
{" shall try to correct errors when shown to be errors, and I shall adopt new views so fast as they appear to be true views.  ~Abraham LincolnI"};
{"  is better to stir up a question without deciding it, than to decide it without stirring it up.  ~Joseph JoubertIt"};
{" uality is everyone's responsibility.” W. Edwards Deming"};
{" “It is not enough to do your best; you must know what to do, and then do your best.” W. Edwards Deming"};
{" “Profit in business comes from repeat customers, customers that boast about your project or service, and that bring friends with them.” W. Edwards Deming"};
{" “If you can't describe what you are doing as a process, you don't know what you're doing.”W. Edwards Deming"};
{" ou can not inspect quality into the product; it is already there.” W. Edwards Deming"};
{" t does not happen all at once. There is no instant pudding.” W. Edwards Deming"};
{" “If you stay in this world, you will never learn another one.” W. Edwards Deming"};
{" “Does experience help? NO! Not if we are doing the wrong things.” W. Edwards Deming"};
{" “The result of long-term relationships is better and better quality, and lower and lower costs.”W. Edwards Deming"};
{" “We are here to make another world.” W. Edwards Deming"};
{" n’t be afraid to make mistakes.” Sakichi Toyoda (Osono et al 2008, 67)"};
{" “If you’re 60 percent sure, take action.” (Osono et al 2008, 86)"};
{" efore you say you can’t do something, try it.” Sakichi Toyoda (Osono et al 2008, 86)"};
{" “I have seen more failures than successes.” Sakichi Toyoda (Osono et al 2008, 87)"};
{" “We have to waste resources by trying many things when we are unsure of which are best.” Toyota Chairman Fujio Cho (Osono et al 2008, 207)"};
{" “There’s got to be a better way” Top Toyota Executives (Osono et al 2008, 15)"};
{" “Reform business when business is good.” Former Toyota Chairman and President Hiroshi Okuda (Osono et al 2008, 15)"};
{" change is bad” Toyota President Katsuaki Watanabe (Osono et al 2008, 15)"};
{" “always optimizing” Toyota Value (Osono et al 2008, 45)"};
{" “Action at the Source” Suzuki (Osono et al 2008, 53)"};
{" “Let’s give it a try.” Sakichi Toyoda, President of Toyoda Automatic Loom Works (parent company to Toyota) (Osono et al 2008, 67)"};
{" “Don’t be afraid to make mistakes.” Sakichi Toyoda (Osono et al 2008, 67)"};
{" “Simplicity is the ultimate sophistication”- Leonardo da Vinci"};
{" ”Simplicity does not precede complexity, but follows it” - Alan Perlis"};
{" ”Productivity is being able to do things that you were never able to do before” - Franz Kafka"};
{" ~ Innovation is the process of turning ideas into manufacturable and marketable form. ~Watts Humprey"};
{" ~ Creativity is thinking up new things. Innovation is doing new things. ~Theodore Levitt"};
{" ~ Never before in history has innovation offered promise of so much to so many in so short a time. ~Bill Gates"};
{" ~ Great innovations should not be forced on slender majorities. ~Thomas Jefferson"};
{" ~ Fashion is something barbarous, for it produces innovation without reason and imitation without benefit. ~George Santayana"};
{" ~ You have all the reason in the world to achieve your grandest dreams. Imagination plus innovation equals realization. ~Denis Waitley"};
{" ~ Entrepreneurs innovate. Innovation is the specific instrument of entrepreneurship. It is the act that endows resources with a new capacity to create wealth. ~Peter F. Drucker"};
{" ~ The world leaders in innovation and creativity will also be world leaders in everything else. ~ Harold R. McAlindon"};
{" ~ Innovation is not the product of logical thought, although the result is tied to logical structure. ~ Albert Einstein"};
{" “Shoot for the moon. Even if you miss, you'll land among the stars.”"};
}


-- Icons for the different levels
-- ERROR
-- WARN
-- INFO
-- DEBUG
-- TRACE
local x = math.random(#QUOTS)
local async =require("plenary.async")
local notify =require("notify").async
--vim.notify(file)
async.run(function()
    local messege = QUOTS[x]
    notify(messege, "INFO", {title = " Ranom Science Quote ... "})
end)
