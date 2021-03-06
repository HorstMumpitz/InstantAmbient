# Konfigurationen

Dieses Kapitel beschäftigt sich mit dem generellen Aufbau von Konfigurationen welche zwischen dem Smartphone und einem Connector ausgetauscht wird. Diese wird vom Benutzer
mit Hilfe der App erstellt und editiert. In den nächsten Abschnitte werden ausgehend von der Definition einer Konfiguration der allgemeine Aufbau und Mechanismen im Umgang
mit dieser eingeführt. Anschließend werden mögliche Datenformate und die Vorhersage von künftigen Konfigurationen diskutiert. Da es keine bestehenden Systeme gibt, welche 
Konfigurationen für die betrachteten Szenarien bereitstellen, wird ein Versuch unternommen eine eigene Spezifiaktion zu beschreiben.


## Definition einer Konfiguaration
Im Kontext der Informatik ist der Begriff Konfiguration aus eher zwei unterschiedlichen Gebieten bekannt, so beschreibt dieser Begriff zunächst die Möglichkeit Parameter von
Programmen teilweise frei und in gewissen Grenzen anzupassen. So kennt jeder die Möglichkeit sein Mailprogramm zu konfigurieren und etwa neue Accounts hinzuzufügen. 
Ein weiteres mal tritt die Konfiguration in der theoretischen Informatik auf, so lässt sich das Konstrukt der Automtaten mit Hilfe von Konfigurationen beschreiben. Genauer
gesagt, wird der Zustandsübergang damit beschrieben\footnote{Des Weiteren sind z.B. in der Erzähltheorie und Chemie Konstrukte wie der Konfiguration vorzufinden. }. 
\\\\
In beiden Beispielen kommt zur Geltung, dass mit Hilfe einer Konfiguration der Zustand eines gewissen Konstruktes ausgehend vom Ersteller / Nutzer beschrieben wird. Diese
Beschreibung trifft ebenfalls auf InstantAmbient zu jedoch mit ein paar speziellen Anmerkungen. Zunächst können je nach Möglichkeit der Umgebung eine Vielzahl an 
Einstellungen vorgenommen werden und es wird sich nicht ausschließlich auf eine Konfiguration konzentriert, sondern je nach Situation eine neue angelegt oder verändert. Am 
besten lässt sich dies mit einer Vielzahl von Konfigurationen beschreiben die für eine spezielle Plattform angepasst sind. Mit Hilfe dieser Beschreibung lässt sich eine Definition für Konfiguration innerhalb von InstantAmbient beschreiben.

\newtheorem{mydef}{Konfiguration}
\begin{mydef}
Eine Konfiguration beschreibt den gewünschten Zustand einer Umgebung, welche von einem User definiert wird. Dabei beschreibt genau eine Konfiguration eine Umgebung. Als
Umgebung können beispielsweise Gebäude als ganzes, einzelne Räume oder gar Autos angesehen werden.
\end{mydef}

Diese Definition beschreibt die Konfiguration als solches sehr generell im folgenden wird diese ergänzt unter anderem einer Beschreibung wie diese aufgebaut ist. 
- Quellen einfügen 

## Aufbau
Nachdem allgemein Formuliert wurde, wie eine Konfiguration beschrieben ist, wird erläutert wie sich der Aufbau gestaltet. Hierfür werden mehrere Mechanismen erklärt, welche notwendig für die Erstellung einer Konfiguration sind. Diese beschreiben den allgemeinen Aufbau und gehen bis hin zu Konzepten wie der Polymorphie. 

### Allgemeine Strukturierung
Zunächst soll geklärt werden wie sich der Aufbau einer Konfiguration gestaltet. Dazu sollten Überlegungen angestellt werden, welche Art von Daten und letztendlich Konfigurationsvarianten gespeichert werden müssen. Hierfür muss die Prämisse mit einbezogen werden, dass es sich um eine generische Gestaltung handeln soll, d.h. zu den Ansprüchen von Autos und etwa Hotelzimmern genügt. 
Ganz offensichtlich gibt es Unterscheidungen zwischen Attributen, einer Strukturierung dieser und eventuellen speziellen Mechanismen im Umgang mit diesen.

