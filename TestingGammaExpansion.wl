(* ::Package:: *)

(* ::Input::Initialization:: *)
<<Gamma.m


(* ::Input::Initialization:: *)
DefManifold[M,11,{a,b,c,d,e,f}];
DefMetric[-1,g[-a,-b ],CD,{";","\[Del]"}];
DefTensor[gamma[ ],M,PrintAs->"\[CapitalGamma]"];


(* ::Input::Initialization:: *)
CombineListsGamma[neg_List,pos_List]:=Join[-neg,pos];
TransDeltaGamma[expr_]:=If[expr[[0]]===DeltaGamma,
Gdelta@@CombineListsGamma[expr[[1]],expr[[2]]],
expr
];

ReplaceDeltaGamma[expr_]:= If[expr[[0]]===DeltaGamma,
TransDeltaGamma[expr],
expr[[0]]@@ReplaceDeltaGamma/@List@@expr
];


(* ::Input::Initialization:: *)
TransGammaProd[expr_]:=If[expr[[0]]===GammaProd,
Times@@((gamma@@-#)&/@(List@@expr)),
expr
];

ReplaceGammaProd[expr_]:= If[expr[[0]]===GammaProd,
TransGammaProd[expr],
expr[[0]]@@ReplaceGammaProd/@List@@expr
];


(* ::Input::Initialization:: *)
SelectNegativeSymbols[l_]:=Select[l,(Characters@ToString@#)[[1]]=="-"&];
SelectPositiveSymbols[l_]:=Select[l,(Characters@ToString@#)[[1]]!="-"&];
TransGdelta[expr_]:=If[expr[[0]]===Gdelta||expr[[0]]===delta,
DeltaGamma[-SelectNegativeSymbols[List@@expr],SelectPositiveSymbols[List@@expr]],
expr
];

ReplaceGdelta[expr_]:= If[expr[[0]]===Gdelta||expr[[0]]===delta,
TransGdelta[expr],
expr[[0]]@@ReplaceGdelta/@List@@expr
];


(* ::Input::Initialization:: *)
TransGamma[expr_]:=If[expr[[0]]===gamma,
GammaProd[-List@@expr],
expr
];

ReplaceGamma[expr_]:= If[expr[[0]]===gamma,
TransGamma[expr],
expr[[0]]@@ReplaceGamma/@List@@expr
];
