# RT-PAPER-DASGUPTA-KAKDE-23

Red team of the accepted extraction PAPER-DASGUPTA-KAKDE-23: Samit Dasgupta and Mahesh Kakde, *On the Brumer–Stark
conjecture*, Annals of Mathematics 197 (2023), 289–388 (arXiv 2010.00657v3). Issue #4060.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-fb70e5`, PR #1651);
- its review, REV-PAPER-DASGUPTA-KAKDE-23 (`cc-7b31c4`, PR #2380), or the errata file.

Disclosures: I wrote the red teams of PAPER-DASGUPTA-KAKDE-VENTULLO-18 and PAPER-NEWTON-THORNE-26, and the verification
of RS-14's red team. Findings here cite those papers' accepted routes, the independently confirmed
RT-PAPER-DASGUPTA-KAKDE-VENTULLO-18/3 and RS-14 itself, none of which I wrote.

**Result: 67 findings, 6 high, 33 medium and 28 low.**

## Method

**The source.** arXiv 2010.00657v3 (<https://arxiv.org/abs/2010.00657v3>), the version the extraction read, was
re-downloaded on 2026-10-01. Its PDF (`c1fe1cd8…`) and LaTeX source (`4a732681…`) hashes equal the extraction's. The
published Annals text is paywalled and was not read.

**The passes.** Six parallel passes were run by this session.
- Four read all 99 pages: §§1–3, §§4–6, §§7–8, and §9 with Appendices A and B and the references.
- Two checked statuses and routes: one the 243 items planned at IntegralIwasawaTheory and route 1, one every other
  planned or library status and routes 2–5, against the atlas, the accepted restructurings, other papers' accepted
  routes, earlier red teams and the pinned libraries (Mathlib 082e2d3, Tau Ceti f790474).

**Merging.** I merged findings reported by more than one pass:
- the Fitting-ideal owners; items on two source routes; I.3 as a planner; IHG.6 against I.7;
- the missing prerequisite links; the owners of Lemma 9.1; items 203 and 225; the prerequisites list;
- the unrecorded misprints and the drifting equation numbers (four passes each); the report's §3.

**What I re-verified myself.** All six high findings:
- the owners entries of RS-16 and RS-14 in data/restructure, against the planned lists and route memberships of the
  items concerned;
- Proposition 8.4's third k = 1 bullet in the TeX against Proposition 8.7 and (98), and the p. 62 display against the
  definition of F_k(𝛙) just before it;
- the Theorem B.8 step: Lemma B.6 for H^{Σ∖Σ_0} gives norms in G/K, and lifting through ∏ N_G I_u multiplies each term
  by ∏ #(I_v ∩ K), so the paper's "exactly the terms in (178)" fails when p divides one of these integers.

**Severities I changed.** Two findings are medium, not high, for the reasons given in each claim:
- the missing prerequisite links of I.6 and I.7, which the blueprint adds without a cycle;
- the Lemma 4.1 condition (1) gap, which I checked in the TeX and with the Q(i), p = 3 example: the paper uses (1) only
  after tensoring with Z_p, where Σ'' satisfies its p-part.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — duplicate

**Where.** PAPER-DASGUPTA-KAKDE-23/65, PAPER-DASGUPTA-KAKDE-23/78 (with PAPER-DASGUPTA-KAKDE-23/19,
PAPER-DASGUPTA-KAKDE-23/325); route 1; route 3; PAPER-DASGUPTA-KAKDE-23/325, PAPER-DASGUPTA-KAKDE-23/317,
PAPER-DASGUPTA-KAKDE-23/19, PAPER-DASGUPTA-KAKDE-23/65, PAPER-DASGUPTA-KAKDE-23/78; route 3 (items and reason); the
report (PAPER-DASGUPTA-KAKDE-23.md), §3 bullet on EulerSystemsAndKolyvaginSystems:ES.6 and
PadicMeasuresIwasawaAlgebras:L6, and §5 route 3

**Claim.** The basic Fitting-ideal facts that IntegralIwasawaTheory claims have four owners in the atlas. This
extraction plans base change of Fitting ideals (/65) and monotonicity under surjections (/78) at both
PadicMeasuresIwasawaAlgebras L6 and IntegralIwasawaTheory I.6, Fitt ⊆ Ann (/19) at L6, and the definition of Fitt_0
(/325) at L6 and IHG.6. It routes /65 and /78 through route 1, which tells the I.6/I.7 blueprint to build them. The
accepted restructuring RS-16 makes Tau Ceti StableReduction Layer 1 the single owner of the finite-presentation Fitting
carrier, and names L4, L6, I.6 and IHG.6 as its former owners. RS-16 keeps I.6 with generic Fitting ideals imported. The
accepted route 1 of PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22 sends the same base-change theorem (its item 7), the
annihilator bounds (item 5) and submultiplicativity (item 6) to IHG.6 as missing items, and plans Fitt_0 (item 3) at
StableReduction Layer 0. So one theorem, Fitt_{R'}(M ⊗_R R') = Fitt_R(M)·R', is planned at L6 and I.6 here and routed to
IHG.6 there. Also: The extraction makes PadicMeasuresIwasawaAlgebras:L6 (and, for item 325,
IntegralHeckeAndGaloisDeterminants:IHG.6) the owner of the basic Fitting-ideal carrier and its general-ring lemmas: item
325 (Fitt_0 of a finitely presented module over any commutative ring), item 317 (the higher Fitting ideals Fitt^i), item
19 (Fitt ⊂ Ann), item 65 (base change) and item 78 (monotonicity under surjections), all in route 3, which makes the
paper a blueprint source for L6 for them. The accepted restructuring RS-16 (accepted 2026-09-23, before this
extraction's review was merged) makes the Tau Ceti layer StableReduction Layer 1 the single owner of the
finite-presentation Fitting-ideal carrier, lists L6, L4, I.6 and IHG.6 as its former owners, and narrows L6 to
'higher-Fitting/order-specific algebra beyond the basic carrier'. Under PROTOCOL §15 a Tau Ceti layer is existing work
that is cited, never re-planned, so route 3 would have the L6 blueprint build a second carrier. Other accepted
extractions route the same general-ring statements elsewhere, so the atlas now has up to four owners for them:
PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22 plans Fitt_0 at Tau Ceti StableReduction and routes 'Fitt_0 ⊂ Ann' and base change
as missing to IHG.6; PAPER-KEDLAYA-LIU-15 routes Fitting ideals with base change to
FoundationsAndLibraryIntegration:LI.1. Item 19's note ('L6 is the only stage in the whole catalogue that supplies the
generic Fitting-ideal API'; StableReduction 'names Fitting ideals of sheaves only') is false.

**Evidence.** RS-16 owners entry (accepted 23 Sep 2026, before this extraction's review): {'target':
'Finite-presentation Fitting-ideal carrier shared with singular loci', 'owner':
'tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs', 'formerly':
['PadicMeasuresIwasawaAlgebras:L4', 'PadicMeasuresIwasawaAlgebras:L6', 'IntegralIwasawaTheory:I.6',
'IntegralHeckeAndGaloisDeterminants:IHG.6']}. RS-16 on I.6: 'Generic Fitting ideals are imported'. RS-16 narrows L6 to
'higher-Fitting/order-specific algebra beyond the basic carrier, importing that carrier from StableReduction'. Item /65
reads 'For a homomorphism of commutative rings R → R' and a finitely presented R-module M, Fitt_{R'}(M ⊗_R R') =
Fitt_R(M)·R''. PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22 item 7 reads 'For a ring map f:R->S and finitely presented M,
Fitt_0,S(S tensor_R M)=Ideal.map(f,Fitt_0,R(M))'. It is on that paper's route 1 (source,
IntegralHeckeAndGaloisDeterminants:IHG.6), which its review accepts. Confirmed finding RT-AREA-iwasawa-2/4 (review):
'Accepted RS-16 now imports the BASIC Fitting carrier from upstream StableReduction Layer 1, not a second IHG carrier;
L6 owns the order-specific extensions.' The pinned Mathlib has no Fitting ideal: the declaration index has 18 'Fitting'
names, all of them LieModule.posFittingComp*. Also: RS-16 owners entry: target 'Finite-presentation Fitting-ideal
carrier shared with singular loci', owner
'tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs', formerly
['PadicMeasuresIwasawaAlgebras:L4', 'PadicMeasuresIwasawaAlgebras:L6', 'IntegralIwasawaTheory:I.6',
'IntegralHeckeAndGaloisDeterminants:IHG.6']. RS-16 on L6 (narrow): '... Keep higher-Fitting/order-specific algebra
beyond the basic carrier, importing that carrier from StableReduction', suppliedBy the StableReduction Layer 1 stage.
Atlas stage tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs: 'Develop Kähler
differentials and Fitting ideals far enough to form the relative singular closed subscheme Sing(f)'. The reviewed
library audit (AUDIT-26) for L6 lists as duplicate
'tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs — Also develops Fitting ideals of
modules as a general tool.' PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22/3 (zeroth Fitting ideal) is planned at
tauceti:TauCetiRoadmap/StableReduction#layer-0-relative-curves-and-extensions-of-dvrs; its items /5 ('Ann_R(M)^b subset
Fitt_0(M) subset Ann_R(M)') and /7 ('Fitt_0,S(S tensor_R M)=Ideal.map(f,Fitt_0,R(M))') are missing in its route 1, a
source route to IHG.6 that its review accepts. PAPER-KEDLAYA-LIU-15/3 ('the Fitting ideals Fitt_i(M) are finitely
generated, increasing, eventually equal to R, and commute with base change') is missing in its route 7, a source route
to LI.1, accepted. In the pinned declaration index the only names containing 'fitting' are Lie-module Fitting
components; neither library has Fitting ideals of modules.

**Fix.** Remove IntegralIwasawaTheory:I.6 from the planned lists of /65 and /78, and take both out of route 1. Give the
basic carrier one owner, as RS-16 decided: plan /325 (Fitt_0) at
tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs. For /65 (base change), cite the open
request to that layer recorded in the fix report for RT-AREA-iwasawa-2/4, and until it is answered plan /65 at
PadicMeasuresIwasawaAlgebras:L6 'on the imported carrier'. Plan /19 and /78 at L6 on the imported carrier, as that fix
specifies. Plan none of them at I.6 or IHG.6. Add a note for the maintainer that route 1 of
PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22 routes the same statements to IHG.6, and that it plans Fitt_0 at StableReduction
Layer 0; both must be reconciled with RS-16. Also: Item 325: set planned to
['tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs'], dropping L6 and IHG.6, and cite
the RS-16 owner entry in the note. Item 317: name StableReduction Layer 1 first for the definition of Fitt^i and keep L6
only for the order-specific higher-Fitting lemmas the paper uses. Items 19, 65, 78: remove L6; give them the same owner
as the identical statements in PAPER-ANGLES-NGODAC-TAVARESRIBEIRO-22 (items 5 and 7, IHG.6) or PAPER-KEDLAYA-LIU-15
(item 3, LI.1), and record that coincidence in each note so the maintainer can merge the routes. Correct item 19's note.
Remove 325 (and 19, 65, 78 if rerouted) from route 3. In route 3's reason and in the report, replace 'reusing the
generic Fitting algebra of IntegralHeckeAndGaloisDeterminants' with 'L6, narrowed by RS-16, keeps order-specific and
higher-Fitting algebra and imports the finite-presentation Fitting carrier from Tau Ceti StableReduction Layer 1'.

### /2 — error

**Where.** route 1; route 2; route 3; route 5; PAPER-DASGUPTA-KAKDE-23/174, PAPER-DASGUPTA-KAKDE-23/185,
PAPER-DASGUPTA-KAKDE-23/199, PAPER-DASGUPTA-KAKDE-23/208, PAPER-DASGUPTA-KAKDE-23/209, PAPER-DASGUPTA-KAKDE-23/210,
PAPER-DASGUPTA-KAKDE-23/238, PAPER-DASGUPTA-KAKDE-23/4, PAPER-DASGUPTA-KAKDE-23/7, PAPER-DASGUPTA-KAKDE-23/37,
PAPER-DASGUPTA-KAKDE-23/67, PAPER-DASGUPTA-KAKDE-23/212, PAPER-DASGUPTA-KAKDE-23/213, PAPER-DASGUPTA-KAKDE-23/214,
PAPER-DASGUPTA-KAKDE-23/216, PAPER-DASGUPTA-KAKDE-23/217, PAPER-DASGUPTA-KAKDE-23/228, PAPER-DASGUPTA-KAKDE-23/229,
PAPER-DASGUPTA-KAKDE-23/233, PAPER-DASGUPTA-KAKDE-23/234, PAPER-DASGUPTA-KAKDE-23/329, PAPER-DASGUPTA-KAKDE-23/65,
PAPER-DASGUPTA-KAKDE-23/78, PAPER-DASGUPTA-KAKDE-23/92, PAPER-DASGUPTA-KAKDE-23/168, PAPER-DASGUPTA-KAKDE-23/318,
PAPER-DASGUPTA-KAKDE-23/326, PAPER-DASGUPTA-KAKDE-23/332, PAPER-DASGUPTA-KAKDE-23/270; route 3 (items
PAPER-DASGUPTA-KAKDE-23/42, PAPER-DASGUPTA-KAKDE-23/44, PAPER-DASGUPTA-KAKDE-23/92, PAPER-DASGUPTA-KAKDE-23/168,
PAPER-DASGUPTA-KAKDE-23/318)

**Claim.** Route 1 (source to I.6/I.7) carries 7 items that neither I.6 nor I.7 plans: /174, /185, /199, /208, /209,
/210 and /238, which are planned only at L3, B4, B5 and I.3. All seven are also on route 2. Another 22 items are carried
by route 1 and a second source route: route 2 for /4, /7, /37, /67, /212, /213, /214, /216, /217, /228, /229, /233, /234
and /329; route 3 for /65, /78, /92, /168, /318, /326 and /332; route 5 for /270. In all, 29 items make this paper a
source for two roadmaps' blueprints at once, so both are told to build the same statement. Route 3 (stage L6 only) also
carries /92 and /168, which are planned at L4, I.6 and I.7 but not at L6 (likewise /42 and /44, planned at L4 only). The
extraction also contradicts itself on L3: /221's note says L3 'plans the Eisenstein input (Prop 8.4 ...), not the
modified forms W_k or their constant terms'. Yet /216 (Definition of W_k), /228, /229 (their constant terms), /233, /234
(the group ring W_k) and /329 list L3 as a planner and are on route 2. Also: Route 3 names only
PadicMeasuresIwasawaAlgebras:L6 and says its items are 'general algebra ... not to the Brumer–Stark layers', but items
42 and 44 are planned only at PadicMeasuresIwasawaAlgebras:L4, not L6, and items 92 (the sets Σ, Σ_p, Σ'), 168 (the
trivial-zero-free character set Ψ) and 318 (Lemma B.4, comparing Fitt of Cl^T(H)^{∨,-} with Fitt^s of the Ritter–Weiss
module) are Brumer–Stark-specific and already in route 1.

**Evidence.** Route 1's 235 items include /174 (planned ['AutomorphicBundles:B4', 'AutomorphicPadicLFunctions:L3',
'IntegralIwasawaTheory:I.3']), /185 (['AutomorphicBundles:B5', 'AutomorphicPadicLFunctions:L3',
'IntegralIwasawaTheory:I.3']), /208, /209, /210 and /238 (['AutomorphicPadicLFunctions:L3',
'IntegralIwasawaTheory:I.3']), and /199 (['AutomorphicBundles:B5', 'AutomorphicPadicLFunctions:L3',
'IntegralIwasawaTheory:I.3']). Route 3's stages are ['PadicMeasuresIwasawaAlgebras:L6'], while /92 is planned at
['IntegralIwasawaTheory:I.7', 'IntegralIwasawaTheory:I.6', 'PadicMeasuresIwasawaAlgebras:L4'] and /168 at
['IntegralIwasawaTheory:I.7', 'PadicMeasuresIwasawaAlgebras:L4']. /270's own note says 'R19.2 owns the theorem'.
PROTOCOL §16 says a source route names items that belong inside the named layers, and §15 says every piece of
mathematics has exactly one owner. RS-16 makes L3 the sole owner of the Hilbert Eisenstein/q-expansion construction,
with I.3 and I.6 importing it. The FIX-RT-AREA-iwasawa-2 contract for confirmed finding /4 assigns the excess-generator
identity (175) and the locally-quadratic-to-quadratic step to L6, and Lemma B.4 for ∇ to I.6. Also: Route 3: stages
['PadicMeasuresIwasawaAlgebras:L6']; reason '... These are general algebra used by every Iwasawa roadmap and belong to
this owner, not to the Brumer–Stark layers.' Item 42 planned ['PadicMeasuresIwasawaAlgebras:L4']; item 44 planned
['PadicMeasuresIwasawaAlgebras:L4']; items 92, 168, 318 are in routes 1 and 3.

**Fix.** Put each planned item in at most one source route: the route of the layer that owns it. Remove /174, /185,
/199, /208, /209, /210 and /238 from route 1. Remove /4 from route 1 (Siegel–Klingen rationality is L3's 'algebraicity
of negative critical values'). Remove /216, /228, /229, /233, /234 and /329 from route 2 and delete L3 from their
planned lists, as /221's own reasoning requires. Remove /92 and /168 (and /42, /44) from route 3. Keep /326 and /332 on
route 3 only and /318 on route 1 only, and delete the other layer from each planned list. Keep /270 on route 5 only.
Remove /65 and /78 from route 1. For /7, /37, /67, /212, /213, /214 and /217, name one owner and drop the other route.
Rerun the paper checker and update the report's §5. Also: Remove items 92, 168 and 318 from route 3. For items 42 and 44
either add PadicMeasuresIwasawaAlgebras:L4 to route 3's stages with a sentence on why the paper is a source for L4, or
remove them from route 3.

### /3 — duplicate

**Where.** route 2 (reason, and items PAPER-DASGUPTA-KAKDE-23/174, PAPER-DASGUPTA-KAKDE-23/183,
PAPER-DASGUPTA-KAKDE-23/184, PAPER-DASGUPTA-KAKDE-23/185, PAPER-DASGUPTA-KAKDE-23/194, PAPER-DASGUPTA-KAKDE-23/199,
PAPER-DASGUPTA-KAKDE-23/186, PAPER-DASGUPTA-KAKDE-23/187, PAPER-DASGUPTA-KAKDE-23/188, PAPER-DASGUPTA-KAKDE-23/189,
PAPER-DASGUPTA-KAKDE-23/191, PAPER-DASGUPTA-KAKDE-23/192); the report (PAPER-DASGUPTA-KAKDE-23.md), §3 bullet on
AutomorphicPadicLFunctions:L3 and §5 route 2

**Claim.** Route 2 rests on the checkpoint KU-hilberteisenstein 'owns any missing modular-form and q-expansion
prerequisites' and on L3's base sentence 'Build the Hilbert Eisenstein series, integral q-expansion principle and
constant-term argument'. The accepted restructuring RS-14 (accepted 2026-09-23, before this extraction's review was
merged) narrowed both: L3 keeps Deligne–Ribet and the 'Hilbert Eisenstein construction on canonical geometric objects'
and imports the generic geometric expansion machinery from AutomorphicBundles:B5, a named supplier; KU-hilberteisenstein
is now a readiness check only. Consequences: (a) six planned items on generic Hilbert modular forms — 174 (the space
M_k(n)), 183, 184, 185 (q-expansions and the q-expansion principle), 194 and 199 (group-ring forms and Silliman's
characterisation) — list L3 as a planner next to AutomorphicBundles B4/B5, so each has two owners and route 2 makes the
paper an L3 source for material L3 now imports; (b) the generic missing items routed to L3 — the cusp ideal 𝔠_𝒜 and the
cusp sets C_∞(𝔟,𝔫), C_0(𝔟,𝔫) with their diamond-stability (186–189), and the nebentypus spaces and decomposition (191,
192) — are routed, on the superseded wording, to a layer that no longer owns generic Hilbert modular-form prerequisites,
while the extraction plans the neighbouring cusp material (176–179, including 𝔟_𝒜 from which 𝔠_𝒜 is defined) at B5.

**Evidence.** RS-14, layer AutomorphicPadicLFunctions:L3 (narrow): keeps 'Own Deligne–Ribet over general totally real F:
algebraicity of partial zeta values, Hilbert Eisenstein construction on canonical geometric objects, integral
congruences, bounded denominators, smoothing and Euler factors. ...'; suppliedBy includes 'AutomorphicBundles:B5';
reason '... CM theory and generic geometric expansion/Igusa constructions have canonical owners.' RS-14, layer
AutomorphicPadicLFunctions:KU-hilberteisenstein (narrow): keeps '... Verify that missing Hilbert modular/q-expansion
prerequisites are completed at L3 or its named geometric suppliers; no weight-two shortcut and no second construction at
this checkpoint'; reason 'Resolve the checkpoint's "owns any missing modular-form and q-expansion prerequisites" wording
as a readiness obligation for L3's construction.' RS-14 review: accepted, 2026-09-23. Atlas stage AutomorphicBundles:B5:
'Construct q-expansions at modular and Hilbert cusps ... Prove the expansion principle with the necessary connectedness,
base, and coefficient assumptions. Identify cuspidality with the appropriate boundary vanishing condition.' Route 2
reason: 'AutomorphicPadicLFunctions L3, with the checkpoint KU-hilberteisenstein ("owns any missing modular-form and
q-expansion prerequisites; no weight-two shortcut"), owns the Hilbert Eisenstein series, the integral q-expansion
principle and the constant-term argument'. The paper (arXiv v3, p. 46): '𝔠_𝒜 = (c)(𝔱_λ𝔡𝔟_𝒜)^{-1} ⊂ O_F ... The sets
C∞(b, n) and C0(b, n) are stable under the action of the diamond operators S(m).'

**Fix.** Remove AutomorphicPadicLFunctions:L3 from the planned lists of items 174, 183, 184, 185, 194 and 199 (keep
B4/B5), cite RS-14 in their notes, and drop them from route 2. Move the generic missing items 186, 187, 188, 189, 191
and 192 out of route 2 into a new source route to AutomorphicBundles:B5 (which the extraction already uses for 176–179
and the expansion principle), or state in route 2 why L3 must build them despite RS-14. Keep in route 2 only
Eisenstein-specific material: the Eisenstein series, their constant terms (219, 220), the p-part of the level (203) and
the Gauss sum (218). Replace the KU quotation in route 2's reason and in the report with RS-14's narrowed text.

### /4 — error

**Where.** PAPER-DASGUPTA-KAKDE-23/220; sourceIssues (absent from the extraction)

**Claim.** Item 220 part (iii) copies the third k = 1 bullet of Proposition 8.4, and that formula is false as printed.
For [𝒜] ∈ C_∞(𝔠_0,𝔫) ∖ C_0(𝔠,𝔫) the paper gives ψ(𝔟_𝒜)(L(ψ,0)/2^n)∏_{𝔭|𝔓}(1 − N𝔭^{-1})∏_{𝔩∈J_𝔪}(ψ(𝔩)N𝔩)^{-1}. The
correct value, which is what the cited source states and what the paper's own §7.3 and Proposition 8.7 use, is sgn(N
a)ψ^{-1}(a𝔟_𝒜^{-1})(L(ψ,0)/2^n)∏_{𝔭∈J_𝔓}(1 − N𝔭^{-1})∏_{𝔭∈J_𝔓^c}(1 − ψ(𝔭))∏_{𝔩∈J_𝔪}(ψ(𝔩)N𝔩)^{-1}. Two factors are wrong.
(1) The 𝔓-factor must depend on the cusp: a prime 𝔭 | 𝔓 that divides 𝔠_𝒜 contributes 1 − ψ(𝔭), not 1 − N𝔭^{-1}. (2) When
𝔠_0 ≠ 1, the character factor is sgn(N a)ψ^{-1}(a𝔟_𝒜^{-1}), not ψ(𝔟_𝒜). Under the convention of Remark 8.5 the two agree
when 𝔠_0 = 1. Check of (1) at the cusp ∞. Take 𝔠_0 ≠ 1, 𝔪 = 1, 𝔓 = 𝔭 a prime not dividing 𝔠_0, and 𝒜 = (1, λ). Then
c_𝒜(0) = c_λ(0), [𝒜] ∈ C_∞(𝔠_0,𝔫) ∖ C_0(𝔠,𝔫), 𝔟_𝒜 = 𝒪_F and J_𝔪 = ∅. The printed bullet gives 2^{-n}L(ψ,0)(1 − N𝔭^{-1}).
Equation (98) gives c_λ(0, E_1(ψ_S,1)) = 2^{-n}L(ψ_S,0) = 2^{-n}L(ψ,0)(1 − ψ(𝔭)). These differ, because L(ψ,0) ≠ 0 for
totally odd ψ and |ψ(𝔭)| = 1. Check of (2) for F = Q. Take ψ odd and primitive modulo q, T = {ℓ} with ℓ ∤ q, 𝔓 = 1 and 𝔪
= 1, at the cusps a/(qℓ), A = (a b; qℓ d) ∈ SL_2(Z). These lie in C_∞(𝔠_0,𝔫) ∖ C_0(𝔠,𝔫), with 𝔟_𝒜 = Z and J_𝔪 = ∅, so
the printed value L(ψ,0)/2 is the same for every a. But A ∈ Γ_0(q), so E_1(ψ,1)|A = ψ(d)^{±1}E_1(ψ,1) with d ≡ a^{-1}
(mod q), and the true constant term ψ(d)^{±1}L(ψ,0)/2 varies with a through the character. A further consequence: the
proofs of items 222 (iii) and 223 say they are a 'direct application' of item 220, but their C_∞ formulas, which are
correct, cannot be derived from item 220 as it stands.

**Evidence.** The paper (arXiv v3, p. 52), Proposition 8.4, k = 1: "If [A] ∈ C∞(c0, n) \ C0(c, n), the normalized
constant term at A is ψ(bA) L(ψ,0)/2^n ∏_{p|P}(1 − Np^{-1}) ∏_{l∈Jm}(ψ(l)Nl)^{-1}." On p. 49, equation (98): "c_λ(0,
E_1(ψ_S,1)) = 2^{-n}·L(ψ_S,0) if n ≠ 1". On pp. 53–54, Proposition 8.7 with 𝔠_0 ≠ 1: "If [A] ∈ C∞(c0t, n), the
normalized constant term at A is sgn(Na)ψ^{-1}(ab_A^{-1}) L_{S∞,T}(ψ,0)/2^n ∏_{p∈J_P}(1 − Np^{-1}) ∏_{p∈J^c_P}(1 −
ψ(p))". The cited source is Dasgupta–Kakde, On constant terms of Eisenstein series (arXiv:2010.00650), Theorem 4.7,
equation (46). Its second term is δ∞,A(a0)δ0,A(b)P_A(ψ, χ, 1, J^c_{a1}, J_{b1})∏_{q∈J_{a1}}(1 −
Nq^{-1})∏_{q∈J_m}(χ(q)Nq)^{-1}∏_{q∈J^c_m}ψ^{-1}(q). By its Definition 4.2, P_A(χ1,χ2,k,S,T) contains the factor
∏_{q∈S}(1 − χ^{-1}(q)Nq^{k−1}) and the factor sgn(α)^{q2}(χ2^0)^{-1}(a_A). With (χ, ψ) = (ψ_𝔓, 1) and k = 1 these give
exactly the corrected factors. The TeX source (Proposition p:enop, third k = 1 item) prints \prod_{\fp \mid \fP} (1 -
\N\fp^{-1}) and \psi(\fb_{\cA}).

**Fix.** In item 220, replace part (iii) with: 'if [𝒜] ∈ C_∞(𝔠_0,𝔫) ∖ C_0(𝔠,𝔫), the normalized constant term is sgn(N
a)ψ^{-1}(a𝔟_𝒜^{-1})·(L(ψ,0)/2^n)·∏_{𝔭∈J_𝔓}(1 − N𝔭^{-1})·∏_{𝔭∈J_𝔓^c}(1 − ψ(𝔭))·∏_{𝔩∈J_𝔪}(ψ(𝔩)N𝔩)^{-1}; when 𝔠_0 = 1 the
first factor is ψ(𝔟_𝒜), by Remark 8.5 (corrected statement; the paper misprints it).' The extraction has no sourceIssues
list and no sourceVersions; add both. Then add a new sourceIssue with these fields. kind: error. locator: Proposition
8.4, k = 1, third bullet, p. 52 (arXiv v3). printed: the Proposition 8.4 text quoted in this finding's evidence.
correction: the corrected formula. reason: the two checks in this finding's claim, plus the comparison with
Dasgupta–Kakde (Acta Arith. 200 (2021)) Theorem 4.7, which this proposition quotes. affects: a stated result
(Proposition 8.4). Propositions 8.7, 8.11 and 8.12 are stated with the correct factors, so the main theorems are
untouched. known: new; the cited Theorem 4.7 is correct, so this is a transcription error. searched: arXiv v3 of
2010.00657 and arXiv:2010.00650; the Annals version is paywalled and was not checked.

