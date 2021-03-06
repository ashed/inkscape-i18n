=encoding UTF-8

=head1 NAME

Inkscape - SVG (Scalable Vector Graphics) редактор.

=head1 SYNOPSIS

C<inkscape [options] [filename ...]>

options:

    -?, --help        
        --usage       
    -V, --version

    -f, --file=FILENAME               

    -e, --export-png=FILENAME         
    -a, --export-area=x0:y0:x1:y1     
    -C, --export-area-page
    -D, --export-area-drawing
        --export-area-snap
    -i, --export-id=ID     
    -j, --export-id-only     
    -t, --export-use-hints
    -b, --export-background=COLOR     
    -y, --export-background-opacity=VALUE     
    -d, --export-dpi=DPI              
    -w, --export-width=WIDTH          
    -h, --export-height=HEIGHT        

    -P, --export-ps=FILENAME
    -E, --export-eps=FILENAME
    -A, --export-pdf=FILENAME
        --export-pdf-version=VERSION-STRING
        --export-latex

    --export-ps-level {2,3}

    -T, --export-text-to-path
        --export-ignore-filters

    -l, --export-plain-svg=FILENAME             

    -p, --print=PRINTER

    -I, --query-id=ID     
    -X, --query-x
    -Y, --query-y
    -W, --query-width
    -H, --query-height
    -S, --query-all

    -x, --extension-directory

        --verb-list
        --verb=VERB-ID
        --select=OBJECT-ID

        --shell

    -g, --with-gui                    
    -z, --without-gui                 

        --vacuum-defs

        --g-fatal-warnings

=head1 DESCRIPTION

B<Inkscape> это GUI редактор для B<Scalable Vector Graphics (SVG)> формата
рисования файлов, с возможностями сопоставимыми с B<Adobe Illustrator>,
B<CorelDraw>, B<Xara Xtreme>, и т.д. Особенности Inkscape включают в себя 
различные формы, контуры безье, свободное рисование, многострочный текст, 
текст по контуру, альфа-блендинг, произвольные аффинные преобразования, 
градиентные и паттерновые заливки, редактирование узлов, экспорт и импорт
множества форматов включая PNG и PDF, группировка, слои, живые клоны,
и многое другое.
Интерфейс разработан чтобы быть комфортабельным и эффективным для
опытных пользователей, оставаясь при этом совместимым со стандартами B<GNOME> 
так что пользователи знакомые с другими приложениями GNOME могут быстро
обучиться работе с этим интерфейсом.

B<SVG> это W3C стандарт XML формата для 2D векторного рисования. он позволяет
определять объекты в рисунке используя точки, контуры, и формы - примитивы.
Цвета, шрифты, ширина обводки, и прочее, определяемое как стилевые атрибуты
для этих объектов. Цель состоит в том, чтобы, так как SVG является
стандартом, и его файлы это text/xml, было возможно использовать их в 
значительном числе программ и для широкого круга применений.

B<Inkscape> использует SVG как родной формат документов, и имеет целью 
стать наиболее совместимой программой для рисования SVG файлов, из 
доступных в сообществе Open Source.


=head1 OPTIONS

=over 8

=item B<-?>, B<--help>

Показать справочное сообщение

=item B<-V>, B<--version>

Показать версию Inkscape и дату сборки.

=item B<-a> I<x0:y0:x1:y1>, B<--export-area>=I<x0:y0:x1:y1>

При экспорте в PNG, установить область экспорта в SVG юнитах 
(анонимные единицы длины обычно используемые в Inkscape SVG).  
Умолчально эспортируется страница документа целиком.  Точка (0,0) находится
в левом нижнем углу.

=item B<-C>, B<--export-area-page>

При экспорте в PNG, PDF, PS и EPS, область экспорта - это страница. 
Это умолчание для PNG, PDF и PS, так что уточнение не требуется,
если вы не используете параметр L<--export-id> для экспорта указанного объекта.
В EPS, тем не менее, это не умолчание; более того, для EPS, спецификация
формата не позволяет содержимому bounding box выходить за его пределы.
Это означает, что когда параметр L<--export-area-page> используется в экспорте EPS
bounding box страницы обрезается внутрь к bounding box содержимого если оно меньше.

=item B<-D>, B<--export-area-drawing>