Attribute, sind Zahlenwerte oder andere Datenstrukturen doe repräsentiert werden. Dies sind die kleinsten Einheiten einer Konfiguration.

Des Weiteren ist die Strukturierung und Organisation der Daten elementar für die Weiterverbreitung, so sollte das Format für Client, sowie den weiteren Bearbeitungsinstanzen leicht zu erstellen und parsbar sein. Welche Schwierigkeiten hier entstehen können, wird in den nächsten Abschnitten geklärt. 

Im folgenden werden all die angesprochenen Strukturierungen in den einzelnen Abschnitten geklärt. Als Strategie wird die des Bottom-Up verfolgt, wobei mit den elementarsten Bestandteilen angefangen wird. 

### Attribute und ihre Typen
Wie bereits angesprochen sind Attribute die kleinsten Einheit der Repsäsentation von Konfigurationswerten. Dies ist notwendig, da beispielsweise Temperaturen andere Werte annehmen können, als eine Sammlung von unterschiedlichsten Radiosendern für das Autoradio. Dies bietet auch einen guten Einstieg in die Unterscheidung der einzelnen Typen. Damit einzelne Typen exakt zugeordnet werden, gehören diese immer zu einem Attribut. Diese Überlegung ist logisch und repräsentiert die bekannten meachnismen, welche wir beispielsweise aus der Programmierung kennen, so kann das folgende Beispiel folgendermaßen interpretiert werden\footnote{Die hier gezeigte Syntax soll lediglich als Pseudocode dienen und nicht als festes format dienen.}:
>	x = 2
So wäre im Falle einer Konfiguration x ein Attribut mit derm Wert 2, wobei es sich offensichtlich hier um eine Ziffer und letztendlich eine Zahl handelt. Zunächst müssen Attribute eindeutig sein und können einmalig deklariert werden. 

Spannender ist die Frage welche Typen notwendig für die  Speicherung und Verarbeitung einer Konfiguration notwendig sind. Besonders Informatikern sind die Probleme bekannt, dass Datenstrukturen schnell komplex und unüberschaubar sind. Diesen Phänomen sollte vorgebeugt werden, sodass einfache Strukturen vorherrschen müssen. 

Die Überlegung zwischen Raumtemperaturen und Fernsehsendern geben erste Hinweise auf notwendige Elementartypen. So sollte eine Temperatur als eine fließkomma Zahl und ein Fernsehsender mit Hilfe dessen Namens, sprich einem Text definiert werden. Zahlen sollten ebenfalls als ganze definiert werden können. So sind schon komplexere Beispiele vorstellbar:
> temperatur = 21.7
	sender_1 = "ARD"
	sender_2 = "ZDF"

Das letzte Listing zeigt bereits eine neue Klasse von Problemen, so ist die Sammlung einzelner Attribute, welche inhaltlisch zum selben Kontext kompliziert. Die Einführung von Namenskonvetionen zur Sammlung von Attributen, welche zu einer Domäne gehören, wären eine mögliche Lösung. Bei der Mögichkeit von wohl hunderten Radio- und Fernsehsendern, wird schnell klar, dass eine Unübersichtlichkeit garantiert ist. 	Als Konsequenz sollten Elementartypen in der Lage sein gesammelt zu werden. Im Endeffekt beschreibt dieser Mechanismus eine Liste, so ist:
> sender = ["ARD", "ZDF", "OpenTV", "OneMoreChannel"]
Im Vergleich zu: 
> sender_1 = "ARD"
	sender_2 = "ZDF"
	sender_3 = "OpenTV"
	sender_4 = "OneMoreChannel"

Eine wesentliche Vereinfachung. Für die Zuweisung von Werten, sind keine weiteren Typen notwendig. 

Die hier gewonnenen Erkenntnisse sollen wie zuvor im letzen Abschnitt formell in einer Definition festgehalten werden.
> Ein Attribut definiert eine Teileigenschaft einer Konfiguration. Dieses Attribut kann eine Zahl, einen Text oder eine Sammlung aus diesen beinhalten.

