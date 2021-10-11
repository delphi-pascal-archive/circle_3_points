unit Fenetre_Principale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, ExtCtrls, StdCtrls, ComCtrls, Calculs;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    GroupBox2: TGroupBox;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    GroupBox3: TGroupBox;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    GroupBox4: TGroupBox;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Button2: TButton;
    Button1: TButton;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RichEdit1: TRichEdit;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure InitialiseCanvas;
    procedure Button2Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    function AdapterEquation(Equation:TEquationDroite):string;
    procedure TracerDroite(Equation:TEquationDroite);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  PointEnCours:byte;
  Point1,Point2,Point3:TCPoint;
  EtapeCalcul:byte;
  Droite1,Droite2:TEquationDroite;
  MilieuSegment1,MilieuSegment2:TCPoint;
  MediatriceSegment1,MediatriceSegment2:TEquationDroite;
  CentreCercle:TCPoint;
  Rayon:extended;

implementation

{$R *.dfm}

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  StatusBar1.Panels[1].Text:='X : '+IntToStr(X);
  StatusBar1.Panels[2].Text:='Y : '+IntToStr(Y);
end;

procedure TForm1.InitialiseCanvas;
begin
  PointEnCours:=1;
  EtapeCalcul:=1;
  Image1.Canvas.Pen.Color:=clBlue;
  Image1.Canvas.Pen.Width:=1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  InitialiseCanvas;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Button1.Enabled then
    Button1.Enabled:=False;
  Image1.Picture.Bitmap:=nil;
  InitialiseCanvas;
  StatusBar1.Panels[0].Text:='En attente du premier point';
  Panel4.Caption:='';
  Panel6.Caption:='';
  Panel8.Caption:='';
  Panel10.Caption:='';
  Panel12.Caption:='';
  Panel14.Caption:='';
  Panel16.Caption:='';
  Panel18.Caption:='';
  Panel20.Caption:='';
  RichEdit1.Clear;
  RichEdit1.Lines.Add('Soit 3 points A,B,C tels que:');
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // Les trois points sont déjà definis
  if PointEnCours>3 then
    exit;
  case PointEnCours of
    1:begin
        // On stocke les coordonnées du premier point
        Point1.xP:=X;
        Point1.yP:=Y;
        // On affiche ses coordonnées
        Panel4.Caption:=IntToStr(X);
        Panel6.Caption:=IntToStr(Y);
        // On écrit à quoi correspond cette étape de calcul
        StatusBar1.Panels[0].Text:='En attente du deuxième point';
        RichEdit1.Lines.Add('- A('+IntToStr(X)+';'+IntToStr(Y)+')');
        // On affiche le nom du point à côté de celui-ci
        Image1.Canvas.TextOut(X-10,Y-15,'A');
      end;
    2:begin
        // Idem Point1
        Point2.xP:=X;
        Point2.yP:=Y;
        Panel8.Caption:=IntToStr(X);
        Panel10.Caption:=IntToStr(Y);
        StatusBar1.Panels[0].Text:='En attente du troisième point';
        RichEdit1.Lines.Add('- B('+IntToStr(X)+';'+IntToStr(Y)+')');
        Image1.Canvas.TextOut(X-10,Y-15,'B');
      end;
    3:begin
        // Idem Point1
        Point3.xP:=X;
        Point3.yP:=Y;
        Panel12.Caption:=IntToStr(X);
        Panel14.Caption:=IntToStr(Y);
        StatusBar1.Panels[0].Text:='En attente étape suivante';
        RichEdit1.Lines.Add('- C('+IntToStr(X)+';'+IntToStr(Y)+')');
        RichEdit1.Lines.Add('');
        Image1.Canvas.TextOut(X-10,Y-15,'C');
        Button1.Enabled:=True;
      end;
  end;
  // On dessine le point en cours
  Image1.Canvas.Ellipse(X-2,Y-2,X+2,Y+2);
  Inc(PointEnCours);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  case EtapeCalcul of
    1:begin
        // Calcul, affichage et dessin de la droite (AB)
        RichEdit1.Lines.Add('Calcul de l''equation de la droite passant par A et B');
        Droite1:=CalculerEquationDroite(Point1,Point2);
        RichEdit1.Lines.Add('=> '+AdapterEquation(Droite1));
        RichEdit1.Lines.Add('');
        StatusBar1.Panels[0].Text:='Trace de la droite passant par A et B';
        Image1.Canvas.Pen.Color:=clFuchsia;
        TracerDroite(Droite1);
      end;
    2:begin
        // Calcul, affichage et dessin de la droite (BC)
        RichEdit1.Lines.Add('Calcul de l''equation de la droite passant par B et C');
        Droite2:=CalculerEquationDroite(Point2,Point3);
        RichEdit1.Lines.Add('=> '+AdapterEquation(Droite2));
        RichEdit1.Lines.Add('');
        StatusBar1.Panels[0].Text:='Trace de la droite passant par B et C';
        TracerDroite(Droite2);
      end;
    3:begin
        // Calcul, affichage et dessin du milieu de [AB]
        RichEdit1.Lines.Add('Calcul des coordonnées du point I, milieu de [AB]');
        MilieuSegment1:=CalculerMileuSegment(Point1,Point2);
        RichEdit1.Lines.Add('=> I('+FloatToStrF(MilieuSegment1.xP,ffGeneral,6,18)+';'+FloatToStrF(MilieuSegment1.yP,ffGeneral,6,18)+')');
        RichEdit1.Lines.Add('');
        StatusBar1.Panels[0].Text:='Localisation du point I, milieu de [AB]';
        Image1.Canvas.Pen.Color:=clBlue;
        Image1.Canvas.Ellipse(Trunc(MilieuSegment1.xP-2),Trunc(MilieuSegment1.yP-2),Trunc(MilieuSegment1.xP+2),Trunc(MilieuSegment1.yP+2));
        Image1.Canvas.TextOut(Trunc(MilieuSegment1.xP-10),Trunc(MilieuSegment1.yP-15),'I');
      end;
    4:begin
        // Calcul, affichage et dessin du milieu de [BC]
        RichEdit1.Lines.Add('Calcul des coordonnées du point J, milieu de [BC]');
        MilieuSegment2:=CalculerMileuSegment(Point2,Point3);
        RichEdit1.Lines.Add('=> I('+FloatToStrF(MilieuSegment2.xP,ffGeneral,6,18)+';'+FloatToStrF(MilieuSegment2.yP,ffGeneral,6,18)+')');
        RichEdit1.Lines.Add('');
        StatusBar1.Panels[0].Text:='Localisation du point J, milieu de [BC]';
        Image1.Canvas.Ellipse(Trunc(MilieuSegment2.xP-2),Trunc(MilieuSegment2.yP-2),Trunc(MilieuSegment2.xP+2),Trunc(MilieuSegment2.yP+2));
        Image1.Canvas.TextOut(Trunc(MilieuSegment2.xP-10),Trunc(MilieuSegment2.yP-15),'J');
      end;
    5:begin
        // Calcul, affichage et dessin de la médiatrice de [AB]
        RichEdit1.Lines.Add('Calcul de l''equation de la médiatrice de [AB]');
        MediatriceSegment1:=CalculerEquationPerpandiculaire(Droite1,MilieuSegment1);
        RichEdit1.Lines.Add('=> '+AdapterEquation(MediatriceSegment1));
        RichEdit1.Lines.Add('');
        StatusBar1.Panels[0].Text:='Tracé de la mediatrice de [AB]';
        Image1.Canvas.Pen.Color:=clMaroon;
        TracerDroite(MediatriceSegment1);
      end;
    6:begin
        // Calcul, affichage et dessin de la médiatrice de [BC]
        RichEdit1.Lines.Add('Calcul de l''equation de la médiatrice de [BC]');
        MediatriceSegment2:=CalculerEquationPerpandiculaire(Droite2,MilieuSegment2);
        RichEdit1.Lines.Add('=> '+AdapterEquation(MediatriceSegment2));
        RichEdit1.Lines.Add('');
        StatusBar1.Panels[0].Text:='Tracé de la mediatrice de [BC]';
        TracerDroite(MediatriceSegment2);
      end;
    7:begin
        // Calcul, affichage et dessin du centre du cercle
        RichEdit1.Lines.Add('Calcul des coordonnées du point O, intersection des mediatrices');
        CentreCercle:=CalculerIntersection(MediatriceSegment1,MediatriceSegment2);
        RichEdit1.Lines.Add('=> O('+FloatToStrF(CentreCercle.xP,ffGeneral,6,18)+';'+FloatToStrF(CentreCercle.yP,ffGeneral,6,18)+')');
        RichEdit1.Lines.Add('');
        StatusBar1.Panels[0].Text:='Localisation du point O, intersection des mediatrices';
        Image1.Canvas.Pen.Color:=clRed;
        Image1.Canvas.Ellipse(Trunc(CentreCercle.xP-2),Trunc(CentreCercle.yP-2),Trunc(CentreCercle.xP+2),Trunc(CentreCercle.yP+2));
        Image1.Canvas.TextOut(Trunc(CentreCercle.xP-10),Trunc(CentreCercle.yP-15),'O');
        Panel16.Caption:=FloatToStrF(CentreCercle.xP,ffGeneral,6,18);
        Panel18.Caption:=FloatToStrF(CentreCercle.yP,ffGeneral,6,18);
      end;
    8:begin
        // Calcul, affichage du rayon du cercle et dessin du cercle
        RichEdit1.Lines.Add('Calcul du rayon du cercle de centre O');
        Rayon:=CalculerDistance(CentreCercle,Point1);
        RichEdit1.Lines.Add('=> R='+FloatToStrF(Rayon,ffGeneral,6,18));
        Panel20.Caption:=FloatToStrF(Rayon,ffGeneral,6,18);
        StatusBar1.Panels[0].Text:='Tracé du cercle de centre O';
        Image1.Canvas.Brush.Style:=bsClear;
        Image1.Canvas.Pen.Color:=clGreen;
        Image1.Canvas.Pen.Width:=2;
        Image1.Canvas.Ellipse(Round(CentreCercle.xP-Rayon),Round(CentreCercle.yP-Rayon),Round(CentreCercle.xP+Rayon),Round(CentreCercle.yP+Rayon));
        Button1.Enabled:=False;
      end;
  end;
  Inc(EtapeCalcul);