В экспорте PNG, PDF, PS и EPS, экспортируемая область - это рисунок,
а не страница), напр. bounding box всех объектов документа (или
экспортируемый объект при экспорте с параметром L<--export-id>).
С этой опцией, экспортируемое изображение покажет все видимые объекты
документа без границ или обрезки. Это умолчальная область экспорта
для EPS. Экспорт в PNG, может использоваться вместе с параметром 
L<--export-use-hints>.

=item B<--export-area-snap>

Для экспорта PNG, подтягивает область экспорта кнаружи до ближайших целых 
значений SVG юнитов (px).  Если используется умолчальное разрешение 
экспорта 96 dpi и графика выровнена попиксельно для минимизации сглаживания,
этот переключатель разрешает сохранять это выравнивание даже если вы
экспортируете отдельные bounding box объектов, (с параметром L<--export-id>
или L<--export-area-drawing>) невыровненных попиксельно.

=item B<-b> I<COLOR>, B<--export-background>=I<COLOR>

Фоновый цвет экспортируемого PNG.  Любой SVG поддерживаемый цвет, в виде 
строки например "#ff007f" или "rgb(255, 0, 128)".  Если не установлено, 
то будет использоваться цвет страницы устанавливаемый в Inkscape 
в диалоге Свойства документа (хранится в атрибуте pagecolor= attribute 
в sodipodi:namedview).

=item B<-d> I<DPI>, B<--export-dpi>=I<DPI>

Разрешение для экспорта PNG.  Также используется для отказоустойчивой
растеризации фильтруемых объектов при экспорте в PS, EPS или PDF
(если не указывается L<--export-ignore-filters> для подавления 
растеризации).  Умолчание - 96 dpi, что соответствует 1 SVG юниту 
(px, он же "user unit") экспортируемому в 1 bitmap pixel.  Это значение 
переопределяет DPI подсказку, если используется с L<--export-use-hints>.

=item B<-e> I<FILENAME>, B<--export-png>=I<FILENAME>

Указать имя файла для экспорта PNG.  Если файл уже существует, он будет
перезаписан без вопросов.

=item B<-f> I<FILENAME>, B<--file>=I<FILENAME>

Открыть указанный(-е) документ(-ы). Строка параметров может быть опущена,
т.е. вы можете перечислить имена файлов без -f.

=item B<-g>, B<--with-gui>

Попробуйте использовать GUI (в Unix, используйте X сервер даже если $DISPLAY
не установлен).

=item B<-h> I<HEIGHT>, B<--export-height>=I<HEIGHT>

Высота сгенерированного битмапа в пикселах. Это значение переопределяет 
установку L<--export-dpi> (или DPI hint если используется с L<--export-use-hints>).

=item B<-i> I<ID>, B<--export-id>=I<ID>

Для экспорта PNG, PS, EPS, PDF и plain SVG, значение атрибута id объекта
для экспорта из документа; все остальные объекты не экспортируются. 
Умолчальная область экспорта это bounding box объекта; 
её можно переопределить используя параметр L<--export-area> (только PNG)
или L<--export-area-page>.

=item B<-j>, B<--export-id-only>

Для PNG и plain SVG, экспорт объекта с указанным id в параметре
L<--export-id>. Все остальные объекты скрыты и не показываются при экспорте
даже если они перекрывают экспортируемый объект.  Без L<--export-id>, этот
параметр игнорируется.  Для PDF экспорта, это - умолчание, так что этот
параметр не даёт эффекта.

=item B<-l>, B<--export-plain-svg>=I<FILENAME>

Экспорт документа(ов) в plain SVG формат, без sodipodi: или inkscape:
имён пространств и без RDF метаданных.

=item B<-x>, B<--extension-directory>

Показать список каталогов расширений, которые использует Inkscape 
и выйти.  Используется для внешних расширений в той же конфигурации
как и в оригинальной установке Inkscape.

=item B<--verb-list>

Показать список всех действий, доступных в Inkscape по ID.  Эти ID могут
быть использованы в определяемых раскладках клавиш или меню.  
Это также может быть использовано с L<--verb> параметром.

=item B<--verb>=I<VERB-ID>, B<--select>=I<OBJECT-ID>

Эти два параметра работают совместно для обеспечения базового скриптинга
в Inkscape из командной строки.  Они оба могут выполняться столько раз, 
сколько требуется в командной строке и исполняются в указанном порядке 
в каждом указанном документе.

Команда L<--verb> исполняет указанное действие как если бы она была вызвана
из меню или кнопкой.  Диалоги будут показаны, если они - часть действия.  
Для получения списка ID доступных действий, используйте параметр L<--verb-list>.

