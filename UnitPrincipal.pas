unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TFrmPrincipal = class(TForm)
    lytToolbar: TLayout;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    lytPesquisa: TLayout;
    StyleBook: TStyleBook;
    rectPesquisa: TRectangle;
    Edit1: TEdit;
    Image3: TImage;
    Button1: TButton;
    lytSwitch: TLayout;
    rectSwitch: TRectangle;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    lvMercado: TListView;
    imgShop: TImage;
    imgTaxa: TImage;
    imgPedidoMin: TImage;
    procedure FormShow(Sender: TObject);
  private
    procedure AddMercadoLv(id_mercado: integer; nome, endereco: string;
                            tx_entrega, vl_min_ped: double);
    procedure ListarMercados;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

procedure TFrmPrincipal.AddMercadoLv(id_mercado: integer;
                                     nome, endereco: string;
                                     tx_entrega, vl_min_ped: double);
var
    img: TListItemImage;
    txt: TListItemText;
    //item: TListViewItem;
begin
    //item := lvMercado.Items.Add;
    //with item do

    with lvMercado.Items.Add do
    begin
        Height := 115;
        Tag := id_mercado;

        img := TListItemImage(Objects.FindDrawable('imgShop'));
        img.Bitmap := imgShop.Bitmap;

        img := TListItemImage(Objects.FindDrawable('imgTaxa'));
        img.Bitmap := imgTaxa.Bitmap;

        img := TListItemImage(Objects.FindDrawable('imgCompraMin'));
        img.Bitmap := imgPedidoMin.Bitmap;

        txt := TListItemText(Objects.FindDrawable('txtNome'));
        txt.Text := nome;

        txt := TListItemText(Objects.FindDrawable('txtEndereco'));
        txt.Text := endereco;

        txt := TListItemText(Objects.FindDrawable('txtTaxa'));
        txt.Text := 'Taxa de entrega: ' + FormatFloat('R$ #,##0.00', tx_entrega);

        txt := TListItemText(Objects.FindDrawable('txtCompraMin'));
        txt.Text := 'Compra mínima: ' + FormatFloat('R$ #,##0.00', vl_min_ped);
    end;
end;

procedure TFrmPrincipal.ListarMercados;
begin
    AddMercadoLv(1, 'Pão de Açúcar', 'Av. Paulista, 1500', 10, 50);
    AddMercadoLv(1, 'Pão de Açúcar', 'Av. Paulista, 1500', 10, 50);
    AddMercadoLv(1, 'Pão de Açúcar', 'Av. Paulista, 1500', 10, 50);
    AddMercadoLv(1, 'Pão de Açúcar', 'Av. Paulista, 1500', 10, 50);
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
    ListarMercados;
end;

end.