end;

// Cette fonction évite les problèmes de syntaxe lors de l'affichage d'une équation de droite
// Exemple : 5x+-3y+-7=0 deviens 5x-3y-7=0
function TForm1.AdapterEquation(Equation:TEquationDroite):string;
var
  ChaineTemp:string;
begin
  ChaineTemp:=FloatToStrF(Equation.aD,ffGeneral,6,18)+'X';
  if Equation.bD<0 then
    ChaineTemp:=ChaineTemp+FloatToStrF(Equation.bD,ffGeneral,6,18)+'Y'
  else
    ChaineTemp:=ChaineTemp+'+'+FloatToStrF(Equation.bD,ffGeneral,6,18)+'Y';
  if Equation.cD<0 then
    ChaineTemp:=ChaineTemp+FloatToStrF(Equation.cD,ffGeneral,6,18)
  else
    ChaineTemp:=ChaineTemp+'+'+FloatToStrF(Equation.cD,ffGeneral,6,18);
  Result:=ChaineTemp;
end;

// Calcul des deux extremités d'une droite en fonction de son equation
procedure TForm1.TracerDroite(Equation:TEquationDroite);
var
  Depart,Arrivee:extended;
begin
  Depart:=-Equation.cD/Equation.bD;
  Arrivee:=(-Equation.aD*545-Equation.cD)/Equation.bD;
  if (Depart>=0) and (Depart<=337) then
    Image1.Canvas.MoveTo(0,Trunc(-Equation.cD/Equation.bD));
  if Depart<0 then
    Image1.Canvas.MoveTo(Trunc(-Equation.cD/Equation.aD),0);
  if Depart>337 then
    Image1.Canvas.MoveTo(Trunc((-Equation.bD*337-Equation.cD)/Equation.aD),337);
  if (Arrivee>=0) and (Arrivee<=337) then
    Image1.Canvas.LineTo(545,Trunc(Arrivee));
  if Arrivee<0 then
    Image1.Canvas.LineTo(Trunc(-Equation.cD/Equation.aD),0);
  if Arrivee>337 then
    Image1.Canvas.LineTo(Trunc((-Equation.bD*337-Equation.cD)/Equation.aD),337);
end;

end.