Der nächste Abschnitt wird sich mit einem übergeordneten Konzept, der Sammlung von Attributen sammeln.


### Sektionen
Mit der Einführung von Attributen und deren Typen ist es grundlegend möglich zunächst die notwendigen Werte einer Konfiguration zu speichern. Jedoch wird man bei diesem Konzept mit einer weiteren Klasse von Problemen konfrontiert, die im folgenden Listing gezeigt werden sollen:
> temperatur_wohnzimmer = 21
	temperatur_badezimmer = 23
	radiosender_badezimmer = ["Fritz", "Radio1", "InfoRadio"]
	tvsender_wohnzimmer = ["BBC", "Phoenix"]
	
Das Beispiel zeigt zwei Dinge, dass Konfigurationen ausserordentlich komplex werden können und einzelne Teile einer Konfiguration offensichtlich einen bestimmten Kontext zugeordnet werden können. 

Eine Kategorisierung bringt den Vorteil, dass der Inhalt einer Konfiguratioen noch mals unterteilt werden kann. Dies schafft nicht nur Übersichtlichkeit, sondern auch Klassifikationen. Besonders ist zweiteres interessant für die spätere Weiterbearbeitung. So können bestimmte Systeme für eine bestimmte Klasse zuständig sein. Dieses Thema wird jedoch erst im nächsten Kapitel diskutiert. 

Die Arten der Klassifikation können sehr unterschiedlich ausfallen. Die Einteilung ist stark von der verwendeten Umgebung und deren Ansprüchen abhängig. Bei einem Hotelzimmer wäre eine mögliche Einteilung folgende: 
> Wohnzimmer: 
		temperatur = 21
		tv_sender = ["ARD", "ZDF"]
		helligkeit = 0.7
	Badezimmer: 
		wasser_temperatur = 36
		radio_sender = ["Fritz", "Jazz Radio"]
		lautstaerke = 0.25

Wobei ein Auto folgende belange haben könnte:
> Fahrersitz:
		hoehe = 12
		winkel = 96
		temperatur = 32
	Reifen: 
		vorne = 3.58
		hinten = 4

Die Beispiele zeigen, dass das gezeigte Hotelzimmer sich nach den Räumen richtet, wobei im Auto der Innenraum und sicherheitsrelevante Systeme. Es kann verdeutlicht werden, in wie weit die Unterscheidung und Sammlung einen Vorteil bringen. Attribute sind kontextuell voneinander getrennt ohne eine zu starke Hierarschie einzugehen, welche eventuell später schwerer zu bearbeiten wäre.

Des Weiteren ergeben sich durch die Staffelung weitere interessante Konzepte, besonders in Hinsicht auf sicherheitsrelevante Systeme. Diese sollten bei der Verarbeitung und dem laden der Daten eine besonders hohe priorität genießen. Salopp gesagt, nützt es einen Fahrer nichts bereits seine Lieblingsmusik, wenn die Aussenspiegel noch nicht auf der korrekten Position sind. Die Einführung einer Priorisierung ist auf zwei unterschiedlichen Ebenen vorstellbar, auf ebene der Konfiguration und innerhalb einer Sektion: 
> Fahrersitz:
		prioritaet = "hoch"
		hoehe = 12
		winkel = 96
		temperatur = 32

Die zweite Möglichkeit ist keine explizite Nennung der Priorisierung innerhalb der Konfiguration, sondern diese automatisch den bearbeitenden Systemen zu überlassen. 
Welche Stufen der Priorisierung möglich sein sollten, sind ebenfalls abhängig von den Systemen, zumindest sollte zwischen "hoch" und "niedrig", wobei ersteres explizit genannt werden sollte. 

Zusammenfassend wird das Konstrukt der Sektionen ebenfalls abschließend definiert.
> Attribute und deren Typen lassen sich kontextuell in einzelne Sektionen gruppieren. Diese Gruppierungen können je nach Einsatzszenario unterschiedlich priorisiert werden. Die Nutzung von Sektionen ist nicht zwingend