### /5 — error

**Where.** PAPER-DASGUPTA-KAKDE-23/329 (part iii), PAPER-DASGUPTA-KAKDE-23/245 (proof), PAPER-DASGUPTA-KAKDE-23/243
(parenthetical 'related identities')

**Claim.** These items state the identity e_p^ord ∏_{𝔭|p}(U_𝔭 − 𝛙(𝔭))(W_1(𝛙_𝔓,1)) = W_1(𝛙_{𝔓𝔓''},1) for case 2. As
written it is false whenever some prime 𝔭 | p with 𝔭 ∤ 𝔫 has χ(𝔭) = 1, i.e. whenever 𝔓' ≠ 𝔓''. The paper's display is a
misprint for ∏_{𝔭|𝔓''}, which is the operator in the definition of F_k(𝛙) printed immediately before it on p. 62.
Reason, in weight 1: for 𝔭 | 𝔓 the family is already 𝔭-depleted, so U_𝔭 acts as 1 (and 𝛙(𝔭) = 0 by the convention for 𝔭
| 𝔫, so the factor acts as 1). For 𝔭 | 𝔓' one has c(𝔪𝔭, E_1(ψ_𝔞,1)) − ψ(𝔭)c(𝔪, E_1(ψ_𝔞,1)) = c(𝔪, E_1(ψ_{𝔞𝔭},1)), so U_𝔭
− 𝛙(𝔭) depletes at 𝔭. The left side is therefore W_1(𝛙_{𝔓𝔓'},1). For 𝔭 | 𝔓' with 𝔭 ∤ 𝔓'', its coefficient at 𝔭 is 1,
while that of W_1(𝛙_{𝔓𝔓''},1) is 1 + 𝛙(𝔭), and 𝛙(𝔭) is a unit.

**Evidence.** The paper (arXiv v3, p. 62) defines "Fk(ψ) = e^ord_p ∏_{p|P''}(Up − ψ(p))(F̃k(ψ))" and then prints "Note
that e^ord_p ∏_{p|p}(Up − ψ(p))(W1(ψP, 1)) = W1(ψPP'', 1)." Corollary 8.21 then states "Fk(ψ) ≡ W1(ψPP'', 1) (mod Θ#)",
which follows only with ∏_{𝔭|𝔓''}. Item 329 (iii) reads: 'In case 2, e_p^ord ∏_{𝔭|p}(U_𝔭 − 𝛙(𝔭))(W_1(𝛙_𝔓,1)) =
W_1(𝛙_{𝔓𝔓''},1)'.

**Fix.** Replace ∏_{𝔭|p} by ∏_{𝔭|𝔓''} in item 329 (iii), in the proof sketch of item 245, and in the parenthetical of
item 243. Add a new sourceIssue with these fields. kind: misprint. locator: display between Corollary 8.19 and Corollary
8.21, p. 62 (arXiv v3). printed: the display quoted in this finding's evidence. correction: ∏_{𝔭|𝔓''}. reason: the
coefficient comparison at 𝔭 | 𝔓'/𝔓''. affects: nothing, since Corollary 8.21 is right. known: new.

### /6 — error

**Where.** PAPER-DASGUPTA-KAKDE-23/323 (Theorem B.8), with PAPER-DASGUPTA-KAKDE-23/24 (Theorem 1.4) and
PAPER-DASGUPTA-KAKDE-23/322; sourceIssues (absent); report (PAPER-DASGUPTA-KAKDE-23.md) §1; route 1

**Claim.** The proof of Theorem B.8, which is the paper's proof of Kurihara's conjecture (Theorem 1.4), contains a false
step. Item 323 copies it as if it were correct, and no sourceIssue records it. After Lemma B.6 is applied to H' =
H^{Σ∖Σ_0}, the paper says that multiplying by ∏_{v∈Σ∖Σ_0} N I_v gives 'exactly the terms in (178)', and from this it
deduces (179). (The extraction numbers these equations (182) and (183).) The step fails. In Lemma B.6 applied to H',
each factor N I_v with v ∈ Σ̄∖J_0 is the norm of the inertia group of H'/F, that is, of the image Ī_v of I_v in G' =
G/K, where K = I_{Σ∖Σ_0}. In (178) the factor is N_G I_v. The product P = ∏_{u∈Σ∖Σ_0} N_G I_u kills the kernel of ℤ[G] →
ℤ[G/K]. Also N_G I_v maps to #(I_v ∩ K)·N_{G'} Ī_v. So each term of (178) is the corresponding multiplied term times the
integer ∏_{v∈Σ̄∖J_0} #(I_v ∩ K). When p divides this integer, (179) is false. The last sentence of the proof ('Writing J
= Σ_0 ∪ J_0, we obtain the expression (176)') makes the same identification in reverse. The two errors cancel in the
printed formula, but the argument does not prove (176) in this case. Counterexample to (179) over F = ℚ: let p be an odd
prime, ℓ ≡ 1 (mod p) a prime, K the cyclic degree-p field cut out by ψ_1ψ_2 (ψ_1 of conductor p² and order p, ψ_2 of
conductor ℓ and order p), k = ℚ(√−q) with q ≡ 3 (mod 4) prime such that p and ℓ split in k, and H = Kk. Then G = C × ⟨c⟩
with #C = p, I_p = I_ℓ = C, I_q = ⟨c⟩, Σ = S_∞ ∪ {p} and Σ̄ = {ℓ, q}. Take Σ_0 = S_∞ and J_0 = {q}. The (178) term is
N_C·N_C·F = p·N_C·F, where (F) = Fitt(∇^T_{S_∞∪{q}}(k)_p^-) ≠ 0 because this minus module is finite. The multiplied term
is N_C·F, since ℓ is unramified in k. On the minus side, every generator of the left side (177) maps into p²F·ℤ_p under
ℤ_p[G]^- → ℤ_p[G/C]^- ≅ ℤ_p. The generators with p or ℓ in J vanish there because p and ℓ split in k, which makes the
corresponding α-columns zero modulo C by Lemma B.3. But N_C·F maps to pF. So the right side of (179) is strictly larger
than its left side. The stated formula (176) is not shown to be false: in this example it agrees with (177) once Theorem
3.7 is used. What fails is the proof.

**Evidence.** The paper (arXiv v3, p. 96), proof of Theorem B.8: 'Now apply Lemma B.6 with J = Σ_0 and H replaced by
H^{Σ∖Σ_0}. … we obtain Fitt^{s−s_0}_{R_0} ∇^T_{Σ_0}(H^{Σ∖Σ_0})_p = (∏_{v∈\overline{Σ∪J_0}} NI_v · Fitt_{R_0}
∇^T_{Σ_0∪J_0}(H^{\overline{Σ∪J_0}})_p : J_0 ⊂ Σ̄) ⊂ R_0. If we multiply by ∏_{v∈Σ∖Σ_0} NI_v, we obtain exactly the terms
in (178) corresponding to Σ_0.' In (178) the factor is ∏_{v∈\overline{Σ_0∪J_0}} NI_v, taken in G (Lemma B.6 for H).
Proof of Lemma B.6 (p. 95): 'Since β_v(x) = NI_v · β^0_v(x), we pull out the factors NI_v from these columns'. By (142)
(p. 81), 'β_w(x) = NI_w · β^0_w(x) ∈ ℤ[G_w]', where I_w is the inertia group of the field in question, so for H' it is
the image of I_v in G/I_{Σ∖Σ_0}. Appendix B, introduction (p. 89): multiplication by ∏_{v∈J̄} NI_v is the map ℤ[G/I_J̄]
→ ℤ[G], so the paper's N I_v in G-terms is the norm in G. Searched for an existing correction: arXiv 2010.00657 v1–v3
(the v3 comment says only 'A reference is updated'), the Annals article page (paywalled), and
Dasgupta–Kakde–Silliman–Wang, 'The Brumer–Stark conjecture over Z', arXiv 2310.16399v1, whose text does not revisit
Appendix B. None corrects the step.

**Fix.** Add a sourceIssues list to the extraction and put a new sourceIssue in it. Fields: kind error; locator 'Proof
of Theorem B.8, the display after "Writing s_0 = …" and equation (179), p. 96, arXiv v3'; printed 'If we multiply by
∏_{v∈Σ∖Σ_0} NI_v, we obtain exactly the terms in (178) corresponding to Σ_0'; correction 'the multiplied terms are the
(178) terms divided by ∏_{v∈Σ̄∖J_0} #(I_v ∩ I_{Σ∖Σ_0}), because Lemma B.6 for H^{Σ∖Σ_0} produces norms of the inertia
groups of H^{Σ∖Σ_0}/F; (179) and the final identification with (176) hold as written only when these integers are prime
to p'; reason: the computation and the ℚ-example above; affects 'the proof'; known 'new'; searched as listed. Add a
sourceVersions entry: the arXiv v3 preprint, read on 2026-09-21, with the PDF SHA-256 c1fe1cd8… and the TeX SHA-256
4a732681… that the extraction already records. In item 323, replace 'multiplying by ∏_{v∈Σ∖Σ_0} N I_v recovers the terms
of (182) for that Σ_0, so (183) …' with the correct relation and a statement that (183) and the last step are proved
only when p ∤ #(I_v ∩ I_{Σ∖Σ_0}) for all v ∈ Σ̄. Add notes to items 24 and 322, to the report's §1 sentence 'Appendix B
recovers Kurihara's full formula …' and to the route 1 reason. Each must say that the IntegralIwasawaTheory:I.7
blueprint has to supply a repaired argument or an independent proof of Theorem 1.4 in this case, and must not formalise
(179) as printed.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | duplicate | PAPER-DASGUPTA-KAKDE-23/65, PAPER-DASGUPTA-KAKDE-23/78 (with …; … | The basic Fitting-ideal facts that IntegralIwasawaTheory claims have four owners in the atlas. This extraction plans base change of Fitting ideals (/65) and … |
| /2 | high | error | route 1; … | Route 1 (source to I.6/I.7) carries 7 items that neither I.6 nor I.7 plans: /174, /185, /199, /208, /209, /210 and /238, which are planned only at L3, B4, B5 … |
| /3 | high | duplicate | route 2 (reason, and items PAPER-DASGUPTA-KAKDE-23/174, …; … | Route 2 rests on the checkpoint KU-hilberteisenstein 'owns any missing modular-form and q-expansion prerequisites' and on L3's base sentence 'Build the Hilbert … |
| /4 | high | error | PAPER-DASGUPTA-KAKDE-23/220; … | Item 220 part (iii) copies the third k = 1 bullet of Proposition 8.4, and that formula is false as printed. For [𝒜] ∈ C_∞(𝔠_0,𝔫) ∖ C_0(𝔠,𝔫) the paper gives … |
| /5 | high | error | PAPER-DASGUPTA-KAKDE-23/329 (part iii), PAPER-DASGUPTA-KAKDE-23/245 … | These items state the identity e_p^ord ∏_{𝔭/p}(U_𝔭 − 𝛙(𝔭))(W_1(𝛙_𝔓,1)) = W_1(𝛙_{𝔓𝔓''},1) for case 2. As written it is false whenever some prime 𝔭 / p with 𝔭 ∤ … |
| /6 | high | error | PAPER-DASGUPTA-KAKDE-23/323 (Theorem B.8), with …; … | The proof of Theorem B.8, which is the paper's proof of Kurihara's conjecture (Theorem 1.4), contains a false step. Item 323 copies it as if it were correct, … |
| /7 | medium | error | PAPER-DASGUPTA-KAKDE-23/23, PAPER-DASGUPTA-KAKDE-23/53, …; … | These 27 items are marked planned at IntegralIwasawaTheory I.7 (some also at I.6), but neither layer's text names their statement or the object they are about. … |
| /8 | medium | duplicate | PAPER-DASGUPTA-KAKDE-23/174, PAPER-DASGUPTA-KAKDE-23/185, …; … | These nine items list IntegralIwasawaTheory:I.3 as a planner, beside AutomorphicPadicLFunctions L3 (and AutomorphicBundles B4/B5). They cover Hilbert modular … |
| /9 | medium | duplicate | PAPER-DASGUPTA-KAKDE-23/281, PAPER-DASGUPTA-KAKDE-23/282, …; … | Fifteen §9 items list both IntegralHeckeAndGaloisDeterminants:IHG.6 and IntegralIwasawaTheory:I.7 as planners and are carried by route 1. A sixteenth, /285 … |
| /10 | medium | missing | route 1 (IntegralIwasawaTheory:I.6, I.7 requires); … | Building I.6 and I.7 from this paper, as route 1 asks, needs layers that are not ancestors of I.6 or I.7, even after adding every link of all accepted … |
| /11 | medium | error | PAPER-DASGUPTA-KAKDE-23/268, PAPER-DASGUPTA-KAKDE-23/271; … | Lemma 9.1 (/268: the restriction of ρ_f to any finite-index subgroup is irreducible for a non-CM cuspidal eigenform of weight k > 1) and Lemma 9.2 (/271: for a … |
| /12 | medium | missing | PAPER-DASGUPTA-KAKDE-23/79, PAPER-DASGUPTA-KAKDE-23/81; … | The proof of Lemma 3.9 has a gap that the confirmed red-team finding RT-AREA-iwasawa-2/4 recorded, and the extraction does not record it. The last display … |
| /13 | medium | error | PAPER-DASGUPTA-KAKDE-23/196 (against PAPER-DASGUPTA-KAKDE-23/191) | Item 196 (M_k(n,A,ψ) and S_k(n,A,ψ): nebentypus spaces of Hilbert modular forms over an arbitrary ring A) is planned at AutomorphicBundles:B5 and … |
| /14 | medium | error | PAPER-DASGUPTA-KAKDE-23/179, PAPER-DASGUPTA-KAKDE-23/180, …; … | Three items are planned at AutomorphicBundles B4/B5 (and ShimuraCompactifications:C6) although their own notes concede that no layer states them: item 179, the … |
| /15 | medium | error | PAPER-DASGUPTA-KAKDE-23/219, PAPER-DASGUPTA-KAKDE-23/220, …; … | Items 219 and 220 (Proposition 8.4: the constant terms of E_k(ψ_𝔓,1)/_𝔪 at every cusp, for k > 1 and k = 1) are planned at AutomorphicPadicLFunctions:L3 alone. … |
| /16 | medium | error | PAPER-DASGUPTA-KAKDE-23/39 (and the AnalyticNumberTheory:AN.4 … | Item 39, the T-smoothed Dedekind class number formula at s = 0 (ζ*_{K,S∞,T}(0) = ±#Cl^T(K)R_T(K), order of vanishing rank O_K^*), is planned at … |
| /17 | medium | error | PAPER-DASGUPTA-KAKDE-23/247, PAPER-DASGUPTA-KAKDE-23/249 | Item 247 includes 'f_p, the ordinary stabilization of f with respect to all primes 𝔭 / p' of a p-ordinary Hilbert newform, and item 249(a) the span of the … |
| /18 | medium | error | PAPER-DASGUPTA-KAKDE-23/33; … | Conjecture 1.5 (Rubin: u_RBS ∈ 𝓛), item 33, is planned at EulerSystemsAndKolyvaginSystems ES.7 and ES.6, but no layer plans it. The extraction marks every … |
| /19 | medium | duplicate | PAPER-DASGUPTA-KAKDE-23/31; … | Item 31 (the bidual ⋂^r_{ℤ[G]} U_{S,T}) names ES.6 first among its planners and is in both route 3 and route 4; route 4's reason ('ES.6 owns the exterior power … |
| /20 | medium | duplicate | PAPER-DASGUPTA-KAKDE-23/330 (route 1), PAPER-DASGUPTA-KAKDE-23/29 …; … | The equivariant S-unit theorem is planned by no atlas layer, and accepted extractions route it, as missing, to three owners. This extraction routes item 330 … |
| /21 | medium | error | PAPER-DASGUPTA-KAKDE-23/152, PAPER-DASGUPTA-KAKDE-23/156 | Both items conclude that a module is cohomologically trivial and both are planned at Tau Ceti ClassFieldTheory layers, which plan no such statement; the … |
| /22 | medium | error | PAPER-DASGUPTA-KAKDE-23/75 | Item 75's load-bearing clause is N v ≡ 1 (mod #I_{v,p}) (I_{v,p} a quotient of (O_F/v)^*), used in Remark 3.6 and the proof of Theorem 3.7. Neither cited stage … |
| /23 | medium | error | PAPER-DASGUPTA-KAKDE-23/82, PAPER-DASGUPTA-KAKDE-23/331 | Both items state an isomorphism of functors to ℤ[G]-modules compatible with the contragredient action: Hom_{ℤ[1/2]}(−, ℤ[1/2]) ≅ Hom_{ℤ[G]}(−, ℤ[G]^-) on … |
| /24 | medium | error | PAPER-DASGUPTA-KAKDE-23/27, PAPER-DASGUPTA-KAKDE-23/29, …; … | The Rubin items never require the split primes v_1,…,v_r to lie outside T, and they use one letter S for two different sets. (i) If some v_j ∈ T, every u ∈ … |
| /25 | medium | missing | PAPER-DASGUPTA-KAKDE-23/34; … | No item states the steps by which §3.4 deduces Theorem 1.6 (Rubin's conjecture away from 2) from Strong Brumer–Stark. Item 34 is a bare statement whose locator … |
| /26 | medium | error | sourceIssues (a new sourceIssue); … | Lemma 4.1 replaces Σ' by Σ'' = Σ' − {v ∈ T : v / p}, and from then on (§§5–9 and Appendix A) the paper works with a T that contains no primes above p. But Σ'' … |
| /27 | medium | missing | sourceIssues (a new sourceIssue); … | Lemma 5.4 (Sel_Σ^{Σ'}(H)_ψ ≅ Sel_Σ^{Σ'}(H_ψ)_ψ) has its proof omitted as 'nearly identical to Lemma 4.2', but the key step of Lemma 4.2 does not carry over. … |
| /28 | medium | error | PAPER-DASGUPTA-KAKDE-23/105; … | Lemma 5.6 as printed, and item 105 which copies it, concerns the wrong module. It computes the size of (Cl^{Σ'}(H_ψ)_R)^∨/NI, the dual of the χ-component. … |
| /29 | medium | missing | PAPER-DASGUPTA-KAKDE-23/84 to PAPER-DASGUPTA-KAKDE-23/93 (a new item … | No item states the reduction that §4 proves, which links Theorem 3.3 (item 36) to Theorem 5.1 (item 93). The reformulation (49) of Theorem 3.3 on each … |
| /30 | medium | missing | PAPER-DASGUPTA-KAKDE-23/117 (a new item for the cited result) | The proof of Lemma 6.3 cites Cassels–Fröhlich [8, Proposition 3, p. 99]: for a finite group G, a G-module N and g ∈ G, the G-module map given by the action of … |
| /31 | medium | error | PAPER-DASGUPTA-KAKDE-23/91 | Item 91 (Lemma 4.3) says only 'Let χ be a character of G''. Its proof, as the item records it, uses Lemma 3.1 in both steps. Lemma 3.1 is a statement about … |
| /32 | medium | missing | PAPER-DASGUPTA-KAKDE-23/194, PAPER-DASGUPTA-KAKDE-23/195, …; … | No item covers how complex-analytic Hilbert modular forms become forms with coefficients in Z, O or Frac O. The paper defines M_k(𝔫,A) := M_k(𝔫,Z) ⊗ A. It then … |
| /33 | medium | missing | PAPER-DASGUPTA-KAKDE-23/228, PAPER-DASGUPTA-KAKDE-23/229, … | The cusp-form construction multiplies the weight-one family W_1 by Hida–Silliman's form V_{k−1}. This happens in f_k(ψ) of Proposition 8.11, in the form of … |
| /34 | medium | missing | PAPER-DASGUPTA-KAKDE-23/329, PAPER-DASGUPTA-KAKDE-23/243 | Case 1a of Corollary 8.19 uses a step that neither the paper nor any item states: e_p^ord W_1(𝛙,1) = W_1(𝛙,1). The weight-one Eisenstein family is already … |
| /35 | medium | missing | PAPER-DASGUPTA-KAKDE-23/228, PAPER-DASGUPTA-KAKDE-23/229, … | The extraction uses 'T' in two senses and never records the identification that links them. Item 225, following §8.3, sets 𝔫 = cond(H/F)∏_{𝔩∈T}𝔩, where T is … |
| /36 | medium | duplicate | PAPER-DASGUPTA-KAKDE-23/203 and PAPER-DASGUPTA-KAKDE-23/225; … | Items 203 and 225 both define the p-part 𝔓 = gcd(p^∞, 𝔫) of the level, with conflicting statuses. Item 203 is 'missing' and routed by route 2 to … |
| /37 | medium | missing | Appendix A and B items (PAPER-DASGUPTA-KAKDE-23/125, /147, /165–167, …; … | No item covers the existence of the auxiliary set S'. The construction of ∇ needs such a set (item 125 only defines it), and the paper never proves that one … |
| /38 | medium | missing | prerequisites (top-level list); … | The prerequisites list leaves out two cited papers that §9 and Appendix A use essentially and that the atlas does not cover, and it includes one paper the … |
| /39 | medium | error | prerequisites (top-level list): the Greither, Dasgupta–Kakde (Acta … | Four prerequisite links are wrong DOIs. Three resolve to different papers and one resolves to nothing, so a later batch would fetch the wrong paper or none. … |
| /40 | low | other | report (PAPER-DASGUPTA-KAKDE-23.md) §3; … | The report's §3 says that items covered by Tau Ceti roadmaps 'are marked planned with those layers and no route takes them'. But route 1 carries 11 items whose … |
| /41 | low | library-claim | PAPER-DASGUPTA-KAKDE-23/64, PAPER-DASGUPTA-KAKDE-23/22 | Both items are planned at Tau Ceti stages whose relevant output is already in the pinned libraries. Item 64 (Y_{H,{v}} ⊗ K ≅ Ind_{G_v}^G K, whose ψ-part is K … |
| /42 | low | error | PAPER-DASGUPTA-KAKDE-23/122 | Tau Ceti ProfiniteCohomology Layer 7 is cited for the Shapiro step of Ext^1_{ℤ[G]^-}((Ind_{G_v}^G ℤ)^-, M) ≅ H^1(G_v, M). Layer 7 plans Shapiro with coinduced … |
| /43 | low | error | PAPER-DASGUPTA-KAKDE-23/287 | Item 287 states H^1(P, M) = 0 for P pro-ℓ (ℓ ≠ p) and any pro-p group M with continuous action, 'e.g. ... a finitely generated 𝒪-module with its p-adic … |
| /44 | low | error | PAPER-DASGUPTA-KAKDE-23/175, PAPER-DASGUPTA-KAKDE-23/176, … | Some items cite layers that consume, rather than own, the classical objects. Items 176–178 name ShimuraCompactifications:C6 as an owner of the … |
| /45 | low | other | route 5 (reason); … | Route 5's reason says R19.2 'plans their existence and local properties'. R19.2 plans uniqueness, continuity, determinants, oddness and irreducibility; … |
| /46 | low | error | PAPER-DASGUPTA-KAKDE-23/54, PAPER-DASGUPTA-KAKDE-23/55, … | The planned/missing test for L6 is applied inconsistently. Items 54 and 55 (Lemma 2.6: Fitt(B) = Fitt(A)Fitt(C) when C is quadratically presented, and … |
| /47 | low | missing | §1.2 (route 4) | The paper states that the Brumer–Stark conjecture is equivalent to the rank r = 1 case of Rubin's conjecture; no item records this, though it links Conjecture … |
| /48 | low | library-claim | PAPER-DASGUPTA-KAKDE-23/51 | The item states that for a PID B and a square matrix A, (det A) = (∏ x_i) for the Smith normal form entries and #(B^m/AB^m) = #(B/(det A)). The cited … |
| /49 | low | error | PAPER-DASGUPTA-KAKDE-23/15 (against PAPER-DASGUPTA-KAKDE-23/20) | Item 15, the dual Cl^T(H)^∨ = Hom_ℤ(Cl^T(H), ℚ/ℤ) with the contragredient G-action, is missing (route 1), while item 20 (Ann(M^∨) = Ann(M)^# for the same dual) … |
| /50 | low | other | sourceIssues (missing entry); … | In §1.2 the paper reuses the letter S for the set {v_1,…,v_r} of split primes. Θ_{S,T} in the same paragraph needs the earlier S ⊇ S_∞ ∪ S_ram. Read literally, … |
| /51 | low | other | sourceIssues (missing entry); … | The last paragraph of §1.3 says 'Appendix B contains the proof of Kurihara's Conjecture (Theorem 1.7)'. Theorem 1.7 is the keystone theorem on the Selmer … |
| /52 | low | other | sourceIssues (missing entries); … | Five misprints in §§1–3 are recorded nowhere. Some items silently use the corrected text: items 12–14 for (a) and item 48 for (c). (a) p. 5: 'Pick a prime P of … |
| /53 | low | error | PAPER-DASGUPTA-KAKDE-23/72; … | Item 72 copies a slip from the proof of Lemma 3.4: 'each (Θ_{J,T}^{H^{J̄}/F})^# ∈ ℤ[Gal(H^{J̄}/F)]^- by (2)'. Deligne–Ribet (2) gives membership in … |
| /54 | low | other | PAPER-DASGUPTA-KAKDE-23/63, PAPER-DASGUPTA-KAKDE-23/66, …; … | Items 63, 66 and 68 state the trivial-zero vanishing for every character ψ ≠ 1 (every Ψ ∌ 1) and every v ∈ Σ, archimedean or not, with ψ(G_v) = 1. They absorb … |
| /55 | low | error | PAPER-DASGUPTA-KAKDE-23/70 | Item 70's locator places Lemma 3.4 in §3.2 four times ('notation recalled from §3.2, proof of Lemma 3.4, label l:sku'; 'also §3.2, proof of Lemma 3.4, line … |
| /56 | low | error | PAPER-DASGUPTA-KAKDE-23/325 | Item 325's statement says 'the higher Fitting ideals Fitt^i_R(M) of Appendix B (item 326)'. Item 326 is 'Locally quadratic presentation'. The higher Fitting … |
| /57 | low | error | PAPER-DASGUPTA-KAKDE-23/6 | Item 6 states 'If T contains two primes of different residue characteristic, or one prime of residue characteristic larger than [F:ℚ] + 1, then condition (1) … |
| /58 | low | error | PAPER-DASGUPTA-KAKDE-23/328; … | Item 328 states the change-of-depletion sequence for S_∞ ⊂ Σ_0 ⊂ Σ, but then uses the instance 'Σ_0 = Σ_p for H_ψ'. Σ_p consists of finite primes only and does … |
| /59 | low | error | PAPER-DASGUPTA-KAKDE-23/324 | Item 324 says 'Over ℤ[1/2], X_{H,Σ}^- ≅ Y_{H,Σ}^- (item 129)'. Item 129 is the notation ∏~_v M_w for induced products; the isomorphism X^- ≅ Y^- is item 121. |
| /60 | low | error | the report (PAPER-DASGUPTA-KAKDE-23.md), §2 'How the keystone theorem … | The report says that 'Theorem 5.1 shows that if Fitt_R(Sel_Σ^{Σ'}(H)_R) ⊆ (Θ^#_{Σ,Σ'}) holds in every situation, then equality holds'. This leaves out the … |
| /61 | low | error | Locators of PAPER-DASGUPTA-KAKDE-23/168–PAPER-DASGUPTA-KAKDE-23/257 …; … | The equation and subsubsection numbers in the §§7–8 locators and statements are wrong, and no locator gives a PDF page. (a) Every equation number is too large. … |
| /62 | low | error | the report (PAPER-DASGUPTA-KAKDE-23.md), summary item 3 on §§7–8; … | The report says the paper constructs F_k(𝛙) 'congruent to an Eisenstein series modulo xΘ^# (Theorems 8.17–8.18, Corollaries 8.19, 8.21), where x = … |
| /63 | low | error | notes of PAPER-DASGUPTA-KAKDE-23/199 and PAPER-DASGUPTA-KAKDE-23/238 | Two notes misdescribe the mathematics. (1) The note of item 199 describes equation (94) as concerning a form 'all of whose coefficients c(m,·) and constant … |
| /64 | low | error | PAPER-DASGUPTA-KAKDE-23/323; … | In the proof of Theorem B.8, the display obtained from Lemma B.6 applied to H^{Σ∖Σ_0} has a misprint in the field superscript. It prints … |
| /65 | low | error | PAPER-DASGUPTA-KAKDE-23/322 (Lemma B.7); … | Item 322's proof sketch says that Theorem 3.7 is applied to H^{Σ∖Σ_0}/F, 'whose Σ-set is Σ_0'. This is false in general. If some v ∈ Σ_0∖S_∞ has I_v ⊂ … |
| /66 | low | missing | PAPER-DASGUPTA-KAKDE-23/259, /278, /301 (local reciprocity map and … | No item covers the local Artin map rec : F_𝔭^* → G_𝔭^{ab}, which the paper uses to define the unramified character η_𝔭 in (110) and (114) and to choose the … |
| /67 | low | error | PAPER-DASGUPTA-KAKDE-23/258, PAPER-DASGUPTA-KAKDE-23/275; … | Item 258's statement ('the p-ordinary group-ring Hecke algebras of level 𝔫𝔓' (§8.7)') and item 275's statement ('the 𝒪-algebra injections with finite cokernel … |

## Notes for the fix job

- **Owners first.** Apply RS-16 and RS-14 to the statuses: the basic Fitting carrier from Tau Ceti StableReduction Layer
  1, generic q-expansions and boundary vanishing from AutomorphicBundles B5, the Hilbert Eisenstein construction at L3,
  I.3 only for the Stickelberger dictionary. Then put every item on at most one source route.
- **Circular statuses.** Mark planned at I.6/I.7 only what their texts name; the rest stays on route 1 as missing.
- **Source issues.** The errata file holds E1. Add the new ones: Proposition 8.4's third k = 1 bullet, the p. 62
  product, the Theorem B.8 step, the Lemma 4.1 condition (1) gap, Lemma 5.4's omitted proof, Lemma 5.6's module, and the
  misprints the low findings list, with a sourceVersions entry for arXiv v3.
- **Theorem B.8.** Tell the I.7 blueprint not to formalise (179) as printed: it needs a repaired argument, or an
  independent proof of Kurihara's formula when p divides some #(I_v ∩ I_{Σ∖Σ_0}).
