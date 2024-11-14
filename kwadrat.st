"
Run in intearctive mode:
	FileStream fileIn: 'kwadrat.st'.
"

Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


	!Wielokat methodsFor: 'initialize-release'!

		initialize: liczbaWierzcholkow
			"konstruktor obiektu - wielokata"
			self initialize: liczbaWierzcholkow name: (self nameFromClassName).! 

		initialize: liczbaWierzcholkow name: nowaNazwa
			"konstruktor obiektu - wielokata"
			nazwa:=nowaNazwa.
			wierzcholki:=Array new: liczbaWierzcholkow.
			wierzcholki at: 1 put: 0@0.! !
	
	!Wielokat methodsFor: 'private'!

		nameFromClassName
			"get fiugre name from class name"
			| className |
			className := self class name.
			^className copyFrom: 1 to: (className size).! !


	!Wielokat methodsFor: 'actions'!
	    
	    srodekGeometryczny
	        "licz geometryczny srodek wielokata"
	        | sumaX sumaY liczbaWierzcholkow |
	        sumaX := 0.
	        sumaY := 0.
	        liczbaWierzcholkow := wierzcholki size.
	        wierzcholki do: [:wierzcholek |
				 sumaX := sumaX + wierzcholek x.
				 sumaY := sumaY + wierzcholek y.
				 ].
	    	^(sumaX / liczbaWierzcholkow) @ (sumaY / liczbaWierzcholkow).!
		
	skaluj: skala
		"skaluje wielokat w okol jego srodka geometrycznego"
	    | srodek |
	    srodek := self srodekGeometryczny.
	    wierzcholki := wierzcholki collect: [:wierzcholek |
	        | sX sY |
	        sX := (wierzcholek x - srodek x) * skala + srodek x.
	        sY := (wierzcholek y - srodek y) * skala + srodek y.
	        sX @ sY.
	    ]. !
		
	obroc: kat   
		(kat > 0 and: [kat < 90])
			ifTrue: [
				| srodek katRad |
				katRad := kat * Float pi / 180. 
				srodek := self srodekGeometryczny.
				wierzcholki := wierzcholki collect: [:wierzcholek |
					| xRel yRel rX rY xRotated yRotated |
					xRel := (wierzcholek x - srodek x) asFloatE.
					yRel := (wierzcholek y - srodek y) asFloatE.

					rX := (xRel * katRad cos) asFloatE - (yRel * katRad sin) asFloatE.
					rY := (xRel * katRad sin) asFloatE + (yRel * katRad cos) asFloatE.

					xRotated := (rX + (srodek x asFloatE)) asFloatE.
					yRotated := (rY + (srodek y asFloatE)) asFloatE.

					xRotated @ yRotated
				].
			]
			ifFalse: [^ 'Podano zly kat'].


			!
	 !


	!Wielokat methodsFor: 'accessing'!

		nazwa
			"podaje nazwe wielokata"
			^nazwa!

		nazwa: nowa_nazwa
			"ustawia nowa nazwe wielokata"
			nazwa:=nowa_nazwa! !


	!Wielokat methodsFor: 'printing'!

		drukuj
			"drukuje zmienne wielokata"
			" Transcript show: 'Wielokat: ', self nazwa; cr;
						tab; show: 'Wierzcholki: '. "
			'Wielokat: ', nazwa displayNl.
			'	Wierzcholki: ' display.
			wierzcholki do: [:wierzcholek | 
				(wierzcholek printString, ' ') display.
				].
			Transcript cr.
			('	Pole: ', self pole printString) displayNl.
			('	SrodekGeometryczny: ', self srodekGeometryczny printString) displayNl.! !


Wielokat subclass: #TrojkatRownoboczny
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


	!TrojkatRownoboczny methodsFor: 'initialize-release'!

		initialize: bok
			"tworz trojkat o podanym boku"
			super initialize: 3 .
			self ustawWierzcholki: bok.!
		
		initialize: bok name: nowaNazwa
			"tworz trojkat o podanym boku i nazwie"
			super initialize: 3 name: nowaNazwa.
			self ustawWierzcholki: bok.! !

	!TrojkatRownoboczny methodsFor: 'private'!

		ustawWierzcholki: bok
			"ustawia wierzcholki trojkata"
			wierzcholki at: 2 put: bok@0.
			wierzcholki at: 3 put: ( bok / 2 )@(self wysokosc).! !


	!TrojkatRownoboczny methodsFor: 'arithmetic'!

		+ figura
			"dodaj 2 figury w sensie pola"
			| pole bok |
			pole:=self pole + figura pole.
			bok:=(4 * pole / 3 asFloatE sqrt) sqrt.
			^(TrojkatRownoboczny new) initialize: bok! !


	!TrojkatRownoboczny methodsFor: 'actions'!

		bok
			"zwraca bok trojkata"
			| p1 p2 |
			p1 := wierzcholki at: 1.
			p2 := wierzcholki at: 2.
			^(p1 dist: p2) asFloatE!

		wysokosc
			"zwraca wysokosc trojkata"
			^self bok * 3 asFloatE sqrt / 2!

		pole
			"zwraca pole trojkata"
			^self bok squared * (3 asFloatE sqrt) / 4! !
		

	!TrojkatRownoboczny methodsFor: 'printing'!

		drukuj
			"drukuje zmienne trojkata"
			super drukuj.
			('	Wysokosc: ', self wysokosc printString) displayNl.
			('	Bok: ', self bok printString) displayNl.! !


Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


	!Kwadrat methodsFor: 'initialize-release'!

		initialize: bok
			"tworz kwadrat o podanym boku"
			super initialize: 4.
			self ustawWierzcholki: bok.!
		
		initialize: bok name: nowaNazwa
			"tworz kwadrat o podanym boku i nazwie"
			super initialize: 4 name: nowaNazwa.
			self ustawWierzcholki: bok.! !

	!Kwadrat methodsFor: 'private'!

		ustawWierzcholki: bok
			"ustawia wierzcholki kwadratu"
			wierzcholki at: 2 put: bok@0.
			wierzcholki at: 3 put: bok@bok.
			wierzcholki at: 4 put: 0@bok! !

	!Kwadrat methodsFor: 'arithmetic'!

		+ figura
			"dodaj 2 figury w sensie pola"
			| p |
			p:=self pole + figura pole.
			^(Kwadrat new) initialize: (p asFloatE sqrt)! !


	!Kwadrat methodsFor: 'actions'!
	 
		bok
			"zwraca bok kwadratu"
			| p1 p2 |
			p1 := wierzcholki at: 1.
			p2 := wierzcholki at: 2.
			^(p1 dist: p2) asFloatE!

		pole
			"licz pole kwadratu"
			^self bok asFloat squared!
		
	
	!Kwadrat methodsFor: 'printing'!

		drukuj
			"drukuje zmienne kwadratu"
			super drukuj.
			('	Bok: ', self bok printString) displayNl.! !


| k1 k2 k3 |
k1:=Kwadrat new initialize: 4.
k2:=Kwadrat new initialize: 5. 
k3:=(k1 + k2). 
k3 drukuj.
k3 obroc: 45.
k3 drukuj.
k3 skaluj: 2.
k3 drukuj.

| t1 t2 t3 |
t1:=TrojkatRownoboczny new initialize: 4.
t2:=TrojkatRownoboczny new initialize: 5.
t3:=(t1 + t2).
t3 drukuj.
t3 skaluj: 2.
t3 drukuj.
t3 obroc: 45.
t3 drukuj.