Команда L<--select> будет вызывать объекты, имеющие ID указанные для выбора.
Это позволяет различным действиям воздействовать на них.  Для удаления
выделений используйте C<--verb=EditDeselect>.  ID объектов доступны 
в зависимости от документа, указанного в к загрузке.

=item B<-p> I<PRINTER>, B<--print>=I<PRINTER>

Печатать документ(ы) на указанный принтер командой `lpr -P PRINTER'.
Или используйте `| COMMAND' для указания другой команды для конвейера,
или `> FILENAME' для записи PostScript вывода в файл вместо печати.  
Помните о расстановке кавычек в вашем шелле, напр.

    inkscape --print='| ps2pdf - mydoc.pdf' mydoc.svg

=item B<-t>, B<--export-use-hints>

Использовать имя экспорта и DPI подсказки, сохранённые в объекте (только
с L<--export-id>).  Эти подсказки устанавливаюся автоматически при экспорте
выделения из Inkscape.  К примеру, если в экспортируете форму
с id="path231" как /home/me/shape.png при 300 dpi из document.svg
используя Inkscape GUI, и сохранили document, затем вы можете
реэкспортировать эту форму в тот же файл с тем же разрешением просто
использовав команду

    inkscape -i path231 -t document.svg

При использовании L<--export-dpi>, L<--export-width>, или L<--export-height>
с этой опцией, DPI подсказка будет игнорирована и будет использоваться значение
из командной строки.  Если вы используете L<--export-png> с этой опцией, 
подсказка имена файла будет игнорироваться и будет использоваться имя файла
из командной строки .

=item B<-w> I<WIDTH>, B<--export-width>=I<WIDTH>

Ширина генерируемого битмапа в пикселах.  Значение перекрывается 
настройкой --export-dpi (или DPI подсказкой если используется
с --export-use-hints).

=item B<-y> I<VALUE>, B<--export-background-opacity>=I<VALUE>

Непрозрачность фона экспортируемого PNG.  Значение между .0 и 1.0
(0.0 - полная прозрачность, 1.0 - полная непрозрачность) или
от 1 до 255 (255 - полная непрозрачность).  Если не установлено и
опция -b не используется, то будет использоваться непрозрачность страницы, 
установленная в Inkscape в диалоге Свойства документа (сохранённая в узле
inkscape:pageopacity= attribute of sodipodi:namedview).  Если не установлено 
и опция -b используется, то будет использоваться значение 255 
(полная непрозрачность).

=item B<-P> I<FILENAME>, B<--export-ps>=I<FILENAME>

Экспорт документа(ов) в PostScript формат. PostScript не поддерживает
прозрачность, любые прозрачные объекты в оригинальном SVG будут
автоматически растеризованы. Используемые шрифты выделяются в субсет 
и внедряются. Умолчальная область экспорта - страница; возможно установить 
рисунок L<--export-area-drawing>. Укажите L<--export-id> для экспорта 
одного объекта (все остальные будут скрыты); в этом случае область экспорта 
- это bounding box объекта, но может быть установлена страница 
опцией L<--export-area-page>.

=item B<-E> I<FILENAME>, B<--export-eps>=I<FILENAME>

Экспорт документа(ов) в Encapsulated PostScript формат. PostScript не 
поддерживает прозрачность, любые прозрачные объекты в оригинальном SVG 
будут автоматически растеризованы. Используемые шрифты выделяются в субсет 
и внедряются. Умолчальная область экспорта - рисунок; возможно установить
страницу, смотрите L<--export-area-page> для применяемых ограничений. 
Можно указать L<--export-id> для экспорта одного объекта (все остальные 
будут скрыты).

=item B<-A> I<FILENAME>, B<--export-pdf>=I<FILENAME>

Экспорт документа(ов) в PDF формат. Формат сохраняет прозрачность
в оригинальном SVG. Используемые шрифты выделяются в субсет 
и внедряются. Умолчальная область экспорта - страница; возможно установить 
рисунок L<--export-area-drawing>. Укажите L<--export-id> для экспорта 
одного объекта (все остальные будут скрыты); в этом случае область экспорта
 - bounding box объекта, но может быть установлена страница 
 опцией L<--export-area-page>.

=item B<--export-pdf-version>=I<PDF-VERSION>

Выберите версию PDF для экспортируемого PDF файла. Эта опция выставляет 
селектор PDF версии в диалоге PDF-экспорта в GUI. 
Вы должны выбрать одну из версий в combo-box, напр. "1.4".  Умолчальная 
версия pdf при экспорте - "1.4".

=item B<--export-latex>

(для PS, EPS, и PDF экспорта) Используется для создания изображений для 
документов LaTeX, где текст изображений - это typeset по LaTeX.  
При экспорте в PDF/PS/EPS формат, эта опция разделяет вывод 
в PDF/PS/EPS файл (напр. как при --export-pdf) и LaTeX файл. Текст не будет 
выводом в PDF/PS/EPS файл, но появится в файле LaTeX. Этот LaTeX файл 
включает PDF/PS/EPS.  Ввод (\input{image.tex}) LaTeX файла в LaTeX документ 
покажет изображение и весь текст будет typeset by LaTeX. 
Смотрите результирующий LaTeX файл для дальнейшей информации.  
Также смотрите GNUPlot `epslatex' вывод терминала.