Der nächste Abschnitt widmet sich dem mehrfachen Vorkommen von attributen.

## Polymorphie
Sektionen bieten neben der Klassifizierung von Attributen einen weiteren Vorteil, im ursprünglichen Konzept mussten unterschiedliche Temperaturen für einzelne Zimmer folgendermaßen beschrieben werden:
> wohnzimmer_temperatur = 21
	badezimmer_temperatur = 22
Wenn sich streng an die aufgestellten Regeln der Sektionen und Attribute gehalten wird, wäre eine beschreibung in diesem Stile möglich: 
> temperatur_allgemein = 20
	
	Wohnzimmer: 
		temperatur_wohnzimmer = 21
	
	Badezimmer: 
		temperatur_badezimmer = 22

Die Betrachtung der Konfiguration zeigt, dass ein erheblicher Overhead entsteht, alleine bei der Beschreibung der Temperatur. Es gilt global und für alle Zimmer die Eigenschaft der Temperatur, wenn Sektionen nicht genutzt werden, müssen diese unterschieden werden. Jedoch impliziert eine Sektion eine Zugehörigkeit eines Attributs zu einem bestimmten Kontext. Die eingeführte Hierarchie kann eine elementare Erleichterung bringen. Dieses Konzept ist ebenfalls als Polymorphie in der Programmierung bekannt. Das Attribut nimmt je nach dem in welchem Kontext es sich befindet eine andere Form an. Mit Hilfe des Konstrukts, lässt sich das Beispiel vereinfachen: 
> temperatur = 20
	
	Wohnzimmer: 
		temperatur = 21
	
	Badezimmer: 
		temperatur = 22
Es ist einheitlich die Sprache von einer Temperatur, welche in gewissen Situationen anders sein kann. Eine weitere vereinfachung der Konfiguration.

> Mit Hilfer der Polymorphie lassen sich gleiche Attribute in einem unterschiedlichen Kontext beschreiben. Beispielsweise können Temperaturen in unterschiedlichen Räumen abgebildet werden.

## Ableitungen von Konfigurationen
Die letzte Stufe bei der Beschreibung des Konfigurationsaufbau, ist die Bildung von Ableitungen. Der Gedanke hinter diesem Konstrukt ist die Widerverwendbarkeit einzelner Teile einer Konfiguration. Ausgehend davon könnte jeder User seine ganz allgemeinen Präferenzen in einer Konfiguration gespeichert haben. Diese Treffen auf nahezu alle Umgebungen zu, so beispielsweise auch auf die Innentemperatur eines Autos zu. So finden sich Redundanzen innerhalb unterschiedlichster Konfigurationen wieder:
> temperatur = 21
	helligkeit = 0.3
	luftfeuchtigkeit = 0.6
Sind nur einige der Daten die oftmals generell den persönlichen Präferenzen zuzuschreiben sind. In dieser Konsequenz sollte ein weiterer Mechanismus Teil der Konfiguration sein um solche Stammdaten mit einzubeziehen. So kann eine spezielle Konfiguration für ein Auto als eine Erweiterung der Stammdaten angesehen werden:
> -> globale_konfiguration
	
	innnenraum:
		luftfeuchtifkeit = 0.4
Alle anderen bereits beschriebenen Konventionen wie etwa die Polymorphie gelten weiterhin. Das Endprodukt der Konfiguration beschreibt ebenfalls nur eine Datei und gibt keine Verlinkung auf andere vor. Jedoch bietet dieses Konzept noch mals eine übergeordnete Ableitung über alle Konfigurationen hinweg bekannt. So ist nicht nur die Einteilung mit Hilfe von Sektionen, sondern auch Ableitungen möglich. 

> Eine Konfiguration lässt sich von einer anderen Ableiten. Alle  Konzepte bleiben bestehen, das Endprodukt, ist eine neue Konfiguration innerhalb einer Datei. 

