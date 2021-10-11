unit Calculs;

interface

uses Dialogs;

// Repr�sente une equation de droite de la forme ax+by+c=0
type TEquationDroite=record
  aD:extended;
  bD:extended;
  cD:extended;
end;

// Repr�sente un vecteur de coordonn�es (x;y)
type TVecteur=record
  xV:extended;
  yV:extended;
end;

// Repr�sente un point de coordonn�es (x;y)
type TCPoint=record
  xP:extended;
  yP:extended;
end;

// Repr�sente une expression litt�rale de la forme lx+c
type TEquation=record
  lE:extended;
  cE:extended;
end;

// Repr�sente un vecteur dont les coordonn�es sont fonction d'une expression
type TVecteurImaginaire=record
  xI:TEquation;
  yI:TEquation;
end;

function CalculerEquationDroite(Point1,Point2:TCPoint):TEquationDroite;
function CalculerMileuSegment(Point1,Point2:TCPoint):TCPoint;
function CalculerEquationPerpandiculaire(EquationDeBase:TEquationDroite;PointDePassage:TCPoint):TEquationDroite;
function CalculerIntersection(Droite1,Droite2:TEquationDroite):TCPoint;
function CalculerDistance(Point1,Point2:TCPoint):extended;


implementation

{ Fonction de calcul de l'equation d'une droite � partir de deux points de passage
  --------------------------------------------------------------------------------

  On prends 3 points :
  - le point A, pass� en parametre (Point1), de coordonn�es (xA;yA)
  - le point B, pass� en parametre (Point2), de coordonn�es (xB;yB)
  - le point M, quelconque mais appartenant � la droite (AB), de coordonn�es (xM;yM)

                                             ->    ->
  Si M appartient � (AB), alors les vecteurs AB et AM sont colin�aires

   --> | xB-xA            --> | xM-xA
   AB  |           et     AM  |
       | yB-yA                | yM-yA

                  ->    ->
  Si les vecteurs AB et AM sont colin�aires, alors leur determinant est nul

      -> ->
  Det(AB;AM)=((xb-xA)*(yM-yA))-((yB-yA)*(xm-xA))=0

  Dans cette expression, xA,xB,yA et yB sont connus, on d�veloppe le tout puis
  on regroupe les termes => on obtient l'equation de la droite (AB) en fonction
  des coordonn�es de M

}

function CalculerEquationDroite(Point1,Point2:TCPoint):TEquationDroite;
var
  VecteurPoint1Point2:TVecteur;
  VecteurPoint1PointM:TVecteurImaginaire;
  EquationFinale:TEquationDroite;
begin
  VecteurPoint1Point2.xV:=Point2.xP-Point1.xP;
  VecteurPoint1Point2.yV:=Point2.yP-Point1.yP;
  VecteurPoint1PointM.xI.lE:=1;
  VecteurPoint1PointM.xI.cE:=-Point1.xP;
  VecteurPoint1PointM.yI.lE:=1;
  VecteurPoint1PointM.yI.cE:=-Point1.yP;
  EquationFinale.aD:=-VecteurPoint1Point2.yV*VecteurPoint1PointM.xI.lE;
  EquationFinale.bD:=VecteurPoint1Point2.xV*VecteurPoint1PointM.yI.lE;
  EquationFinale.cD:=(VecteurPoint1Point2.xV*VecteurPoint1PointM.yI.cE)-(VecteurPoint1Point2.yV*VecteurPoint1PointM.xI.cE);
  Result:=EquationFinale;
end;

{ Fonction de calcul du milieu d'un segment
  -----------------------------------------

  On prends 3 points :
  - le point A, pass� en parametre (Point1), de coordonn�es (xA;yA)
  - le point B, pass� en parametre (Point2), de coordonn�es (xB;yB)
  - le point I, milieur de [AB]

  Les coordonn�es du mileu du segment sont telles que :

     xA+xB   yA+yB
  I( ----- ; ----- )
       2       2)

}

function CalculerMileuSegment(Point1,Point2:TCPoint):TCPoint;
var
  CoordonneesFinale:TCPoint;