=item B<-T>, B<--export-text-to-path>

Конвертировать текстовые объекты в контуры при экспорте, где применимо 
(для PS, EPS, PDF и SVG экспорта).

=item B<--export-ignore-filters>

Экспорт фильтрованных объектов (напр. тех, которые с размытием) как векторов, 
игнорируя фильтры (для PS, EPS, и PDF экспорта).  Умолчально, все 
фильтрованные объекты растеризуются с разрешением L<--export-dpi> 
(умолчально 96 dpi), с сохранением видимости.

=item B<-I>, B<--query-id>

Установить ID объекта, чьи размеры запрошены. Если не установлено, 
опции запроса вернут размеры рисунка (т.е. все объекты документа), 
а не страницу или viewbox.

=item B<-X>, B<--query-x>

Запрос X координаты рисунка или, если указано, объекта
с опцией L<--query-id>. Возвращаемое значение в px (SVG user units).

=item B<-Y>, B<--query-y>

Запрос the Y координаты рисунка или, если указано, объекта
с опцией L<--query-id>. Возвращаемое значение в px (SVG user units).

=item B<-W>, B<--query-width>

Запрос ширины рисунка или, если указано, объекта с опцией L<--query-id>. 
Возвращаемое значение в px (SVG user units).

=item B<-H>, B<--query-height>

Запрос высоты рисунка или, если указано, объекта с опцией L<--query-id>. 
Возвращаемое значение в px (SVG user units).

=item B<-S>, B<--query-all>

Печатать разделённый запятыми список всех объектов в SVG документе 
с  ID, определёнными по значениям их x, y, ширины, и высоты.

=item B<--shell>

С этим параметром, Inkscape откроет режим интерактивного командного шелла. 
В этом режиме, вы набираете команды в строке и Inkscape исполняет их, 
без запуска новой копии Inkscape для каждой команды. Эта особенность 
в основном для скриптинга и серверного использования: не добавляет 
новых возможностей, но позволяет улучшить скорость и требования памяти 
любого скрипта, который неоднократно вызывает Inkscape для выполнения 
задач из командной строки (таких как экспорт или преобразования). Каждая 
команда в режиме шелла должна быть полностью действительной командой 
командной строки Inkscape, но без указания имени программы Inkscape, например:

    file.svg --export-pdf=file.pdf

=item B<--vacuum-defs>

Удалить все неиспользуемые пункты из <lt>defs<gt> секции SVG файла.
Если эта опция вызывается в сочетании с L<--export-plain-svg>,
затрагивается только экспортируемый файл.  Если используется только эта 
опция, указанный файл будет изменен на месте.

=item B<-z>, B<--without-gui>

Не открывать GUI (в Unix, не использовать X сервер); только обрабатывать 
файлы из консоли.  Это предполагается для -p, -e, -l, and --vacuum-defs
опций.

=item B<--g-fatal-warnings>

Это стандартная GTK опция позволяет любым предупреждениям, как правило, 
безвредным, прерывать работу Inkscape (полезно для отладки).

=item B<--usage>

Показать короткое сообщение об использовании.

=back

=head1 CONFIGURATION

Главный конфигурационный файл размещается в
~/.config/inkscape/preferences.xml; он хранит множество опций настройки,
которые можно изменить в Inkscape (в основном в диалоге Inkscape
Настройки).  Также вы можете разместить свой собственный в следующих 
подкаталогах:

B<$HOME>/.config/inkscape/extensions/ - расширения эффектов.

B<$HOME>/.config/inkscape/icons/ - значки.

