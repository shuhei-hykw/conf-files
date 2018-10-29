// -*- C++ -*-
{
  //std::cout<<"Hello Root!!"<<std::endl;
  // gSystem->Load("/usr/local/lib/libjsoncpp.dylib");
  gStyle->SetOptStat(1111110);
  gStyle->SetHistLineColor(kBlack);
  gStyle->SetStatX(0.9);
  gStyle->SetStatY(0.9);
  gStyle->SetStatH(0.2);
  gStyle->SetStatW(0.2);
  // gStyle->SetPadGridX(kTRUE);
  // gStyle->SetPadGridY(kTRUE);
  // gStyle->SetPadTickX(kTRUE);
  // gStyle->SetPadTickY(kTRUE);

  {//////////////////// 1x1
    TStyle *myStyle = new TStyle("MyStyle","MyStyle");
    gROOT->GetStyle("Modern")->Copy(*myStyle);
    //gROOT->GetStyle("Plain")->Copy(*myStyle);
    myStyle->SetOptStat(0);
    myStyle->SetPadGridX(0);
    myStyle->SetPadGridY(0);

    // const Int_t myfont = 42;
    //const Int_t myfont = 22;
    const Int_t myfont = 132;

    // Frame margin
    myStyle->SetPadBottomMargin(0.12);
    myStyle->SetPadLeftMargin(0.18);
    //myStyle->SetPadRightMargin(0.05);
    myStyle->SetPadTopMargin(0.05);
    myStyle->SetPadBorderSize(0);

    // Grid
    myStyle->SetPadGridX(kTRUE);
    myStyle->SetPadGridY(kTRUE);

    // Tick
    myStyle->SetPadTickX(kTRUE);
    myStyle->SetPadTickY(kTRUE);

    // Font Label Title
    myStyle->SetLabelFont(myfont,"xyz");
    myStyle->SetTitleFont(myfont,"xyz");

    // Size Label Title
    myStyle->SetLabelSize(0.045,"xyz");
    myStyle->SetTitleSize(0.055,"xyz");

    // Align
    // myStyle->SetTitleAlign(22);
    // myStyle->SetTitleX(0);
    // myStyle->SetTitleY(0);

    // Title
    myStyle->SetOptTitle(0);

    // Statistics
    myStyle->SetOptStat(0);

    // Marker
    myStyle->SetMarkerStyle(8);
    myStyle->SetMarkerSize(2);
  }

  {//////////////////// 1x2
    TStyle *myStyle12 = new TStyle("MyStyle12","MyStyle12");
    gROOT->GetStyle("MyStyle")->Copy(*myStyle12);

    // Frame margin
    myStyle12->SetPadBottomMargin(0.165);

    // Size Label Title
    myStyle12->SetLabelSize(0.07,"xyz");
    myStyle12->SetTitleSize(0.08,"xyz");

    // Offset Label
    myStyle12->SetTitleOffset(0.5,"y");
  }

  {
    // color
    const int NRGBs = 5;
    const int NCont = 255;

    double stops[NRGBs] = {0.00, 0.34, 0.61, 0.84, 1.00};
    double red[NRGBs]   = {0.00, 0.00, 0.87, 1.00, 0.51};
    double green[NRGBs] = {0.00, 0.81, 1.00, 0.20, 0.00};
    double blue[NRGBs]  = {0.51, 1.00, 0.12, 0.00, 0.00};

    /* TColor::CreateGradientColorTable(NRGBs, stops, red, green, blue, NCont); */
    gStyle->SetNumberContours(NCont);
  }
  gROOT->SetStyle("MyStyle");
}