## Datenformate
Die in diesen Kapitel verwendete Syntax zur Beschreibung der Konfiguration wurde zu Zwecken der Verständlichkeit eingeführt. Des Weiteren wäre eine vorzeitige Entscheidung für das verwendete Datenformat eine Einschränkung in der Konzeption des Formats. In diesem Abschnitt werden unterschiedliche Repräsentationen einer Konfiguration in XML und JSON vorgestellt. Diese sind die gängigsten Formate im Austausch von Daten. Im folgenden werden die einzelnen Darstellungen exemplarisch gezeigt und diskutiert. Ziel ist es für InstantAmbient eine passende Form der Datenrepräsentation zu finden. 

### XML
XML ist wohl das bekannteste Format im Austauch von Daten es wird vielseitig eingesetzt und eine große Anzahl von Technologien basieren darauf. Die Tools und das Verständnis ist ausgereift und XML selbst ist für den generischen Ansatz von Konfigurationsbeschreibungen prädestiniert. Eine Beschreibung einer Beispielkonfiguration würde folgendermaßen aussehen: 
> <configuration>
	<!-- Deklaration einer Zahl -->
	<number name="temperatur">21</number>
	
	<text name="willkommens_nachricht">Herzlich Willkommen</text>
	<!-- Eine Sammlung an Attributen -->
	<collection name="tv_sender" >
		<text>ARD</text>
		<text>ZDF</text>
		<text>Phoenix</text>
	</attribute>

	<!-- Sektionen -->
	<bathroom>
		<number name="temperatur">22</number>
	</bathroom>
</configuration>

Das Beispiel soll ein Gefühl dafür erzeugen, wie eine Konfiguration im XML-Format aussehen könnte. Alle nötigen Vorgaben sind eingehalten worden. Attribute werden als solche abgebildet wobei der Name der Node den Typen oder eine Sektion beschreibt. Die Beschreibung ist relativ intuitiv und schnell zu erfassen. Die Hierarchien sind flach und schnell zu parsen. Die Nutzung von XML würde nur wenige Tücken mit sich bringen, so muss der Typ einzeln als Node-Name spezifiziert werden und das Attribut findet sich innerhalb des "name". Das ist wohl die größte Schwäche. 

### JSON 
Als zweiter möglicher Formatkandidat, wurde sich für JSON entschieden. Dieses wird besonders im Web zur Serialisierung von Daten eingesetzt und zeichnet sich durch eine einfache Lesbarkeit und bereits spezifizierten Datentypen aus. Ein Beispiel zeigt die Eigenschaften von JSON:
>{
	"temperatur" : 21,
	"willkommens_nachricht" : "Herzlich Wollkomen", 
	"tv_sender" : ["ARD", "ZDF", "Phoenix"], 

	"bathoroom" : {
		"tempertur" : 22
	}
}

Es wurde exakt das gleiche Beispiel wie zuvor im Abschnitt zu XML gewählt, es ist ersichtlich, dass JSON insgesamt schmaler und einfacher zu lesen ist. Des Weiteren sind die einzelnen Datentypen erkennbar.

# was ist freundlicher? 

### Formatentscheidung
Eine Entscheidung für ein Format bringt immer Tücken mit sich und es müssen vorsichtig Vor- und Nachteile abgewägt werden. Wünschenswert wäre eine Multiformat-Unterstützung da im Endeffekt XML und JSON die gleichen Belange im Grunde nur unterschiedlich codieren. Im Falle von InstantAmbient wird sich für JSON entschieden. Es gibt einige entscheidende Vorteile neben den fest integrierten Datentypen, sind die Dateien kompakter und es gibt eine Reihe an performanten Parsern. Insgesamt tritt weniger Overhead auf wie bei klassichen Markup-Sprachen. Diese Entscheidung soll jedoch kein Dogma sein, so wird die Archtiektur es vorsehen, dass diese Formate änderbar sind. 

## Weitere Konzepte
Als letzter Teil dieses Kapitels, sollen mögliche Erweiterungen und Konzepte von Konfigurationsdateien beschrieben werden. Diese Mechanismen hängen nicht nur von dem Format selbst, sondern auch anderen Systemen innerhalb der Konfigurationsbearbeitung ab. 