B<$HOME>/.config/inkscape/keys/ - раскладки клавиш.

B<$HOME>/.config/inkscape/templates/ - шаблоны новых файлов.

=head1 DIAGNOSTICS

Программа вернёт zero при успехе или non-zero при ошибке.

Множество сообщений об ошибках и предупреждения могут быть напечатаны в 
STDERR или STDOUT.  Если программа ведет себя хаотично или аварийно 
с конкретным файлом SVG, полезно взглянуть на этот вывод для подсказки.

=head1 EXAMPLES

В то время как очевидно B<Inkscape> в первую очередь приложение с GUI,
но также возможно и редактирование SVG в командной строке.

Открыть SVG файл в GUI:

    inkscape filename.svg

Напечатать SVG файл из командной строки:

    inkscape filename.svg -p '| lpr'

Экспорт SVG файла в PNG с умолчальным разрешением 96 dpi (один 
пользовательский SVG юнит транслируется в один битмпап пиксел):

    inkscape filename.svg --export-png=filename.png

То же, но форсировать PNG файл в 600x400 пикселов:

    inkscape filename.svg --export-png=filename.png -w600 -h400

То же, но экспортировать рисунок (bounding box всех объектов), не страницы:

    inkscape filename.svg --export-png=filename.png --export-area-drawing

Экспорт в PNG объекта с id="text1555", с именем и разрешением для этого 
объекта при последнем экспорте его из GUI:

    inkscape filename.svg --export-id=text1555 --export-use-hints

То же, но использовать умолчальное разрешение 96 dpi, указать имя файла, 
и подтянуть область экспорта кнаружи до ближайших целых значений 
SVG юнитов (px) (для попиксельного выравнивания графики и минимизации 
сглаживания):

    inkscape filename.svg --export-id=text1555 --export-png=text.png --export-area-snap

Конвертировать Inkscape SVG документ в plain SVG:

    inkscape filename1.svg --export-plain-svg=filename2.svg

Конвертировать SVG документ в EPS, конвертировав весь текст в кривые:

    inkscape filename.svg --export-eps=filename.eps --export-text-to-path

Запрос ширины объекта с id="text1555":

    inkscape filename.svg --query-width --query-id text1555

Дублировать объект с id="path1555", повернуть дубликат на 90 градусов, 
сохранить SVG и выйти:

    inkscape filename.svg --select=path1555 --verb=EditDuplicate --verb=ObjectRotate90 --verb=FileSave --verb=FileClose


=head1 ENVIRONMENT

B<DISPLAY> чтобы получить умолчальный хост и номер дисплея.

B<TMPDIR> для установки умолчального пути каталога временных файлов.  
Каталог должен существовать.

B<INKSCAPE_PROFILE_DIR> для установки пути каталога пользовательского профиля.

=head1 THEMES

Для загрузки различных наборов значков вместо умолчального
B<${CMAKE_INSTALL_PREFIX}/${SHARE_INSTALL}>/inkscape/icons/icons.svg файл, 
каталог B<$HOME>/.config/inkscape/icons/ используется.  Значки загружаются 
по имени (например I<fill_none.svg>), или если не найдены, из I<icons.svg>.  
Если значок не загружается из любого из этих мест, он загружается из
умолчального местоположения.

Необходимые значки загружаются из SVG файлов поиском SVG id, совпадающим 
с именем значка.  (К примеру, для загрузки значка "fill_none" из файла, 
bounding box показывается для SVG id "fill_none", который рендерится как
значок, если он происходит из I<fill_none.svg> или I<icons.svg>.)

=head1 OTHER INFO

Каночничное место для нахождения B<Inkscape> info это
L<http://www.inkscape.org/>.  На веб-сайте есть новости, документация,
учебники, примеры, архивы почтовой рассылки, последние релизы программы, 
базы данных ошибок и запросов особенностей, форумы, и прочее.

=head1 SEE ALSO

L<potrace>, L<cairo>, L<rsvg>, L<batik>, L<ghostscript>, L<pstoedit>.

SVG compliance test suite:
L<http://www.w3.org/Graphics/SVG/Test/>

SVG validator:
L<http://jiggles.w3.org/svgvalidator/>

I<Scalable Vector Graphics (SVG) 1.1 Specification>
I<W3C Recommendation 14 January 2003>
L<http://www.w3.org/TR/SVG11/>

I<Scalable Vector Graphics (SVG) 1.2 Specification>
I<W3C Working Draft 13 November 2003>
L<http://www.w3.org/TR/SVG12/>