begin
  CoordonneesFinale.xP:=(Point1.xP+Point2.xP)/2;
  CoordonneesFinale.yP:=(Point1.yP+Point2.yP)/2;
  Result:=CoordonneesFinale;
end;

{ Fonction de calcul de l'equation de la perpandiculaire � une droite passant par un point de cette droite
  --------------------------------------------------------------------------------------------------------

  On prends :
  - 1 droite (AB), d'equation ax+by+c=0 (EquationDeBase)
  - 1 point I, de coordonn�es (xI;yI) (PointDePassage)
  - 1 droite D, perpandiculaire � (AB), passant par I, d'equation aDx+bDy+cD=0

  Si les deux droites sont perpandiculaires, alors leurs vecteurs directeurs sont orthonormaux

                       ->                    -> | -b
  Le vecteur directeur u de (AB) est tel que u  |
                                                | a

                    ->                   -> | a
  Le vecteur normal n � (AB) est tel que n  |
                                            | b
          ->
  De plus n est un vecteur directeur de la droite perpandiculaire � (AB)

  -> | a              -> | -bD
  n  |        <=>     n  |           =>  -bD=a et aD=b
     | b                 | aD

  On obtient ainsi les deux premiers termes de l'equation de D, il ne reste plus qu'� trouver cD
  Si I appartient � D, alors ses coordonn�es v�rifient l'equation de D

  aD(xI)+bD(yI)+cD=0  aD,xI,bD,yI sont connus => on obtient cD => on a l'equation de D

}

function CalculerEquationPerpandiculaire(EquationDeBase:TEquationDroite;PointDePassage:TCPoint):TEquationDroite;
var
  EquationFinale:TEquationDroite;
begin
  EquationFinale.aD:=EquationDeBase.bD;
  EquationFinale.bD:=-EquationDeBase.aD;
  EquationFinale.cD:=-((PointDePassage.xP*EquationFinale.aD)+(PointDePassage.yP*EquationFinale.bD));
  Result:=EquationFinale;
end;

{ Fonction de calcul du point d'intersection de deux droite
  ---------------------------------------------------------

  On prends deux droites :
  - une droite D, d'equation aDx+bDy+cD=0  (Droite1)
  - une droite E, d'equation aEx+bEy+cE=0  (Droite2)

  Si ces droites ont un point d'intersection, alors les coordonn�es de ce point
  v�rifient les deux �quations
  On a donc un syst�me de deux �quations � deux inconnues � r�soudre

   | aDx+bDy+cD=0
   | aEx+bEy+cE=0

  => On obtient les coordonn�es du point d'intersection

}

function CalculerIntersection(Droite1,Droite2:TEquationDroite):TCPoint;
var
  CoordonneesFinales:TCPoint;
  ExpY:TEquation;
  ValX:extended;
  ValY:extended;
begin
  try
    ExpY.lE:=-Droite1.aD/Droite1.bD;
    ExpY.cE:=-Droite1.cD/Droite1.bD;
  except
    MessageDlg('Certains points sont align�s, aucun cercle ne peut passer par ces 3 points en m�me temps',mtWarning,[mbOk],0);
  end;
  ValX:=(-((Droite2.bD*ExpY.cE)+Droite2.cD))/(Droite2.aD+(Droite2.bD*ExpY.lE));
  ValY:=(ExpY.lE*ValX)+ExpY.cE;
  CoordonneesFinales.xP:=ValX;
  CoordonneesFinales.yP:=ValY;
  Result:=CoordonneesFinales
end;

{ Fonction de calcul de la distance entre deux points
  ---------------------------------------------------

  On prends 2 points :
  - un point A, de coordonn�es (xA:yA)  (Point1)
  - un point B, de coordonn�es (xB;yB)  (Point2)

  La distance d entre ces deux points est telle que :

         __________________
    d= \/ (xB-xA)�+(yB-yA)�

}

function CalculerDistance(Point1,Point2:TCPoint):extended;
begin
  Result:=Sqrt(Sqr(Point2.xP-Point1.xP)+Sqr(Point2.yP-Point1.yP));
end;

end.
 