### Echtzeit-Änderungen
Im Laufe dieses Kapitels wurden Konfigurationen als ein reines statisches Konstrukt betrachtet. Zwar wird eine gewisse Dynamik durch die Einführung von Sektionen, Polymorphie und Ableitungen impliziert, dennoch muss die Konfiguration immer als ganzes Übertragen werden. Diese beschreibt so vollständig wie möglich die Wünsche der Nutzers für eine komplette Umgebung. Haben sich lediglich einzelne Teile geändert, müssen diese dennoch komplett übertragen werden. Die erzeugt Redundanzen und unnötigen Traffic innerhalb der Systeme. Es ist sich leicht vorzustellen wie schnell die Komponenten verwirrt sein könnten. Des Weiteren ist beispielsweise die Raumtemperatur kein Manifest, dass während der Gesamtnutzung der Umgebung unänderbar ist. Bedürfnisse ändern sich, sei es die Innentemperatur oder der Radiosender, welcher gerade ausgewählt wurde. Einzelne eigenschaften sollen und müssen in Echtzeit geändert werden. Die bedeutet, dass als Erweiterung jederzeit partielle Ausschnitte der Konfiguration geändert und übertragen werden können ohne das Neuladen der kompletten Konfiguration und dessen Zusammenhang der Umgebung zu provozieren.

### Vorhersagen
Eine zweite mögliche Erweiterung ist die Vorhersage von möglichen Konfigurationen, ähnlich der Produktempfehlungen bei großen Onlinekaufhäusern. Umgebungen sind dadurch definiert, dass sie sich Eigenschaften teilen auch wenn sie unterschiedlich sind, jedoch ändern sich diese auch nach Art der Umgebung. So sind Sitzpositionen innerhalb von Autos abhängig vom Fahrzeugtyp dem eigentlichen Sitz et cetera. Durch selbstlernende Algorithmen und eine entsprechend große Datenbasis wäre es möglich den Neutzern Konfigurationsempfehlungen auszusprechen auf Basis der Kenntnisse über das eigene und fremde Profile. Vorhersagen ersparen aufwändige Neukonfigurationen und können besonders Aspekte auf Sicherheit und andere wichtige Themen legen. Eines der Kernprobleme in diesem Feld ist, dass die Algorithmen sich auf eine relativ große Datenbasis verlassen. Hier entstehen Fragen darüber wie sich die Datenbasis generiert, wenn jeder Nutzer die Konfigurationen auf seinen Smartphone speichert. Gibt es in diesem Falle nur den Weg über die Cloud oder könnte die Umgebung selbst als Datenvermittler und Wissensspeichen. Ausserdem stellen sich Fragen zum Datenschutz und der Datenintegrität. 

### Smart-Environments
Ausgehend von den Voerhersagen zu neuen Profilen und der Intention, dass Systeme in der Lage sind zu lernen, welche Einstellungen Nutzer treffen, kann dieser Effekt auch auf der anderen Seite genutzt werden. Das Stichwort hier, sind Smart-Environments, wenn sich bestimmte Muster finden lassen, beispielsweise wann das Licht ausgeschaltet wird. Resourcen können intelligent geplant und eingeteilt werden. Die Möglichkeiten sind vielfältig unde können besonders zur Energie- und Kosteneinsparungen genutzt werden.

### Einführung neuer Typen
Die letzte mögliche Erwägung ist die Einführung eines neuen Datentyps. Wie gezeigt können Konfigurationen schon jetzt dynamisch und skalierend angelegt werden. Die Unterscheidung zwischen Number, String und Collections sind hierfür elementar. Die Praxis wird zeigen ob ein Boolean-Typ von nöten ist, welcher in der Lage ist, einfache Zustände darzustellen.
> active = true
In Zukunft könnten hiermit größere Erleicherungen möglich sein. Im allgemeinen kann nur der Einsatz und der Umgang mit Konfigurationen zeigen, welche Dinge notwendig sind und noch gebraucht werden. 