I<SVG 1.1/1.2/2.0 Requirements>
I<W3C Working Draft 22 April 2002>
L<http://www.w3.org/TR/SVG2Reqs/>

I<Document Object Model (DOM): Level 2 Core>
I<Arnaud Le Hors et al editors, W3C>
L<http://www.w3.org/TR/DOM-Level-2-Core/>


=head1 GUI NOTES

To learn Inkscape's GUI operation, read the tutorials in Help > Tutorials.

Apart from SVG, Inkscape can import (File > Import) most bitmap formats
(PNG, BMP, JPG, XPM, GIF, etc.), plain text (requires Perl), PS and EPS
(requires Ghostscript), PDF and AI format (AI version 9.0 or newer).

Inkscape exports 32-bit PNG images (File > Export PNG Image) as well as
AI, PS, EPS, PDF, DXF, and several other formats via File > Save as.

Inkscape can use the pressure and tilt of a graphic tablet pen for
width, angle, and force of action of several tools, including the
Calligraphic pen.

Inkscape includes a GUI front-end to the Potrace bitmap tracing engine
(L<http://potrace.sf.net>) which is embedded into Inkscape.

Inkscape can use external scripts (stdin-to-stdout filters) that are
represented by commands in the Extensions menu. A script can have a GUI
dialog for setting various parameters and can get the IDs of the
selected objects on which to act via the command line. Inkscape comes
with an assortment of effects written in Python.

=head1 KEYBINDINGS

To get a complete list of keyboard and mouse shortcuts, view
doc/keys.html, or use the Keys and Mouse command in Help menu.

=head1 BUGS

Many bugs are known; please refer to the website
(L<http://www.inkscape.org>) for reviewing the reported ones and to
report newly found issues.  See also the Known Issues section in the
Release Notes for your version (file `NEWS').

=head1 AUTHORS

This codebase owes its existence to a large number of contributors
throughout its various incarnations.  The following list is certainly
incomplete, but serves to recognize the many shoulders on which this
application sits:

${INKSCAPE_AUTHORS}

This man page was put together by Bryce Harrington
E<lt>bryce@bryceharrington.orgE<gt>.

=head1 HISTORY

The codebase that would become Inkscape began life in 1999 as the
program Gill, the GNOME Illustrator application, created by Raph Levien.
The stated objective for Gill was to eventually support all of SVG.
Raph implemented the PostScript bezier imaging model, including stroking
and filling, line cap style, line join style, text, etc.  Raph's Gill
page is at L<http://www.levien.com/svg/>.  Work on Gill appears to have
slowed or ceased in 2000.

The next incarnation of the codebase was to become the highly popular
program Sodipodi, led by Lauris Kaplinski.  The codebase was turned into
a powerful illustration program over the course of several year's work,
adding several new features, multi-lingual support, porting to Windows
and other operating systems, and eliminating dependencies.

Inkscape was formed in 2003 by four active Sodipodi developers, Bryce
Harrington, MenTaLguY, Nathan Hurst, and Ted Gould, wanting to take a
different direction with the codebase in terms of focus on SVG
compliance, interface look-and-feel, and a desire to open development
opportunities to more participants.  The project progressed rapidly,
gaining a number of very active contributors and features.

Much work in the early days of the project focused on code stabilization
and internationalization.  The original renderer inherited from Sodipodi
was laced with a number of mathematical corner cases which led to
unexpected crashes when the program was pushed beyond routine uses; this
renderer was replaced with Livarot which, while not perfect either, was
significantly less error prone.  The project also adopted a practice of
committing code frequently, and encouraging users to run developmental
snapshots of the program; this helped identify new bugs swiftly, and
ensure it was easy for users to verify the fixes.  As a result, Inkscape
releases have generally earned a reputation for being robust and
reliable.

Similarly, efforts were taken to internationalize and localize the
interface, which has helped the program gain contributors worldwide.

Inkscape has had a beneficial impact on the visual attractiveness of
Open Source in general, by providing a tool for creating and sharing
icons, splash screens, website art, and so on.  In a way, despite being
"just an drawing program", Inkscape has played an important role in
making Open Source more visually stimulating to larger audiences.

=head1 COPYRIGHT AND LICENSE

B<Copyright (C)> 1999-2016 by Authors.

B<Inkscape> is free software; you can redistribute it and/or modify it
under the terms of the GPL version 2 or later.


=for comment
$Date$
