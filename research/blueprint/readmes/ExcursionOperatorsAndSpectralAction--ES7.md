# Excursion operators and the spectral action — stratum maps and the GL_n comparison

*A blueprint packet for the Tau Ceti Atlas roadmap `ExcursionOperatorsAndSpectralAction`,
part `ES7` (layers ES7, ES7:parabolic, ES7:GLn-comparison, ES7:equal-characteristic,
ES7:function-field-automorphic). Written by Claude Code, session `cc-7b31c4`,
24 September 2026, for issue #728.*

## What this document is

Bernstein-stratum normalisation and the classical GL_n comparison: layers ES7,
ES7:parabolic, ES7:GLn-comparison, ES7:equal-characteristic and ES7:function-field-
automorphic, the third and last part of this roadmap. Twenty-four nodes. ES7:parabolic
plans FS Definition IX.7.1 and Section IX.7.1's twisted Levi cocycle inclusion, and
Theorem IX.7.2 and Corollary IX.7.3 WITH THEIR PROOFS IN FULL, broken into the
coefficient reduction by l-adic separatedness, the basic case through the Hecke-
equivariant Bun_G = Bun_{G_b}, the z-embedding reduction to a quasisplit group, the
increasingly unstable sequence b_N with its count of modifications, the constant-term
computation with its cyclotomic twist and its degree-zero remark, and the unnormalised
parabolic-induction statement with the explicit twist (d/2)[d], d = <2rho,mu>. It adds
the dictionary to normalised induction, which the roadmap demands and the source does
not supply. ES7:GLn-comparison plans Theorem IX.7.4 with its proof in full: the two
minuscule Hecke operators as the Lubin-Tate and Drinfeld towers, with the shift and the
half Tate twist hidden in the perverse normalisation; the two-leg trace computation
normalised by the identity Weil tuple; the supercuspidal agreement and its transport
through a summand of T_std; the extension to all irreducibles; and the integral
refinement recovering Helm-Moss. ES7:equal-characteristic and ES7:function-field-
automorphic are planned from HAUSBERGER 2005, downloaded, hashed and READ IN FULL in
this session: D-elliptic sheaves, the moduli with its smoothness and projectivity and
its extension over a place, special formal O_D-modules and Drinfeld's theorem, the
uniformisation in both formal and rigid-analytic forms, the fundamental local
representation with its three commuting actions, the Hochschild-Serre spectral sequence
and the degeneration of its cuspidal part, the Drinfeld-Carayol theorem, and the global
inputs - which automorphic representations occur, the globalisation with prescribed
supercuspidal places, the simple-trace-formula transfer with multiplicity one, and the
resulting isotypic computation. LAUMON-RAPOPORT-STUHLER ITSELF COULD NOT BE READ: the
only copy obtained is a 124-page image scan with no text layer, and Kaiser's erratum is
a two-page scan likewise. Everything attributed to them comes through Hausberger's
restatements, every affected node says so, and both files are recorded with their URLs
and hashes in the gaps. Twenty-two baseline declarations, all read at the pins,
including three the reviewed audit AUDIT-20 pointed to and that a direct search would
have missed. Eleven gaps, each with a next source action. Thirty-six requests. Three
structural findings, all of them duplicate or shared-work findings that AUDIT-20's own
duplicate records made visible.

Nothing here is formalised. Every node carries `implementationStatus: "unchecked"`,
no Lean was compiled for this job, and the suggested file is a set of signatures and
`example` statements, not a development.

## The sources, and how they were read

### Geometrization of the local Langlands correspondence

- Laurent Fargues, Peter Scholze.
- `https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf`
- SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`, accessed 2026-09-24.
- Author-hosted 356-page PDF (MPIM Bonn); corresponds to arXiv:2102.13459v4 by metadata and contents, not by byte comparison. PDF page = printed page.

- IX.7 Applications to representations of G(E), printed pp. 334-338, read IN FULL:
  Definition IX.7.1 with its parenthesis on i_{b!}; Section IX.7.1's Levi structure and
  the twisted cocycle formula with its geometric-Frobenius normalisation; Theorem IX.7.2
  with its proof in full - the coefficient reduction, the basic case through Corollary
  III.4.3, the z-embedding reduction to quasisplit G, the increasingly unstable sequence
  b_N with its modification count, and the constant-term computation with the degree-
  zero remark; Corollary IX.7.3 with its proof in full, including the computation
  T_mu(A)|_{Bun^1_G} = Ind pi (d/2)[d] with d = <2rho,mu>; and Theorem IX.7.4 with its
  proof in full, including the two-tower identification, the normalisation remark about
  the shift and the half twist, the two-leg trace argument and the integral refinement.
- IX.3, printed pp. 324-326, read for Theorem IX.3.1 and the translation between Hecke
  operators and local Shimura varieties, which the GL_n comparison uses. That material
  belongs to HeckeStacksAndLocalShtukas:HS3 and is cited, not planned.
- IX.5 and IX.6, printed pp. 327-333, read in the companion parts of this roadmap and
  used here for Theorem IX.5.2, Theorem IX.6.1 and the standing coefficient hypothesis.

### Uniformisation des varietes de Laumon-Rapoport-Stuhler et conjecture de Drinfeld-Carayol

- Thomas Hausberger.
- `https://aif.centre-mersenne.org/item/AIF_2005__55_4_1285_0.pdf`
- SHA-256 `d51dc22168dcd4831726197b1cef252ea784cc9abbce4cf521465423638daf48`, accessed 2026-09-24.
- Annales de l'institut Fourier 55 (2005), no. 4, 1285-1371. Open-access PDF from Centre Mersenne; 89 PDF pages, printed pages 1285-1371 plus the journal's cover page. In French. PDF page = printed page minus 1284, after the cover.

- Introduction, printed pp. 1287-1291: the plan of the three parts, the table of the
  four quadrants of the Drinfeld-Deligne-Carayol conjecture with their authors, the
  statement of what the fundamental local representations should be, and the remark that
  the proof proceeds by a global route.
- Part I, Section 1, printed pp. 1291-1294: Definition 1.1 of a D-elliptic sheaf, the
  remark on the normalisation condition against Laumon-Rapoport-Stuhler's quotient
  formulation, and Section 1.3 on level structures.
- Part I, Sections 2 and 3, printed pp. 1297-1305: the coordinate-module functor and its
  anti-equivalence (Theorem 2.9), O-Dieudonne modules (Definitions 2.10, 2.11),
  Definition 3.1 of a special formal O_D-module and Theorem 3.4, the isogeny
  classification with End^0_D X = M_d(K).
- Sections 6 and 7, printed pp. 1311-1319: Theorem 6.1 on representability, smoothness
  and projectivity of the moduli, its proof sketch through the Vect and Hecke schemes,
  Theorem 6.4 on the projective extension over the place o, Definition 7.1 and Theorems
  7.2 and 7.4 on Drinfeld's representability by Omega-hat^d tensor-hat O-hat^nr, and
  Section 7.3 on the GL_d(K)- and D^times-actions.
- Part II, Section 8, printed pp. 1321-1326: Theorem 8.1, the uniformisation of the
  formal completion, with its remarks; Theorem 8.3, the rigid-analytic form with the
  Drinfeld coverings; and Definition 8.4 of an algebrisation, with the double-coset
  description.
- Part III, Section 9, printed pp. 1333-1338: Theorem 9.1 (Badulescu's Jacquet-Langlands
  in equal characteristic), Theorem 9.2 (Laumon-Rapoport-Stuhler's local Langlands
  correspondence with its four characterising properties and the Hecke normalisation),
  Definition 9.3 of the fundamental local representation with the admissibility notion,
  Proposition 9.4 with its caveat, Theorem 9.5, the main theorem, and Conjecture 9.6 of
  Carayol-Harris.
- Section 10, printed pp. 1338-1356: Section 10.1 on the cohomology of the moduli,
  Theorem 10.1 restating [LRS, 14.9 and 14.12], Lemmas 10.2 and 10.3 restating [LRS,
  15.10 and 15.11], Theorem 10.4 (Badulescu and Henniart), Proposition 10.5; Section
  10.2's construction of the Hochschild-Serre spectral sequence, Proposition 10.6,
  Corollary 10.7 and Remark 10.8 on the transpose-inverse convention; and Lemmas 10.9 to
  10.18 and Proposition 10.17, the degeneration of the cuspidal part.

### Two sources that could NOT be read

Both were located and downloaded in this session, and both are image scans with no
text layer; no optical character recognition was available. **Not one word of either
was read**, and nothing in this packet is attributed to them directly.

| Source | URL | SHA-256 |
| --- | --- | --- |
| Laumon–Rapoport–Stuhler, *D-elliptic sheaves and the Langlands correspondence*, Invent. Math. 113 (1993), 217–338 (124-page scan) | `https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf` | `05ea7ab8cb64577f5d421f37255a7cfd58b6fc763294038cd2e87475d80ab87e` |
| Christian Kaiser, erratum to the above (2-page scan), author-hosted | `https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf` | `6aa9e01d3551e3f0e3d8ca3d98acba98a1e163e723d342f9ccd719ae4dc02c54` |

Everything this packet attributes to Laumon–Rapoport–Stuhler comes through
**Hausberger's restatements**, which were read in full; every affected node says so in
its own sources.

## What this packet does not plan, and why

Material read here that belongs elsewhere is left to its owner (PROTOCOL.md §15). The
first three rows are planned in the companion parts of this roadmap, written in the
same session.

| Statement | Where | Owner |
| --- | --- | --- |
| FS VIII.4, IX.5, Chapter X | printed 290–350 | `ES0`–`ES4` (part ES0) |
| FS VIII.4.3, IX.4.1, IX.5.3, IX.6.1–IX.6.5 | printed 292–333 | `ES5`, `ES6` (part ES5) |
| FS IX.3, Theorem IX.3.1 | printed 324–326 | `HeckeStacksAndLocalShtukas:HS3` |
| The classical LLC and Jacquet–Langlands for `GL_n` over `Q_p` | — | `EndoscopicTransferAndUnitaryTraceComparison:ET.6` |
| The two-tower cohomological realisation over `Q_p` | — | `ET.6a` |
| The adeles, Haar measures and the automorphic spectrum of a function field | — | `FunctionFieldArithmetic:FA.2`, `FA.6`, `AdelicAlgebraicGroups:AA.0`, `AA.1` |
| Drinfeld's elliptic sheaves (the `D = M_d(F)` case) | Hausberger §1 | `DrinfeldModulesAndTModules:DM.7` |
| The Carayol–Harris conjecture on the non-supercuspidal cohomology | Hausberger 9.6 | conjectural; no layer plans it |

## ES7 — Bernstein-stratum normalisation and the classical GL_n comparison

*Coverage: **partial**. 1 node.*

The assembly: Fargues-Scholze state Theorem IX.7.4 for EVERY nonarchimedean local field,
and its proof rests on one external input - the cohomology of the Lubin-Tate and
Drinfeld towers - which has two different proofs according to the characteristic of E.
This layer records the split and routes each half to its child.

### Why FS IX.7.4 holds for every local field E, and what it rests on

`ExcursionOperatorsAndSpectralAction:ES7/agreement-for-every-local-field` — *comparison*

**Statement.**

Fargues-Scholze state Theorem IX.7.4 - that for GL_n the L-parameter constructed by the
excursion operators agrees with the usual semisimplified one - FOR EVERY nonarchimedean
local field E. The proof rests on ONE external input, the identification of the
cohomology of the Lubin-Tate and Drinfeld towers, and that input has TWO DIFFERENT
PROOFS according to the characteristic of E. For E of characteristic zero it is Harris,
Harris-Taylor, Henniart and Boyer, together with Scholze-Weinstein's description of the
relevant local Shimura varieties as those towers; that route is ES7:GLn-comparison's and
is imported from EndoscopicTransferAndUnitaryTraceComparison. For E = F_q((t)) it is the
Laumon-Rapoport-Stuhler construction of the local Langlands correspondence from the
moduli of D-elliptic sheaves, together with Hausberger's uniformisation and his proof of
the rigid-analytic Drinfeld-Carayol conjecture in equal characteristic; that route is
ES7:equal-characteristic's and rests in turn on ES7:function-field-automorphic. THE
EQUAL-CHARACTERISTIC EXTENSION IS SUBSTANTIAL AND IS NOT DELIVERED MERELY BECAUSE THE
SOURCE STATES ITS RESULT FOR ALL E.

**Hypotheses and warnings.**

- The two routes are genuinely different: the characteristic-zero one goes through
  p-divisible groups and Rapoport-Zink spaces, the equal-characteristic one through
  D-elliptic sheaves and formal O_D-modules. No argument read transports one to the
  other
- Hausberger's own table of the four quadrants of the Drinfeld-Deligne-Carayol
  conjecture makes the split explicit: rigid-analytic and vanishing-cycles sides, p-adic
  and equal-characteristic cases, with four different authors
- This layer is a parent whose atlas inputs are its three children; its mathematical
  content is the assembly and the bookkeeping of what each route imports
- Fargues-Scholze say in one sentence that this is the only place in the paper where
  previous work on local Langlands, or implicitly a global argument, is used; that
  sentence is the justification for treating both routes as imports rather than as
  content of this roadmap

**Proof outline.**

1. Record that IX.7.4 is stated for every E and that its proof has a single external
   input.
2. Record that the input has one proof in characteristic zero and a different one in
   equal characteristic.
3. Route the first to ES7:GLn-comparison and its imports, and the second to ES7:equal-
   characteristic and ES7:function-field-automorphic.
4. Record that the equal-characteristic route is a substantial development in its own
   right.

**Acceptance.**

- Check that the two routes are separate and that neither is deduced from the other
- Check that the source's claim to hold for all E is the assembly of the two
- Check that nothing in this roadmap reproves either route

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic`, `ExcursionOperatorsAndSpectralAction:ES5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS3`, `mathlib:Representation`

**Sources.**

- *Section IX.7.3, printed p. 338.* “This is the only place of this paper where we rely on previous work on the local Langlands correspondence, or (implicitly) rely on global arguments. More precisely, we use the identification of the cohomology of the Lubin-Tate and Drinfeld tower, see [Boy99], [Har97], [HT01], [Hau05], [Dat07].”
  The single external input and the references for it, one of which - Hausberger 2005
  - is the equal-characteristic route read in this session. Read directly from the
  hash-verified Geometrization PDF.
- *Introduction, printed p. 1290.* “Le tableau suivant resume les contributions a la preuve de la conjecture, sous ses quatre aspects: versant rigide-analytique / versant cycles-evanescents; corps p-adiques: Harris 1997 complete par Harris-Taylor, Harris-Taylor 1998; cas d'egale caracteristique p: Hausberger 2000, Boyer 1998.”
  The four quadrants, which make the split between the two routes explicit.

**What remains in this layer.**

- The characteristic-zero route is imported from
  EndoscopicTransferAndUnitaryTraceComparison:ET.6 and ET.6a and is not planned anywhere
  in this roadmap.
- The equal-characteristic route is planned here, from Hausberger, but rests on Laumon-
  Rapoport-Stuhler, which could not be read; see the gaps.
- This layer is a parent whose atlas inputs are its three children and which has no
  consumer at all; it carries one node.

## ES7:parabolic — Stratum maps and parabolic induction

*Coverage: **partial**. 8 nodes.*

FS Definition IX.7.1, Section IX.7.1's twisted Levi cocycle inclusion, and Theorem
IX.7.2 and Corollary IX.7.3 with their proofs IN FULL, broken into the coefficient
reduction, the basic case and quasisplit reduction, the increasingly unstable sequence
b_N, the constant-term computation and the parabolic-induction statement; together with
the dictionary to normalised induction, which the roadmap demands and the source does
not supply.

### FS IX.7.1: the maps Psi_G and Psi^b_G to the classical Bernstein centres

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps` — *construction* · planet **The stratum maps Psi_G and Psi^b_G**

**Statement.**

The map Psi_G : Z^spec(G,Lambda) -> Z(G(E),Lambda) is the composite Z^spec(G,Lambda) ->
Z^geom(G,Lambda) -> Z(G(E),Lambda) induced by the FULLY FAITHFUL functor j_! :
D(G(E),Lambda) = D_lis(Bun^1_G,Lambda) -> D_lis(Bun_G,Lambda). More generally, for any b
in B(G) there is a map Psi^b_G : Z^spec(G,Lambda) -> Z(G_b(E),Lambda) to the Bernstein
centre of G_b(E), using the fully faithful embedding D(G_b(E),Lambda) =
D_lis(Bun^b_G,Lambda) -> D_lis(Bun_G,Lambda) determined FOR EXAMPLE by the left adjoint
to i_b^*, where i_b is the locally closed embedding. When the hypothesis that the order
of pi_0 Z(G) be invertible in Lambda fails, the same diagrams are constructed with the
EXCURSION ALGEBRA in place of the spectral centre.

**Hypotheses and warnings.**

- In the D_lis setting there is NO GENERAL i_{b!}-functor, although it can be defined in
  the present situation, and ALL these maps induce the SAME map to the Bernstein centre.
  Independence of the choice is part of the construction, and Fargues-Scholze state it
  in a parenthesis without proof
- The first arrow Z^spec -> Z^geom is Theorem IX.5.2 and carries the hypothesis on pi_0
  Z(G); the second arrow Z^geom -> Z(G_b(E),Lambda) is the one ES0:classical-center owns
  and carries none
- The identification D(G_b(E),Lambda) = D_lis(Bun^b_G,Lambda) is
  VStackSheavesAndLisseCategories:VS4's and the left adjoint is FS Proposition
  VII.7.2's; both are imported
- The excursion-algebra variant is not written out by Fargues-Scholze; it has to be
  restated

**Proof outline.**

1. Compose the spectral-to-geometric map of ES1:spectral-center with the map induced by
   the fully faithful embedding of the stratum's category.
2. For general b take the left adjoint to i_b^*, available by Proposition VII.7.2, noting
   that a general lower-shriek is not.
3. Check that the different eligible embeddings induce the same map on centres.
4. Restate the construction with Exc(W,G-hat) in place of Z^spec when the coefficient
   hypothesis fails.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `PsiG` | data | Z^spec(G,Lambda) -> Z(G(E),Lambda) through Z^geom and the fully faithful j_!. |
| `PsiGb` | data | Z^spec(G,Lambda) -> Z(G_b(E),Lambda) through the embedding of the b-stratum's category. |
| `PsiGb.wellDefined` | structure | All eligible embeddings induce the same map on centres. |
| `noGeneralShriek` | structure | There is no general i_{b!} in the D_lis setting; it exists here, and the source says so. |
| `excursionVariant` | data | The same maps out of Exc(W,G-hat) when the order of pi_0 Z(G) is not invertible in Lambda. |
| `basepoint` | compatibility | At b = 1 the embedding is j_! and Psi^1_G = Psi_G. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation` — Theorem IX.7.2 is a statement about these maps
- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction` — the parabolic-induction square is deduced from it
- `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations` — the GL_n statement is read off Psi_{GL_n}

**Unit tests.**

- `basepoint_case` — At b = 1 the map is Psi_G; the general construction must restrict to it.
- `independence_of_embedding` — Two eligible embeddings give the same map; a construction depending on the choice is not well posed.
- `no_general_shriek` — Assuming a general i_{b!} in the lisse setting is exactly the error the source warns against.
- `excursion_variant_exists` — Without the coefficient hypothesis the diagrams still exist with Exc(W,G-hat) as source.

**Acceptance.**

- Check the basic case b = 1, where the embedding is j_!
- Check independence of the eligible embedding
- Check that no general i_{b!} is assumed
- Check that the excursion-algebra variant is restated and not quoted

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`, `ExcursionOperatorsAndSpectralAction:ES0`, `ExcursionOperatorsAndSpectralAction:ES5`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `VStackSheavesAndLisseCategories:VS4`, `VStackSheavesAndLisseCategories:VS3`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.3`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG3`, `mathlib:Representation`, `mathlib:CategoryTheory.Adjunction`, `tauceti:TauCeti.IsSmoothDiscrete`

**Sources.**

- *Definition IX.7.1, printed p. 334.* “The map Psi_G : Z^spec(G,Lambda) -> Z(G(E),Lambda) is the composite Z^spec(G,Lambda) -> Z^geom(G,Lambda) -> Z(G(E),Lambda) induced by the fully faithful functor j_! : D(G(E),Lambda) = D_lis(Bun^1_G,Lambda) -> D_lis(Bun_G,Lambda). More generally, for any b in B(G), we can define a map Psi^b_G : Z^spec(G,Lambda) -> Z(G_b(E),Lambda) to the Bernstein center for G_b(E).”
  The definition, quoted verbatim. Read directly from Geometrization.pdf in this
  session; its SHA-256 reproduces the value recorded in references/CATALOGUE.json.
- *Definition IX.7.1, printed p. 334.* “(Recall that in the D_lis-setting, we do not have a general i_{b!}-functor, although it can be defined in the present situation. All these maps will induce the same map to the Bernstein center.)”
  The caveat and the independence claim, which the roadmap requires be proved rather
  than assumed.
- *Proof of Theorem IX.7.2, printed p. 335.* “we can assume that Lambda is killed by a power of l (if l divides the order of pi_0 Z(G), replacing the left-hand side with an algebra of excursion operators)”
  The excursion-algebra variant in the form the source actually uses it.

### FS IX.7.1: the Levi inclusion of dual groups and its cyclotomic twist

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion` — *construction* · planet **The twisted Levi cocycle inclusion**

**Statement.**

G-hat_b is naturally a LEVI SUBGROUP of G-hat, because G_{b,E-breve} inside G_{E-breve}
is the centraliser of the slope morphism nu_b : D -> G_{E-breve}. This extends naturally
to a morphism of L-groups G-hat_b semidirect Q -> G-hat semidirect Q, where Q is a
finite quotient of W_E through which the action on G-hat factors. HOWEVER, from
geometric Satake one rather gets the natural inclusion G-hat_b semidirect W_E -> G-hat
semidirect W_E in which the W_E-ACTIONS INCLUDE THE CYCLOTOMIC TWIST. The latter induces
a map Z^1(W_E,G-hat_b) -> Z^1(W_E,G-hat) which, in terms of the usual W_E-action, sends
a 1-cocycle phi : W_E -> G-hat_b(A) to the 1-cocycle w -> (2rho_{G-hat} -
2rho_{G-hat_b})(sqrt q)^{|w|} phi(w), where |.| : W_E -> W_E/I_E = Z is normalised AS
USUAL BY SENDING A GEOMETRIC FROBENIUS TO 1.

**Hypotheses and warnings.**

- There are TWO maps of L-groups here and they differ: the one that comes from the Levi
  structure, and the one that comes from geometric Satake, whose W_E-actions include the
  cyclotomic twist. The formula converts between them, and the roadmap forbids silently
  using either for the other
- The normalisation of |.| is by GEOMETRIC Frobenius mapping to 1; the opposite
  convention changes the twist to its inverse
- (2rho_{G-hat} - 2rho_{G-hat_b}) is a cocharacter of the centre of G-hat_b, so
  evaluating it at sqrt q gives a central element and the formula does define a
  1-cocycle. The roadmap requires that COCYCLE PROPERTY be proved for the fixed pinned
  actions; Fargues-Scholze assert the formula and do not verify it
- sqrt q must be available in the coefficients, which is why every coefficient ring in
  this roadmap is a Z_l[sqrt q]-algebra
- That G_b is the centraliser of the slope morphism is Kottwitz's and is
  BunGAndNewtonStrata:BG0's

**Proof outline.**

1. Identify G-hat_b as a Levi of G-hat from the description of G_b as the centraliser of
   the slope morphism.
2. Write down the two morphisms of L-groups, the Levi one and the geometric-Satake one,
   and compare their W_E-actions.
3. Deduce the formula on cocycles, and check that the twisting factor is central so that
   the formula does produce a cocycle.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `leviInclusion` | data | G-hat_b semidirect Q -> G-hat semidirect Q from the Levi structure. |
| `satakeInclusion` | data | G-hat_b semidirect W_E -> G-hat semidirect W_E from geometric Satake, whose W_E-actions include the cyclotomic twist. |
| `cocycleMap` | data | Z^1(W_E,G-hat_b) -> Z^1(W_E,G-hat), phi -> (w -> (2rho_{G-hat} - 2rho_{G-hat_b})(sqrt q)^{\|w\|} phi(w)). |
| `cocycleMap.isCocycle` | structure | The twisting factor is central in G-hat_b, so the formula does define a 1-cocycle; the roadmap requires this be proved. |
| `degree` | data | \|.\| : W_E -> Z, normalised so that a GEOMETRIC Frobenius maps to 1. |
| `basicCase` | example | For b basic, G-hat_b = G-hat and the twist is trivial. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation` — Theorem IX.7.2's square is stated through this map
- `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction` — Corollary IX.7.3's composite is this map for a Levi
- `ExcursionOperatorsAndSpectralAction:ES6:duality` — the duality statements compare parameters through the same L-group maps

**Unit tests.**

- `twist_is_not_optional` — Dropping the (2rho - 2rho_b)(sqrt q)^{|w|} factor gives a different and wrong parameter.
- `geometric_frobenius_normalisation` — With arithmetic Frobenius mapping to 1 the twist inverts; the convention is part of the statement.
- `cocycle_property` — The formula produces a 1-cocycle, because the factor is central in G-hat_b.
- `basic_case_trivial` — For b basic the two inclusions agree and the twist disappears.

**Acceptance.**

- Check that the twist is by (2rho_{G-hat} - 2rho_{G-hat_b})(sqrt q) and not by rho or 2rho alone
- Check that |.| sends geometric Frobenius to 1
- Check the cocycle property for the fixed pinned actions
- Check the case b basic, where G-hat_b = G-hat and the twist is trivial

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `ReductiveGroupsPartII:RG2.5`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG3`, `LanglandsParameterStacks:LP0`, `mathlib:Representation`, `mathlib:RootPairing`, `mathlib:MonoidHom`, `mathlib:Subgroup`

**Sources.**

- *Section IX.7.1, printed p. 334.* “Note that G-hat_b is naturally a Levi subgroup of G-hat, as G_{b,E-breve} inside G_{E-breve} is the centralizer of the slope morphism nu_b : D -> G_{E-breve}. This extends naturally to a morphism of L-groups G-hat_b semidirect Q -> G-hat semidirect Q where as usual Q is a finite quotient of W_E over which the action on G-hat factors.”
  The Levi structure, quoted verbatim. Read directly from the hash-verified PDF in
  this session.
- *Section IX.7.1, printed p. 334.* “However, from geometric Satake we rather get the natural inclusion G_b-hat semidirect W_E -> G-hat semidirect W_E where the W_E-actions include the cyclotomic twist. The latter induces a map Z^1(W_E,G-hat_b) -> Z^1(W_E,G-hat) that in terms of the usual W_E-action is given by sending a 1-cocycle phi : W_E -> G-hat_b(A) to the 1-cocycle W_E -> G-hat(A) : w -> (2rho_{G-hat} - ...”
  The twisted inclusion, quoted verbatim with its normalisation. This is the formula
  the roadmap says must not be omitted. The excerpt is truncated at a word boundary;
  the full passage is on the printed page named in the locator.

### FS IX.7.2's proof: reduction to torsion coefficients, and why D_lis can be avoided

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction` — *lemma*

**Statement.**

To prove Theorem IX.7.2 one may assume that Lambda is KILLED BY A POWER OF l - and, if l
divides the order of pi_0 Z(G), replace the spectral centre by an algebra of excursion
operators - because the result for Lambda = Z_l[sqrt q] implies it in general and the
right-hand side Z(D(G_b(E),Lambda)) = lim over compact open K of Z(Lambda[K \ G_b(E) /
K]) is l-ADICALLY SEPARATED in that case. This reduction MEANS ONE CAN AVOID THE
SUBTLETIES OF D_lis IN PLACE OF D_et.

**Hypotheses and warnings.**

- l-adic separatedness is asserted for the limit over levels of the centres of the Hecke
  algebras; it is what licenses the reduction
- The replacement of the spectral centre by an excursion algebra is needed exactly when
  l divides the order of pi_0 Z(G)
- The point of the reduction is to work with D_et rather than D_lis; a formalisation
  that does not carry it must handle the lisse subtleties directly
- The description of Z(D(G_b(E),Lambda)) as a limit over levels is ES0:classical-
  center's

**Proof outline.**

1. Note that the statement for Lambda = Z_l[sqrt q] implies it for a general Lambda.
2. Note that for Lambda killed by a power of l the target is l-adically separated, so the
   statement may be checked on torsion coefficients.
3. If l divides the order of pi_0 Z(G), replace the source by an algebra of excursion
   operators.
4. Work with D_et instead of D_lis from that point on.

**Acceptance.**

- Check that the separatedness is what makes the reduction valid
- Check that the excursion-algebra replacement is needed exactly in the bad-prime case
- Check that the reduction is what allows D_et in place of D_lis

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`, `ExcursionOperatorsAndSpectralAction:ES0`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.3`, `VStackSheavesAndLisseCategories:VS3`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:MonoidAlgebra`, `mathlib:Module.End`, `mathlib:CommRing`

**Sources.**

- *Proof of Theorem IX.7.2, printed p. 335.* “We note that to prove the theorem, we can assume that Lambda is killed by a power of l (if l divides the order of pi_0 Z(G), replacing the left-hand side with an algebra of excursion operators), as the result for Lambda = Z_l[sqrt q] implies it in general, and the right-hand side Z(D(G_b(E),Lambda)) = lim over K of Z(Lambda[K \ G_b(E) / K]) is l-adically separated in that ...”
  The reduction, quoted verbatim. Read directly from the hash-verified PDF in this
  session. The excerpt is truncated at a word boundary; the full passage is on the
  printed page named in the locator.

### FS IX.7.2's proof: the basic case, and the reduction to a quasisplit group by a z-embedding

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction` — *lemma*

**Statement.**

If b is BASIC, Theorem IX.7.2 follows at once from the identification Bun_G = Bun_{G_b}
of Corollary III.4.3, WHICH IS EQUIVARIANT FOR THE HECKE ACTION. In general one first
reduces to G quasisplit: take a z-embedding G -> G' with quotient a torus D, so that
Z(G') is connected; then Bun_G = Bun_{G'} x_{Bun_D} {*} and B(G) -> B(G') is INJECTIVE -
which follows because for every b the map G'_{b'}(E) -> D(E) is surjective, since G_b ->
G'_{b'} is again a z-embedding with quotient D and Z'(E) -> D(E) is surjective. An
element of Z(D(G_b(E),Lambda)) is determined by its action on the restrictions to G_b(E)
of representations of G'_{b'}(E), so by Theorem IX.6.1 one reduces to G', that is to G
with CONNECTED CENTRE; and when Z(G) is connected there is a basic b_0 with G_{b_0}
QUASISPLIT, so the Hecke-equivariant isomorphism Bun_G = Bun_{G_{b_0}} lets one assume G
quasisplit.

**Hypotheses and warnings.**

- BASIC-INNER-FORM INVARIANCE IS THE BASIC CASE, NOT THE GENERAL CASE. The roadmap says
  so explicitly, and the general case is the long argument that follows
- The z-embedding apparatus - existence, the fibre-product description of Bun_G,
  injectivity of B(G) -> B(G'), surjectivity of Z'(E) -> D(E) - is ES6:functoriality's
  obligation by the roadmap's own instruction, and rests on Kaletha's Section 5 and Fact
  5.5, which were not read
- The step 'an element of the Bernstein centre is determined by its action on
  restrictions of representations of G'_{b'}(E)' uses Theorem IX.6.1, that is
  ES6:functoriality's isogeny compatibility
- That Z(G) connected gives a basic b_0 with G_{b_0} quasisplit is a statement about
  B(G) and inner forms and is BunGAndNewtonStrata's
- Corollary III.4.3, the identification Bun_G = Bun_{G_b} for basic b, is
  BunGAndNewtonStrata:BG3's; what matters here is that it is HECKE-EQUIVARIANT

**Proof outline.**

1. For b basic, apply the Hecke-equivariant identification Bun_G = Bun_{G_b} of Corollary
   III.4.3.
2. In general choose a z-embedding G -> G' with torus quotient D and connected Z(G'), and
   prove B(G) -> B(G') injective from the surjectivity of G'_{b'}(E) -> D(E).
3. Reduce to G' by Theorem IX.6.1, so that the centre is connected.
4. Choose a basic b_0 with G_{b_0} quasisplit and use Bun_G = Bun_{G_{b_0}} to assume G
   quasisplit.

**Acceptance.**

- Check that the basic case is immediate and that it is NOT the general case
- Check that the Hecke-equivariance of Corollary III.4.3 is what makes the basic case work
- Check the injectivity of B(G) -> B(G') and the surjectivity it rests on
- Check that a connected centre gives a basic b_0 with G_{b_0} quasisplit

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG2`, `BunGAndNewtonStrata:BG3`, `ReductiveGroupsPartII:RG2.5`, `SmoothRepresentationsOfLocalGroups:SR.0`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `mathlib:Representation`, `mathlib:Subgroup`, `mathlib:RootPairing`

**Sources.**

- *Proof of Theorem IX.7.2, printed p. 335.* “If b is basic, the theorem follows from the identification Bun_G = Bun_{G_b} of Corollary III.4.3, which is equivariant for the Hecke action.”
  The basic case, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Theorem IX.7.2, printed p. 335.* “In general, we first reduce to the case that G is quasisplit. Take a z-embedding G -> G' as in [Kal18, Section 5], with quotient a torus D, so that the center Z(G') is connected. Then Bun_G = Bun_{G'} x_{Bun_D} {*} and the map B(G) -> B(G') is injective. To see the latter, by the description of the stacks, it suffices to see that for all b in B(G) with image b' in B(G'), the ...”
  The z-embedding reduction, quoted verbatim. The excerpt is truncated at a word
  boundary; the full passage is on the printed page named in the locator.
- *Proof of Theorem IX.7.2, printed p. 335.* “An element of Z(D(G_b(E),Lambda)) = lim over K of Z([G_b(E) // K]) of the Bernstein center of G_b(E) is determined by its action on pi'|_{G_b(E)} for representations pi' of G'_{b'}(E). By Theorem IX.6.1, we can thus reduce to G' in place of G, i.e. that the center of G is connected. When Z(G) is connected, there is some basic b_0 in B(G) such that G_{b_0} is quasisplit. Using ...”
  The two further reductions, quoted verbatim. The excerpt is truncated at a word
  boundary; the full passage is on the printed page named in the locator.

### FS IX.7.2's proof: the increasingly unstable sequence b_N and its Hecke comparison

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence` — *lemma*

**Statement.**

Let G be quasisplit with a Borel B. Any b in B(G) admits a reduction to a CANONICAL
PARABOLIC P = P_b containing B. Pick a cocharacter mu : G_m -> G with dynamical
parabolic P. For N >= 0 set b_N = b mu(pi)^N. This is a sequence of elements of B(G)
attached to the SAME parabolic P but INCREASINGLY UNSTABLE, and G_b = G_{b_N} for every
N. The square relating Psi^b_G and Psi^{b_N}_G through the identifications
Z^spec(G,Lambda) = Z^spec(G,Lambda) and Z(G_b(E),Lambda) = Z(G_{b_N}(E),Lambda)
COMMUTES. To see this, take a representation rho of G_b(E), let A_N in
D_et(Bun_G,Lambda) be the sheaf concentrated on Bun^{b_N}_G corresponding to rho, and
let V be the highest weight representation of G-hat of weight N mu; then T_V(A_N)
restricted to Bun^b_G is given by rho, because there is PRECISELY ONE modification of
E_b of type bounded by N mu that is isomorphic to E_{b_N}, namely the pushout of the
standard modification of line bundles from O to O(1) along N mu, and its type is exactly
N mu. Since Hecke operators commute with excursion operators, the square commutes.

**Hypotheses and warnings.**

- The canonical parabolic is the HARDER-NARASIMHAN reduction of b; the pinned libraries
  have no Harder-Narasimhan theory at all, as AUDIT-20 records, and it is
  BunGAndNewtonStrata's
- G_b = G_{b_N} because b and b_N have the same Newton point up to the central twist by
  mu, so the sigma-centralisers agree; this is what makes the comparison a statement
  about the SAME group
- The uniqueness of the modification is the computational heart: exactly one
  modification of type bounded by N mu, of type exactly N mu
- The argument needs Hecke operators to commute with excursion operators, which is
  Theorem IX.5.2's second half and is ES1:spectral-center's

**Proof outline.**

1. Take the canonical parabolic P of b and a cocharacter mu with dynamical parabolic P,
   and set b_N = b mu(pi)^N.
2. Observe that all b_N have the same canonical parabolic and that G_b = G_{b_N}.
3. For a representation rho of G_b(E) build A_N concentrated on Bun^{b_N}_G and apply T_V
   for V of highest weight N mu.
4. Analyse the moduli of modifications of E_b of type bounded by N mu isomorphic to
   E_{b_N}: there is exactly one, given by pushout of the standard line-bundle
   modification along N mu.
5. Conclude that T_V(A_N)|_{Bun^b_G} = rho and, since Hecke and excursion operators
   commute, that the square commutes.

**Acceptance.**

- Check that G_b = G_{b_N}
- Check the uniqueness of the modification and that its type is exactly N mu
- Check that the b_N are increasingly unstable but share the canonical parabolic
- Check that the conclusion uses the commutation of Hecke and excursion operators

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`, `ExcursionOperatorsAndSpectralAction:ES0`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG3`, `BunGAndNewtonStrata:BG4`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:Representation`, `mathlib:RootPairing`

**Sources.**

- *Proof of Theorem IX.7.2, printed p. 335.* “Now if G is quasisplit, fix a Borel B inside G. Any b in B(G) then admits a reduction to a canonical parabolic P = P_b inside G containing B. Pick a cocharacter mu : G_m -> G with dynamical parabolic P. For any N >= 0, let b_N = b mu(pi)^N. This is a sequence of elements of B(G) associated to the same parabolic P but increasingly unstable. Moreover, G_b = G_{b_N}.”
  The construction of b_N, quoted verbatim. Read directly from the hash-verified PDF
  in this session.
- *Proof of Theorem IX.7.2, printed p. 335.* “For this, take any representation rho of G_b(E) and consider the sheaf A_N in D_et(Bun_G,Lambda) concentrated on Bun^{b_N}_G, corresponding to the representation rho. Let V in Rep G-hat be the highest weight representation with weight N mu. We claim that T_V(A_N)|_{Bun^b_G} is given by the representation rho. As Hecke operators commute with excursion operators, this implies the desired result.”
  The comparison and why it suffices.
- *Proof of Theorem IX.7.2, printed pp. 335-336.* “To compute T_V(A_N)|_{Bun^b_G}, we have to analyze the moduli space of modifications of E_b of type bounded by N mu that are isomorphic to E_{b_N}. There is in fact precisely one such modification, given by pushout of the standard modification of line bundles from O to O(1) via N mu; its type is exactly N mu. This gives the claim.”
  The computation, quoted verbatim.

### FS IX.7.2: the stratum map factors through Psi_{G_b}, by a constant-term computation

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation` — *theorem* · planet **Compatibility with the strata**

**Statement.**

For all G and all b in B(G), the triangle relating Psi^b_G : Z^spec(G,Lambda) ->
Z(D(G_b(E),Lambda)), the map Z^spec(G,Lambda) -> Z^spec(G_b,Lambda) given by the twisted
Levi cocycle inclusion, and Psi_{G_b} COMMUTES. The proof, after the reductions,
computes an arbitrary excursion operator: for excursion data (I,V,alpha,beta,(gamma_i))
pick N large enough that any modification of E_{b_N} to itself of type bounded by V is
AUTOMATICALLY COMPATIBLE WITH THE HARDER-NARASIMHAN REDUCTION TO P; then the moduli of
such modifications is the moduli of such modifications AS P-BUNDLES, which maps to the
corresponding moduli for the Levi M of P, where G_b = M_{b_M} for a basic b_M in B(M).
Writing A_N as R pi_! B_N for B_N in D_et(Bun_M,Lambda), the computation R pi_! R
h'_{2!}(h'^*_1 A'_N tensor S_V) = R h_{2!}(h^*_1 B_N tensor R g_! S_V) identifies R g_!
S_V with the CONSTANT TERM CT_P(S_V), which up to the shift [deg_P] agrees with the
restriction S_V|_{(M-hat semidirect Q)^I} - the restriction involving a CYCLOTOMIC
TWIST. The excursion operators, which involve maps from and to the sheaf corresponding
to V = 1, require only the connected component where deg_P = 0, so the shift can be
ignored.

**Hypotheses and warnings.**

- The excursion operators see only the DEGREE-ZERO component of the constant term, which
  is why the shift [deg_P] may be ignored; the roadmap requires that this be tracked
  rather than waved away
- The restriction of the Satake sheaf along M-hat -> G-hat involves the CYCLOTOMIC
  TWIST, and is the canonical restriction for the canonical W_E-actions arising
  geometrically; this is the same twist as in the Levi inclusion node
- N must be chosen LARGE ENOUGH DEPENDING ON THE EXCURSION DATUM, so that bounded self-
  modifications of E_{b_N} preserve the canonical parabolic
- R pi_! is defined on A'_N because on the support of A'_N the map pi : Bun_P -> Bun_M
  is cohomologically smooth, although pi is a stacky map; everything is concentrated on
  one stratum and the relevant categories are all equivalent to D(G_b(E),Lambda)
- The constant-term functor CT_P and its comparison with restriction along the dual Levi
  is GeometricSatakeAndFusion's

**Proof outline.**

1. Reduce to torsion coefficients, to the basic case and to G quasisplit.
2. Replace b by b_N for N large depending on the excursion datum, so that every
   modification of E_{b_N} of type bounded by V preserves the Harder-Narasimhan reduction
   to P.
3. Rewrite the Hecke computation on Bun_P, using that A_N comes from A'_N on Bun_P by the
   Harder-Narasimhan reduction.
4. Push down to Bun_M: R pi_! R h'_{2!}(h'^*_1 A'_N tensor S_V) = R h_{2!}(h^*_1 B_N
   tensor R g_! S_V), and identify R g_! S_V with the pullback of CT_P(S_V).
5. Identify CT_P(S_V) with S_V restricted along the dual Levi, up to the shift [deg_P]
   and with the cyclotomic twist, and note that only deg_P = 0 contributes.

**Acceptance.**

- Check that only the deg_P = 0 component contributes and why
- Check that the restriction along the dual Levi carries the cyclotomic twist
- Check that N depends on the excursion datum
- Check that R pi_! is defined on the relevant object because pi is cohomologically smooth on its support

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:parabolic/increasingly-unstable-sequence`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/basic-case-and-quasisplit-reduction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/coefficient-reduction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `ExcursionOperatorsAndSpectralAction:ES5`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG3`, `BunGAndNewtonStrata:BG4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS4`, `VStackSheavesAndLisseCategories:VS1`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:Representation`, `mathlib:RootPairing`, `mathlib:CategoryTheory.MonoidalCategory`

**Sources.**

- *Theorem IX.7.2, printed p. 335.* “For all G and b in B(G), the diagram Z^spec(G,Lambda) --Psi^b_G--> Z(D(G_b(E),Lambda)), Z^spec(G_b,Lambda) --Psi_{G_b}--> commutes.”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Theorem IX.7.2, printed p. 336.* “For any such excursion data, we can pick N large enough so that any modification of E_{b_N} to itself, of type bounded by V, is automatically compatible with the Harder-Narasimhan reduction to P. In that case, ... we have to analyze the moduli space of modifications of E_{b_N}, at I varying points, of type bounded by V, and that are isomorphic to E_{b_N}. By assumption on N, ...”
  Where N is chosen and why the computation becomes a computation with P-bundles. The
  excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.
- *Proof of Theorem IX.7.2, printed pp. 336-337.* “We compute: R pi_! R h'_{2!}(h'^*_1 A'_N tensor S_V) = R pi_! R h'_{2!} R H_!(h''^*_1 B_N tensor S_V) = R h_{2!}(h^*_1 B_N tensor R g_! S_V) where g : Hck^I_{M,P} -> Hck^I_M is the projection. ... This means that R g_! S_V arises via pullback from CT_P(S_V) in D_et(Hck^I_M,Lambda).”
  The constant-term identification, quoted verbatim.
- *Proof of Theorem IX.7.2, printed p. 337.* “Up to the shift [deg_P], this agrees with S_V|_{(M-hat semidirect Q)^I}, where the restriction involves a cyclotomic twist, as above. (It is the canonical restriction along M-hat^V -> G-hat^V for the canonical W_E-actions arising geometrically.) Now the excursion operators, which involve maps from and to the sheaf corresponding to V = 1, require only the connected component ...”
  The cyclotomic twist and the degree-zero remark, quoted verbatim - both of which the
  roadmap insists be tracked. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.

### FS IX.7.3: compatibility with UNNORMALISED parabolic induction

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction` — *theorem* · planet **Compatibility with parabolic induction**

**Statement.**

Let G be a reductive group with a parabolic P inside G and Levi P -> M. Then for all
representations pi of M(E) with UNNORMALISED parabolic induction Ind^{G(E)}_{P(E)} pi,
the square relating Z^spec(G,Lambda) -> End(Ind^{G(E)}_{P(E)} pi) and Z^spec(M,Lambda)
-> End(pi) commutes. In particular the formation of L-parameters is COMPATIBLE WITH
PARABOLIC INDUCTION: if Lambda = L is an algebraically closed field, pi is irreducible
and pi-tilde is an irreducible subquotient of Ind^{G(E)}_{P(E)} pi, then phi_{pi-tilde}
is conjugate to the composite W_E -> M-hat(L) semidirect W_E -> G-hat(L) semidirect W_E,
where the second map is the TWISTED LEVI INCLUSION, involving the cyclotomic twist.

**Hypotheses and warnings.**

- The induction is UNNORMALISED; the roadmap forbids silently calling the source's
  formula normalised induction
- The conclusion is for EVERY irreducible SUBQUOTIENT of the induction, not only for
  irreducible constituents of the socle or cosocle
- The proof reduces to pi = c-Ind^{M(E)}_K rho for K an open PRO-p subgroup of M(E),
  then to Lambda = Z_l[sqrt q], then by l-adic separatedness to torsion coefficients
- The concrete input is the computation T_mu(A)|_{Bun^1_G} = Ind^{G(E)}_{P(E)} pi
  (d/2)[d] with d = <2rho,mu>, where the moduli of modifications of the trivial G-torsor
  of type bounded by mu that are isomorphic to E_b is G(E)/P(E), all of them of type
  exactly mu, so the Satake sheaf is the twist (d/2)[d] of the constant sheaf
- The source adds a footnote pointing to Gross-Iancu Theorem 4.26 for the analysis of
  Hodge-Newton reducible local Shimura varieties; that reference was not read

**Proof outline.**

1. Reduce to pi = c-Ind^{M(E)}_K rho for K open pro-p, then to torsion coefficients.
2. Take mu with dynamical parabolic P and b = mu(pi) in B(G), so that G_b = M, and build
   A concentrated on Bun^b_G from pi.
3. Compute T_mu(A)|_{Bun^1_G}: the moduli of modifications of the trivial torsor of type
   bounded by mu isomorphic to E_b is G(E)/P(E), all of type exactly mu, so the answer is
   Ind^{G(E)}_{P(E)} pi (d/2)[d] with d = <2rho,mu>.
4. Since Hecke operators commute with excursion operators, the excursion operators on the
   induction agree with those on A, and those are determined by Theorem IX.7.2.

**Acceptance.**

- Check that the induction is unnormalised
- Check the twist (d/2)[d] with d = <2rho,mu> and that it comes from all modifications having type exactly mu
- Check that the statement covers every irreducible subquotient
- Check that the cyclotomic twist appears in the composite

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:parabolic/constant-term-computation`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `ExcursionOperatorsAndSpectralAction:ES5`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG3`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS4`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:Representation`, `mathlib:RootPairing`

**Sources.**

- *Corollary IX.7.3, printed p. 337.* “Let G be a reductive group with a parabolic P inside G and Levi P -> M. Then for all representations pi of M(E) with (unnormalized) parabolic induction Ind^{G(E)}_{P(E)} pi, the diagram Z^spec(G,Lambda) -> End(Ind^{G(E)}_{P(E)} pi), Z^spec(M,Lambda) -> End(pi) commutes.”
  The statement, quoted verbatim with the word 'unnormalized'. Read directly from the
  hash-verified PDF in this session.
- *Corollary IX.7.3, printed p. 337.* “In particular, the formation of L-parameters is compatible with parabolic induction: If Lambda = L is an algebraically closed field, pi is irreducible and pi-tilde is an irreducible subquotient of Ind^{G(E)}_{P(E)} pi, then phi_{pi-tilde} is conjugate to the composite W_E --phi_pi--> M-hat(L) semidirect W_E -> G-hat(L) semidirect W_E where the map M-hat semidirect W_E -> G-hat ...”
  The parameter statement, quoted verbatim. The excerpt is truncated at a word
  boundary; the full passage is on the printed page named in the locator.
- *Proof of Corollary IX.7.3, printed p. 337.* “It suffices to prove the result for pi = c-Ind^{M(E)}_K rho for K inside M(E) an open pro-p-subgroup, and then one can assume Lambda = Z_l[sqrt q], where one can further by l-adic separatedness reduce to torsion coefficients. Let mu : G_m -> G be a cocharacter with dynamical parabolic P and let b = mu(pi) in B(G). Then G_b = M, and we can build a sheaf A in D_et(Bun_G,Lambda) ...”
  The reduction, quoted verbatim. The excerpt is truncated at a word boundary; the
  full passage is on the printed page named in the locator.
- *Proof of Corollary IX.7.3, printed pp. 337-338.* “Then T_mu(A)|_{Bun^1_G} is given by a parabolic induction of pi, more precisely Ind^{G(E)}_{P(E)} pi (d/2)[d] where d = <2rho,mu>. To see this, we have to understand the moduli space of modifications of the trivial G-torsor of type bounded by mu that are isomorphic to E_b. This is in fact given by G(E)/P(E), the G(E)-orbit of the pushout of the modification from O to O(1) via ...”
  The computation that produces the induction and the twist. The excerpt is truncated
  at a word boundary; the full passage is on the printed page named in the locator.

### The dictionary with normalised induction: the modulus and the cyclotomic twist must cancel

`ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary` — *comparison*

**Statement.**

Fargues-Scholze's Corollary IX.7.3 is stated for UNNORMALISED parabolic induction, and
the twist it produces is the explicit (d/2)[d] with d = <2rho,mu> coming from the type
of the modification. The local-group owner's convention is NORMALISED induction, in
which one twists by the square root delta_P^{1/2} of the modulus character of P(E). The
roadmap makes it an obligation of this layer to prove the dictionary between the two,
and to show that the SQUARE-ROOT MODULUS AND THE CYCLOTOMIC TWIST CANCEL IN PRECISELY
THE STATED CONVENTION. Nothing in Fargues-Scholze states that cancellation: the twist
appears once in the Levi inclusion, as (2rho_{G-hat} - 2rho_{M-hat})(sqrt q)^{|w|}, and
once in the computation, as (d/2)[d] with d = <2rho,mu>, and the source leaves the
reader to match them.

**Hypotheses and warnings.**

- This is an OBLIGATION, not a theorem of the source. Nothing read states the
  cancellation; the packet records the two places the twist appears and does not
  manufacture a locator
- At the pins Mathlib has the modular character of a locally compact group -
  modularCharacter, with map_right_mul_eq_modularCharacterFun_smul - so delta of a group
  is available in general; AUDIT-20 records that there is NO modulus character delta_P
  of a parabolic, no normalised smooth induction, and hence no dictionary to state yet
- Tau Ceti has the dynamic parabolic subgroups P(lambda)(A) of an affine group scheme on
  points, with Levi decomposition, which is the group-theoretic half
- The roadmap is explicit: do not silently call the source formula normalised induction,
  and do not omit the twist
- The comparison must be made for the FIXED geometric-Frobenius normalisation of the
  degree map, since the twist is (sqrt q)^{|w|}

**Proof outline.**

1. Record the unnormalised statement and the explicit twist (d/2)[d] with d = <2rho,mu>
   that the source's computation produces.
2. Record the twisted Levi inclusion's factor (2rho_{G-hat} - 2rho_{M-hat})(sqrt
   q)^{|w|}.
3. Define normalised induction with delta_P^{1/2} against the local-group owner's
   conventions, using the pinned modular character for the ambient notion.
4. Prove that the two twists cancel, so that the parameter of a subquotient of the
   normalised induction is the untwisted composite.

**Acceptance.**

- Check that the source statement is unnormalised
- Check that the two twists are the ones named and that no third twist is introduced
- Check the cancellation in the fixed convention, with geometric Frobenius mapping to 1
- Check against the pinned modularCharacter that delta_P is the modulus of P(E) and not of G(E)

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/twisted-levi-inclusion`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.0`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Representation`, `mathlib:MeasureTheory.Measure.modularCharacter`, `mathlib:RootPairing`, `tauceti:TauCeti.Cocharacter.parabolic`, `tauceti:TauCeti.Cocharacter.levi`

**Sources.**

- *Corollary IX.7.3, printed p. 337.* “for all representations pi of M(E) with (unnormalized) parabolic induction Ind^{G(E)}_{P(E)} pi”
  That the source's induction is unnormalised. Read directly from the hash-verified
  PDF in this session.
- *Proof of Corollary IX.7.3, printed pp. 337-338.* “more precisely Ind^{G(E)}_{P(E)} pi (d/2)[d] where d = <2rho,mu>”
  The explicit twist the computation produces, which is the half the dictionary must
  match against delta_P^{1/2}.
- *Section IX.7.1, printed p. 334.* “w -> (2rho_{G-hat} - 2rho_{G-hat_b})(sqrt q)^{|w|} phi(w)”
  The other half: the cyclotomic twist in the Levi inclusion. Fargues-Scholze nowhere
  state that these two cancel; that statement is this layer's obligation and has no
  locator.

**What remains in this layer.**

- The cancellation of the square-root modulus against the cyclotomic twist is NOT a
  statement of the source. Fargues-Scholze give the twist in two places - the Levi
  inclusion's (2rho_{G-hat} - 2rho_{G-hat_b})(sqrt q)^{|w|} and the computation's
  (d/2)[d] with d = <2rho,mu> - and leave the reader to match them. The dictionary is an
  obligation with no locator, and the packet says so.
- The z-embedding apparatus the quasisplit reduction uses is quoted from Kaletha's
  Section 5 and Fact 5.5, which were not read; the roadmap makes those lemmas an
  obligation of ES6:functoriality, where they are planned in the companion part of this
  roadmap.
- The constant-term functor CT_P and its comparison with restriction along the dual Levi
  is quoted and belongs to GeometricSatakeAndFusion; it was not read.
- The Harder-Narasimhan canonical parabolic, on which the sequence b_N rests, is
  BunGAndNewtonStrata's and AUDIT-20 records it as absent from both libraries.
- The footnote pointing to Gross-Iancu Theorem 4.26 for Hodge-Newton reducible local
  Shimura varieties was not followed.

## ES7:GLn-comparison — Proved characteristic-zero agreement

*Coverage: **partial**. 4 nodes.*

FS Theorem IX.7.4 with its proof in full: the identification of the two minuscule Hecke
operators with the Lubin-Tate and Drinfeld towers, the two-leg trace computation with
its normalisation by the identity Weil tuple, the supercuspidal agreement and its
transport to pi through a summand of T_std(B), the extension to all irreducible smooth
representations by parabolic induction, and the integral refinement recovering Helm-
Moss.

### FS IX.7.4's proof: the two minuscule Hecke operators are the Lubin-Tate and Drinfeld towers

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation` — *theorem* · planet **The two-tower realisation**

**Statement.**

Let G = GL_n over E, let pi be an irreducible smooth Q-bar_l-representation of GL_n(E),
supercuspidal, let D be the division algebra of invariant 1/n and rho = JL(pi) the
corresponding representation of D^times. Let b in B(GL_n) correspond to the bundle
O(-1/n) and let B be the sheaf on Bun^b_{GL_n} given by rho. Take the excursion datum
with I of size two, V = std tensor std-dual of the square of the dual group, and the
unit and counit. Then T_V is the COMPOSITE OF TWO HECKE OPERATORS. The first,
corresponding to std, takes MINUSCULE modifications O(-1/n) -> E with cokernel a
skyscraper sheaf of rank one; such an E is necessarily isomorphic to O^n, and the
operator produces the RHO-ISOTYPIC PART OF THE COHOMOLOGY OF THE LUBIN-TATE TOWER, which
is pi tensor sigma, where sigma is the irreducible n-dimensional W_E-representation
attached to pi by the classical local Langlands correspondence. The second, restricted
to Bun^b_{GL_n}, produces the PI-ISOTYPIC COMPONENT OF THE COHOMOLOGY OF THE DRINFELD
TOWER, which is rho tensor sigma-dual. In total T_V(B)|_{Bun^b_{GL_n}} is rho tensor
sigma tensor sigma-dual as a representation of D^times x W_E x W_E.

**Hypotheses and warnings.**

- The shift [n-1] and the cyclotomic twist ((n-1)/2) that usually appear are HIDDEN
  INSIDE THE NORMALISATION OF THE PERVERSE SHEAF corresponding to the standard
  representation; the source says so explicitly, and a formalisation that re-introduces
  them double-counts
- This is THE ONLY PLACE IN FARGUES-SCHOLZE where previous work on the local Langlands
  correspondence is used, or where global arguments are used implicitly. The
  identification of the cohomology of the Lubin-Tate and Drinfeld towers is quoted from
  Boyer, Harris, Harris-Taylor, Hausberger and Dat
- The translation between Hecke operators and local Shimura varieties is Section IX.3's
  and is HeckeStacksAndLocalShtukas:HS3's; the description of those as the Lubin-Tate
  and Drinfeld towers in these special cases is quoted from Scholze-Weinstein
- The whole statement is over Q-bar_l and for E a p-adic field; the equal-characteristic
  case is ES7:equal-characteristic's
- pi is SUPERCUSPIDAL here; the extension to all irreducibles is the last node of this
  layer

**Proof outline.**

1. Translate the two minuscule Hecke operators into the cohomology of local Shimura
   varieties, as in Section IX.3.
2. Identify those local Shimura varieties with the Lubin-Tate and Drinfeld towers.
3. Quote the known computation of the pi- and rho-isotypic parts of their cohomology.
4. Compose to get T_V(B)|_{Bun^b_{GL_n}} = rho tensor sigma tensor sigma-dual.

**Acceptance.**

- Check that the shift and the half Tate twist are inside the perverse normalisation and are not added again
- Check that the first operator lands on O^n and the second returns to Bun^b
- Check that the two tower computations are imported, not proved
- Check that this is the only external input in the whole of Fargues-Scholze

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES5`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS3`, `HeckeStacksAndLocalShtukas:HS4`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `VStackSheavesAndLisseCategories:VS4`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `BunGAndNewtonStrata:BG3`, `SmoothRepresentationsOfLocalGroups:SR.0`, `mathlib:Representation`, `mathlib:LinearMap.trace`

**Sources.**

- *Section IX.7.3, printed p. 338.* “For the group G = GL_n, we can identify the L-parameters with the usual L-parameters of [LRS93], [HT01], [Hen00]. This is the only place of this paper where we rely on previous work on the local Langlands correspondence, or (implicitly) rely on global arguments. More precisely, we use the identification of the cohomology of the Lubin-Tate and Drinfeld tower, see [Boy99], ...”
  What is imported, and the source's own statement that this is the only such place.
  Read directly from the hash-verified PDF in this session. The excerpt is truncated
  at a word boundary; the full passage is on the printed page named in the locator.
- *Proof of Theorem IX.7.4, printed p. 338.* “First, we analyze these excursion operators on the sheaf B which is the sheaf on Bun^b_{GL_n} for b corresponding to the bundle O(-1/n), given by the representation rho = JL(pi) of D^times; here D is the division algebra of invariant 1/n. The Hecke operator T_V is the composite of two operators. The first Hecke operator, corresponding to std, takes minuscule modifications ...”
  The first operator, quoted verbatim. The excerpt is truncated at a word boundary;
  the full passage is on the printed page named in the locator.
- *Proof of Theorem IX.7.4, printed p. 338.* “(Note that the shift [n-1], as well as the cyclotomic twist ((n-1)/2) that usually appears, is hidden inside the normalization of the perverse sheaf corresponding to the standard representation.) Now the second Hecke operator, when restricted to Bun^b_{GL_n}, produces the pi-isotypic component of the cohomology of the Drinfeld tower, which is rho tensor sigma-dual. In total, ...”
  The normalisation remark and the second operator, quoted verbatim. The excerpt is
  truncated at a word boundary; the full passage is on the printed page named in the
  locator.

### FS IX.7.4's proof: the two-leg excursion operator computes the trace of sigma

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace` — *theorem* · planet **The two-leg trace computation**

**Statement.**

Only the excursion data with I of size two, V = std tensor std-dual of the square of the
dual group of GL_n, and the unit and counit maps alpha : 1 -> std tensor std-dual and
beta : std tensor std-dual -> 1 need be evaluated, BECAUSE THESE EXCURSION OPERATORS
DETERMINE THE TRACE OF THE REPRESENTATION, and hence its semisimplification. On the
object B, by IRREDUCIBILITY of sigma the W_E-equivariant map sigma tensor sigma-dual ->
sigma tensor sigma-dual induced by alpha, and the similar map backwards induced by beta,
must AGREE UP TO SCALAR with the obvious map; and the scalar of the total composite is
identified BY TAKING BOTH ELEMENTS OF W_E TO BE EQUAL TO 1.

**Hypotheses and warnings.**

- That two-leg data with std tensor std-dual determine the trace, and hence the
  semisimplification, is the only thing needed; this is the same datum that computes the
  torus case of Proposition IX.6.5 and it is worth planning once
- The identification of the scalar by setting both Weil elements to 1 is the whole
  normalisation argument; without it the computation determines sigma only up to a
  scalar
- Irreducibility of sigma is used, and it comes from the classical correspondence for
  supercuspidal pi, which is imported
- Semisimple trace determination for continuous Weil-group representations is NOT in the
  pinned libraries: AUDIT-20 records that the pinned statements cover finite groups in
  characteristic zero only, Tau Ceti's Representation.nonempty_equiv_of_character_eq
  being the closest

**Proof outline.**

1. Evaluate the two-leg excursion operator on B using the two-tower computation.
2. Use irreducibility of sigma to see that the maps induced by alpha and beta agree up to
   scalar with the obvious ones.
3. Fix the scalar by taking both Weil elements equal to 1.
4. Conclude that the excursion operator computes the trace of sigma, hence determines its
   semisimplification.

**Acceptance.**

- Check that two-leg data with std tensor std-dual determine the trace
- Check that the scalar is fixed by the identity Weil tuple
- Check that irreducibility of sigma is used and where it comes from
- Check that semisimple trace determination for Weil-group representations is not available at the pins

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`, `ExcursionOperatorsAndSpectralAction:ES5`, `ExcursionOperatorsAndSpectralAction:ES0`, `LanglandsParameterStacks:LP2:semisimple-characters`, `LanglandsParameterStacks:LP2:excursion-presentation`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `HeckeStacksAndLocalShtukas:HS3`, `HeckeStacksAndLocalShtukas:HS4`, `mathlib:Representation`, `mathlib:LinearMap.trace`, `tauceti:Representation.nonempty_equiv_of_character_eq`

**Sources.**

- *Proof of Theorem IX.7.4, printed p. 338.* “We only need to evaluate the excursion operators for the excursion data given by I = {1,2}, the representation V = std tensor std-dual of the square of the dual group of GL_n, and the unit/counit maps alpha : 1 -> std tensor std-dual and beta : std tensor std-dual -> 1, as these excursion operators determine the trace of the representation (and thus the semisimplified representation).”
  Why this one datum suffices, quoted verbatim. Read directly from the hash-verified
  PDF in this session.
- *Proof of Theorem IX.7.4, printed p. 338.* “By irreducibility of sigma, the W_E-equivariant map sigma tensor sigma-dual -> sigma tensor sigma-dual induced by alpha (and the similar map backwards induced by beta) must agree up to scalar with the obvious map. The scalar of the total composite can be identified by taking both elements of W_E to be equal to 1. This shows that B has the correct L-parameter.”
  The normalisation argument, quoted verbatim.

### FS IX.7.4: for supercuspidal pi the parameter is the classical one, first on B and then on pi

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement` — *theorem* · planet **Agreement for supercuspidals**

**Statement.**

For pi an irreducible SUPERCUSPIDAL smooth Q-bar_l-representation of GL_n(E), the two-
leg computation shows that the sheaf B on Bun^b_{GL_n} attached to rho = JL(pi) HAS THE
CORRECT L-PARAMETER, that is phi_B = sigma^ss where sigma is the parameter the classical
local Langlands correspondence attaches to pi. One then uses that THE SHEAF
CORRESPONDING TO PI APPEARS AS A SUMMAND OF T_std(B) - after forgetting the W_E-action -
to conclude the same for pi itself: phi_pi = sigma^ss.

**Hypotheses and warnings.**

- The argument proves the statement first for the DIVISION-ALGEBRA side, on the stratum
  b = O(-1/n), and only then transports it to pi on the basic stratum; the transport is
  by a summand of a single Hecke operator
- The transport forgets the W_E-action, which is legitimate because the parameter is
  determined by the excursion operators and those commute with the Hecke operators
- Only the SEMISIMPLIFICATION is obtained: this construction does not recover the
  monodromy operator N of a Weil-Deligne parameter, and the roadmap says so
- pi must be supercuspidal here; the general case is the next node
- Jacquet-Langlands for GL_n over a p-adic field is imported from
  EndoscopicTransferAndUnitaryTraceComparison:ET.6

**Proof outline.**

1. Evaluate the two-leg excursion operator on B and match it with the trace of sigma.
2. Conclude phi_B = sigma^ss by the uniqueness of the semisimple parameter of ES5.
3. Observe that the sheaf corresponding to pi is a summand of T_std(B) after forgetting
   the W_E-action, and conclude phi_pi = sigma^ss.

**Acceptance.**

- Check that the argument runs first on the division-algebra side
- Check that only the semisimplification is obtained and that N is not recovered
- Check that the transport uses a summand of T_std(B)
- Check that the conclusion uses ES5's uniqueness

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-leg-excursion-is-a-trace`, `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/two-tower-realisation`, `ExcursionOperatorsAndSpectralAction:ES5`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6a`, `HeckeStacksAndLocalShtukas:HS3`, `HeckeStacksAndLocalShtukas:HS2`, `VStackSheavesAndLisseCategories:VS4`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG3`, `SmoothRepresentationsOfLocalGroups:SR.0`, `mathlib:Representation`

**Sources.**

- *Proof of Theorem IX.7.4, printed p. 338.* “This shows that B has the correct L-parameter. Now use that the sheaf corresponding to pi appears as a summand of T_std(B) (after forgetting the W_E-action) to conclude the same for pi.”
  The transport from the division-algebra side to pi, quoted verbatim. Read directly
  from the hash-verified PDF in this session.

### FS IX.7.4: agreement for every irreducible smooth representation of GL_n(E), and the integral refinement

`ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/all-irreducible-representations` — *theorem* · planet **Agreement with classical local Langlands for GL_n**

**Statement.**

Let pi be ANY irreducible smooth Q-bar_l-representation of GL_n(E). Then the L-parameter
phi_pi agrees with the usual (SEMISIMPLIFIED) L-parameter. By Corollary IX.7.3 one may
assume pi supercuspidal, and the supercuspidal case is the previous node. It follows
that the map Z^spec(GL_n, Q-bar_l) -> Z(GL_n(E), Q-bar_l) to the Bernstein centre AGREES
WITH THE USUAL MAP; and this REFINES to a map Z^spec(GL_n, Z_l[sqrt q]) -> Z(GL_n(E),
Z_l[sqrt q]) to the INTEGRAL Bernstein centre, RECOVERING A RESULT OF HELM-MOSS.

**Hypotheses and warnings.**

- The reduction to the supercuspidal case is by Corollary IX.7.3, that is by the
  compatibility with parabolic induction of ES7:parabolic, together with the classical
  classification of irreducible smooth representations of GL_n(E) as subquotients of
  inductions from supercuspidals - the segment classification, which is
  SmoothRepresentationsOfLocalGroups' and is not proved in anything read
- Only the SEMISIMPLIFIED parameter is obtained. The construction does not recover the
  monodromy operator N, and no integral or mod-l agreement with a stronger
  correspondence is asserted
- The integral refinement is stated in one sentence and recovers Helm-Moss; Helm-Moss
  itself was not read
- The statement is over Q-bar_l and for E a p-adic field, since it rests on the two-
  tower realisation; the equal-characteristic case has its own realisation and is
  ES7:equal-characteristic's

**Proof outline.**

1. By Corollary IX.7.3 and the classification of irreducible smooth representations by
   segments, reduce to pi supercuspidal.
2. Apply the supercuspidal agreement.
3. Deduce that the induced map on Bernstein centres agrees with the usual one, and
   observe that it refines integrally.

**Acceptance.**

- Check that the reduction is by parabolic induction plus the segment classification
- Check that only the semisimplification is obtained and that N is not recovered
- Check the integral refinement and that it recovers Helm-Moss
- Check that the statement is for p-adic E only, at this stage

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:GLn-comparison/supercuspidal-agreement`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `ExcursionOperatorsAndSpectralAction:ES5`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `VStackSheavesAndLisseCategories:VS4`, `mathlib:Representation`, `mathlib:MonoidAlgebra`

**Sources.**

- *Theorem IX.7.4, printed p. 338.* “Let pi be any irreducible smooth Q-bar_l-representation of GL_n(E). Then the L-parameter phi_pi agrees with the usual (semisimplified) L-parameter.”
  The statement, quoted verbatim. Read directly from the hash-verified PDF in this
  session.
- *Proof of Theorem IX.7.4, printed p. 338.* “By Corollary IX.7.3, we can assume that pi is supercuspidal.”
  The reduction, quoted verbatim.
- *Proof of Theorem IX.7.4, printed p. 338.* “In particular, it follows that the map Z^spec(GL_n, Q-bar_l) -> Z(GL_n(E), Q-bar_l) to the Bernstein center agrees with the usual map. But this refines to a map Z^spec(GL_n, Z_l[sqrt q]) -> Z(GL_n(E), Z_l[sqrt q]) to the integral Bernstein center, recovering a result of Helm-Moss [HM18].”
  The consequence for the Bernstein centres and the integral refinement, quoted
  verbatim.

**What remains in this layer.**

- The classical local Langlands correspondence and Jacquet-Langlands for GL_n over a
  p-adic field are IMPORTED from EndoscopicTransferAndUnitaryTraceComparison:ET.6, and
  the two-tower cohomological realisation from ET.6a. AUDIT-20 records both as
  duplicates of this layer and neither exists in either pinned library.
- The segment classification of irreducible smooth representations of GL_n(E), by which
  the general case reduces to the supercuspidal one, is
  SmoothRepresentationsOfLocalGroups' and is not proved in anything read.
- Semisimple trace determination for continuous Weil-group representations does not
  exist at the pins; AUDIT-20 records that the available statements cover finite groups
  in characteristic zero only.
- Only the SEMISIMPLIFIED parameter is obtained: the monodromy operator N is not
  recovered, and no integral or mod-l agreement with a stronger correspondence is
  asserted. The roadmap says so and this packet repeats it.
- Helm-Moss, which the integral refinement recovers, was not read.

## ES7:equal-characteristic — Separate realisation for E = F_q((t))

*Coverage: **partial**. 7 nodes.*

The equal-characteristic realisation, planned from Hausberger 2005, read in full in this
session: Laumon-Rapoport-Stuhler's D-elliptic sheaves and their level structures; the
moduli scheme with its smoothness, its projectivity in the division-algebra case, its
extension over the place o and its Hecke correspondences; special formal O_D-modules and
Drinfeld's representability theorem; the uniformisation theorem in both its formal and
its rigid-analytic forms; the fundamental local representation with its three commuting
actions; the Hochschild-Serre spectral sequence and the degeneration of its cuspidal
part; and the main theorem, the rigid-analytic Drinfeld-Carayol conjecture in equal
characteristic.

### Laumon-Rapoport-Stuhler's D-elliptic sheaves, and their level structures

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf` — *definition* · planet **D-elliptic sheaves**

**Statement.**

Let X be a smooth, projective, geometrically connected curve over F_q, F = F_q(X), and D
a central simple F-algebra of dimension d^2 together with a coherent locally free sheaf
of O_X-algebras with generic fibre D whose stalk at every closed point x is a maximal
order of D_x = D tensor_F F_x; let R be the set of bad places, where D_x is not split.
Fix a place infinity, rational over F_q. For an F_q-scheme S, a D-ELLIPTIC SHEAF of pole
infinity and zero z on S is a commutative diagram of O_X x S-modules E_i, i in Z, each
locally free of rank d^2 with a right D-action compatible with the O_X-action, with
injections j : E_i -> E_{i+1} and t : (Frobenius pullback of E_i) -> E_i, D-compatible
and O_X x S-linear, satisfying: (i) PERIODICITY, E_{i+d} = E_i(infinity x S), the
composite of d consecutive j's being the natural injection; (ii) POLE, E_i / j(E_{i-1})
is the direct image under the section infinity of a locally free O_S-module A_i of rank
d; (iii) ZERO, E_i / t(Frobenius pullback of E_{i-1}) is the direct image under a
section Gamma_z of a locally free O_S-module B_i of rank d, for a morphism z : S -> X -
{infinity} - R; (iv) NORMALISATION, the Euler-Poincare characteristic of E_0 restricted
to X x s lies in [0,d) for every geometric point s of S. For I a finite closed subscheme
of X - {infinity} disjoint from the zero, a LEVEL-I STRUCTURE is an O_I x S-linear
isomorphism D_I tensor O_S -> E_I compatible with the right D_I-action and with t.

**Hypotheses and warnings.**

- The zero z must AVOID THE RAMIFICATION LOCUS R of D, and also infinity; Hausberger
  notes that when the zero meets I there is no level structure in this sense, and that
  extending the definition to levels dividing the characteristic needs Drinfeld bases,
  which Boyer carried out only away from R
- The normalisation condition (iv) is NOT imposed directly in Laumon-Rapoport-Stuhler:
  they instead take the quotient of the classifying stack by the natural shift action of
  Z. Hausberger records that the two are the same
- D is a CENTRAL SIMPLE algebra of dimension d^2; the case relevant to ES7:equal-
  characteristic is D a DIVISION algebra, which is what makes the moduli projective
- The place infinity is assumed rational over F_q only for simplicity
- AUDIT-20 records the whole of this as ABSENT from both pinned libraries, and notes
  that DrinfeldModulesAndTModules:DM.7's elliptic sheaves are the case D = matrix
  algebra

**Proof outline.**

1. Fix the curve, the algebra and the maximal order, and the places infinity and R.
2. Define a D-elliptic sheaf as the commutative diagram above with the four conditions.
3. Define isomorphisms as compatible systems of isomorphisms of the E_i commuting with
   the pullbacks.
4. Define a level-I structure as a trivialisation of the restriction to I compatible with
   t.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `DEllipticSheaf` | data | The diagram (E_i, j, t) with the four conditions: periodicity, pole, zero and normalisation. |
| `DEllipticSheaf.periodicity` | structure | E_{i+d} = E_i(infinity x S), so the datum is determined by finitely many E_i. |
| `DEllipticSheaf.pole` | structure | E_i/j(E_{i-1}) is supported at infinity and locally free of rank d there. |
| `DEllipticSheaf.zero` | data | The morphism z : S -> X - {infinity} - R; the zero avoids infinity and the ramification locus. |
| `DEllipticSheaf.levelStructure` | data | A trivialisation D_I tensor O_S -> E_I compatible with the right D_I-action and with t, defined when the zero is disjoint from I. |
| `DEllipticSheaf.drinfeldCase` | example | For D = M_d(F) this is Drinfeld's elliptic sheaf, which DrinfeldModulesAndTModules:DM.7 owns. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke` — the moduli problem is over these objects
- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation` — the uniformisation theorem is about their moduli
- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic` — the global cohomology is the cohomology of their moduli

**Unit tests.**

- `matrix_algebra_case` — For D = M_d(F) the definition is Drinfeld's elliptic sheaf; a definition that does not specialise correctly is wrong.
- `periodicity_determines` — The E_i for all i are determined by E_0,...,E_{d-1} together with the twist by infinity.
- `zero_avoids_R` — The zero morphism lands in X - {infinity} - R; allowing it to meet R breaks the level-structure theory, as Hausberger records.
- `normalisation_or_quotient` — Imposing (iv) is the same as taking the quotient of the classifying stack by the shift action of Z.

**Acceptance.**

- Check that the case D = M_d(F) recovers Drinfeld's elliptic sheaves
- Check that the periodicity condition forces the E_i to be determined by E_0,...,E_{d-1}
- Check that the zero avoids R and infinity, and that a level structure needs the zero disjoint from I
- Check the normalisation condition against the quotient-by-Z formulation of Laumon-Rapoport-Stuhler

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic`, `DrinfeldModulesAndTModules:DM.7`, `EtaleDualityAndPerverseSheaves:EDC.2`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:CategoryTheory.Functor`, `mathlib:Module.Free`, `mathlib:Module.Projective`, `mathlib:CommRing`

**Sources.**

- *Definition 1.1, printed p. 1292.* “Soit S un F_q-schema. Un D-faisceau elliptique (de pole infinity et zero z) sur S consiste en la donnee d'un diagramme commutatif ... ou pour chaque i in Z, E_i est un O_X x S-module localement libre de rang d^2, muni d'une action a droite de D compatible a l'action de O_X, ... Ces donnees sont astreintes a satisfaire aux conditions suivantes: (i) Periodicite: E_{i+d} = ...”
  Laumon-Rapoport-Stuhler's definition as Hausberger restates it, quoted from the
  Annales de l'institut Fourier PDF read in this session, whose SHA-256 is recorded in
  the source entry. The excerpt is truncated at a word boundary; the full passage is
  on the printed page named in the locator.
- *Remark after Definition 1.1, printed pp. 1292-1293.* “En fait, la condition de normalisation n'est pas imposee directement dans [LRS]: on considere plutot l'action naturelle de Z, par decalage, sur le champ classifiant les D-faisceaux elliptiques, puis on passe au quotient. Bien sur, cela revient au meme.”
  The difference between Hausberger's formulation and the original, recorded because
  this packet cannot read LRS itself.
- *Section 1.3, printed p. 1293.* “On definit alors une structure de niveau I sur (E_i,j,t) comme la donnee d'un isomorphisme O_I x S-lineaire D_I tensor O_S -> E_I, compatible a l'action a droite de D_I sur les deux membres, et rendant commutatif le diagramme.”
  The level structure, quoted as restated.

### LRS: the moduli scheme of D-elliptic sheaves with level structure, and its Hecke correspondences

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke` — *construction* · planet **The moduli of D-elliptic sheaves**

**Statement.**

The functor of D-elliptic sheaves with level-I structure is REPRESENTABLE by a scheme
E^infinity_{X,D,I}, QUASI-PROJECTIVE over X^infinity = X - {infinity} - I - R through
the zero morphism, SMOOTH and PURELY OF RELATIVE DIMENSION d-1 over it. WHEN D IS A
DIVISION ALGEBRA it is PROJECTIVE over X^infinity. The proof factors the moduli problem
through a scheme Vect^infinity_{X,D,I} classifying the chains of D tensor O_S-modules
with level structure satisfying (i), (ii) and (iv), and a scheme Hecke_{X,D,I}
classifying the diagrams whose two rows are such chains and whose t's satisfy (iii);
Laumon-Rapoport-Stuhler show Hecke_{X,D,I} is smooth and quasi-projective over F_q and
that the morphism to (X - {infinity} - I - R) x Vect^infinity_{X,D,I} given by the zero
and the first row is smooth of relative dimension d-1, and E^infinity_{X,D,I} is the
fibre product. Moreover the functor extends to a PROJECTIVE scheme over (X - {infinity}
- I - R) union {o} for a place o, which prolongs E^infinity_{X,D,I}; and varying I gives
the right action of D^times(A^infinity) by HECKE CORRESPONDENCES.

**Hypotheses and warnings.**

- Smoothness and the dimension d-1 come from the Hecke scheme, not from
  E^infinity_{X,D,I} directly; the proof is a fibre-product argument
- Projectivity requires D to be a DIVISION algebra; for a general central simple algebra
  the moduli is only quasi-projective
- The extension over the place o, which is what the uniformisation theorem needs, uses
  an argument of Lafforgue for Drinfeld shtukas: the additional datum is a subsheaf E'
  of E_0 locally free of rank d^2, D-stable, with E_0/E' locally free of rank d over O_S
  supported on the graph of the zero
- The Hecke action of D^times(A^infinity) is defined by varying the level, and is what
  makes the cohomology a smooth representation
- AUDIT-20 records all of this as ABSENT from both libraries: no sheaf of orders on a
  curve, no elliptic sheaf, no moduli

**Proof outline.**

1. Construct Vect^infinity_{X,D,I} classifying chains with level structure satisfying
   (i), (ii), (iv), using a semistability result for the E_i.
2. Construct Hecke_{X,D,I} classifying the two-row diagrams whose t's satisfy (iii); it
   is smooth and quasi-projective over F_q.
3. Show the morphism Hecke_{X,D,I} -> (X - {infinity} - I - R) x Vect^infinity_{X,D,I} is
   smooth of relative dimension d-1.
4. Obtain E^infinity_{X,D,I} as the fibre product, hence smooth quasi-projective of
   relative dimension d-1.
5. For the extension over o, argue as Lafforgue does for Drinfeld shtukas with the
   subsheaf E' of E_0.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `moduli` | data | E^infinity_{X,D,I}, quasi-projective over X^infinity through the zero morphism. |
| `moduli.smooth` | structure | Smooth and purely of relative dimension d-1 over X^infinity. |
| `moduli.projective` | structure | Projective when D is a DIVISION algebra. |
| `moduli.extension` | data | The projective extension over (X - {infinity} - I - R) union {o}, prolonging the moduli. |
| `hecke` | functoriality | The right action of D^times(A^infinity) on the tower over varying I, by Hecke correspondences. |
| `heckeScheme` | data | Hecke_{X,D,I}, smooth and quasi-projective over F_q, from which smoothness and the dimension are deduced. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation` — the uniformisation theorem describes the formal completion of this scheme
- `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic` — its l-adic cohomology carries the automorphic and Galois actions
- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration` — the spectral sequence converges to its cohomology

**Unit tests.**

- `dimension_is_d_minus_one` — The relative dimension over X^infinity is d-1; for d = 1 the moduli is etale over the curve.
- `projectivity_needs_division` — For D = M_d(F) the moduli is only quasi-projective; projectivity is the division-algebra case.
- `extension_over_o` — The extension over o is projective and prolongs the moduli; without it there is nothing for the uniformisation theorem to complete along.
- `hecke_by_level` — The D^times(A^infinity)-action comes from varying I; a construction at fixed level has no such action.

**Acceptance.**

- Check that smoothness and dimension come from the Hecke scheme through the fibre product
- Check that projectivity needs D to be a division algebra
- Check the extension over o and the Lafforgue-style argument it uses
- Check that the Hecke action comes from varying the level

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic`, `DrinfeldModulesAndTModules:DM.7`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.8`, `DeligneWeightsAndPurity:DWP.7`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:Module.Free`, `mathlib:CategoryTheory.Functor`, `mathlib:CommRing`

**Sources.**

- *Theoreme 6.1, printed p. 1311.* “Le foncteur E^infinity_{X,D,I} est representable par un schema E^infinity_{X,D,I} quasi-projectif sur X^infinity. Ce schema est lisse et purement de dimension relative d-1 au-dessus de X^infinity. Lorsque D est une algebre a division, c'est un X^infinity-schema projectif.”
  The representability theorem as Hausberger states it, quoted from the hash-verified
  Annales de l'institut Fourier PDF read in this session.
- *Proof of Theoreme 6.1, printed p. 1312.* “Les auteurs de [LRS] montrent que le schema Hecke_{X,D,I} est lisse et quasi-projectif sur F_q, et que le morphisme Hecke_{X,D,I} -> (X - {infinity} - I - R) x Vect^infinity_{X,D,I}, donne par le morphisme zero et par le premier rang, est lisse de dimension relative d-1. On conclut alors a la representabilite de E^infinity_{X,D,I} par un schema quasi-projectif lisse de ...”
  How the theorem is proved, and what is attributed to Laumon-Rapoport-Stuhler. The
  excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.
- *Theoreme 6.4, printed p. 1313.* “Le foncteur E^infinity_{X,D,I} est representable par un schema projectif sur (X - {infinity} - I - R) union {o} qui prolonge le schema E^infinity_{X,D,I}.”
  The extension over the place o, which the uniformisation theorem needs.

### Drinfeld's theorem: special formal O_D-modules and the formal scheme Omega-hat^d

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules` — *theorem*

**Statement.**

A FORMAL O_D-MODULE is a smooth formal group X over B with an O_D-action whose
underlying formal O-module structure is the evident one; it is SPECIAL if the action of
the maximal order O_d inside O_D makes the tangent space Lie X an invertible O_d tensor
O_B-module. All special formal O_D-modules of height d^2 over an algebraically closed
extension of F_{q^d} are O_D-linearly ISOGENOUS, and the endomorphism algebra of one of
them is End^0_D X = M_d(K). Let Phi be such a module. The functor that assigns to a
nilpotent O^nr-algebra B the set of isomorphism classes of pairs (H, rho) consisting of
a special formal O_D-module H of height d^2 over B and a quasi-isogeny rho of height
zero from Phi over B/piB to H over B/piB is REPRESENTABLE BY THE FORMAL SCHEME Omega-
hat^d tensor-hat_O O-hat^nr. The groups GL_d(K) = Aut^0_D(Phi) and D^times act on it,
the GL_d(K)-action being Drinfeld's, obtained from the natural action on Omega-hat^d
together with the action g -> Fr^{-v(det g)} on O-hat^nr, and defined only over O and
not over O^nr.

**Hypotheses and warnings.**

- The isogeny classification of special formal O_D-modules is Drinfeld's; Hausberger
  proves it through the COORDINATE MODULE functor, an anti-equivalence between formal
  O-modules of finite height over B and a category of Dieudonne-type modules with a
  semilinear Frobenius
- The GL_d(K)-action is defined ONLY OVER O, not over O^nr, because it mixes the action
  on Omega-hat^d with a Frobenius twist on O-hat^nr; Hausberger converts Drinfeld's left
  action into a right action by transposition g -> transpose g
- Speciality is a condition on the TANGENT SPACE, that Lie X be an invertible O_d tensor
  O_B-module; without it the formal module is not classified by Drinfeld's theorem
- This is the LOCAL side of the uniformisation and is what the Drinfeld tower is built
  from; it is HeckeStacksAndLocalShtukas:HS2's local-shtuka material in the equal-
  characteristic incarnation
- AUDIT-20 records the uniformisation by Drinfeld and local-shtuka towers as absent from
  both libraries

**Proof outline.**

1. Define formal O_D-modules and speciality through the action on the tangent space.
2. Pass to coordinate modules, an anti-equivalence with a category of modules with
   semilinear Frobenius, and read speciality as a grading condition.
3. Deduce that all special formal O_D-modules of height d^2 over an algebraically closed
   field are isogenous, with endomorphism algebra M_d(K).
4. State Drinfeld's representability of the deformation functor by Omega-hat^d tensor-
   hat_O O-hat^nr, and record the GL_d(K)- and D^times-actions.

**Acceptance.**

- Check that speciality is a condition on the tangent space
- Check that the endomorphism algebra of the isogeny class is M_d(K)
- Check that the GL_d(K)-action is defined over O and not over O^nr
- Check that Hausberger's right action differs from Drinfeld's left action by a transposition

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS3`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:Module.Free`, `mathlib:CommRing`, `mathlib:Representation`

**Sources.**

- *Definition 3.1, printed p. 1302.* “Un O_D-module formel est un groupe formel lisse X sur B muni d'une action de O_D telle que le groupe formel avec action de O sous-jacent soit un O-module formel. Il est dit special lorsque l'action de O_d inside O_D induite sur l'espace tangent Lie X fait de celui-ci un O_d tensor O_B-module inversible.”
  The definition of a special formal O_D-module, quoted from the hash-verified PDF
  read in this session.
- *Theoreme 3.4, printed p. 1303.* “Tous les O_D-modules formels speciaux X de hauteur d^2 sur une extension algebriquement close de F_{q^d} sont (O_D-lineairement) isogenes; de plus, on a End^0_D X = End_{O_D} X tensor K = M_d(K).”
  The isogeny classification, quoted verbatim.
- *Theoreme 7.2 and Theoreme 7.4, printed p. 1318.* “Le foncteur G-tilde est representable par le O-hat^nr-schema formel Omega-hat^d tensor-hat_O O-hat^nr. ... Le foncteur G n'est autre que le foncteur deduit de G-tilde par restriction des scalaires de O^nr a O.”
  Drinfeld's representability theorem, quoted as Hausberger states it.
- *Section 7.3, printed p. 1318.* “Via l'identification GL_d(K) = Aut^0_D(Phi), un element g de GL_d(K) definit une quasi-isogenie de Phi de hauteur dn si v(det g) = n. ... On definit une action de GL_d(K) sur le foncteur G.”
  How the GL_d(K)-action is defined.

### Hausberger's theorem: uniformisation of the Laumon-Rapoport-Stuhler varieties

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation` — *theorem* · planet **Uniformisation of the LRS varieties**

**Statement.**

There is an isomorphism of formal O_o-schemes between the FORMAL COMPLETION of
E^infinity_{X,D,I} along its special fibre and [(Omega-hat^d tensor-hat_{O_o}
O-hat^nr_o) x Z_I] / GL_d(F_o), compatible as I varies with the level-restriction
morphisms; the isomorphism of the two projective systems so obtained is compatible with
the action of D^times(A^{infinity,o}) x D^times(A^{infinity,o}) on the two sides, and
lifts to isomorphisms between the special formal O_{D_o}-modules naturally carried by
the two sides. In rigid-analytic form, (E^infinity_{X,D,I})^an is isomorphic to [Omega^d
tensor-hat_{F_o} F-hat^nr_o x Z_I]/GL_d(F_o); and after adding the Drinfeld coverings,
there is an isomorphism of rigid-analytic spaces over F_o between
(E^infinity_{X,D,I})^an and [Sigma^d_n x Z_{I^o}]/GL_d(F_o), compatible with the
projections as I varies and EQUIVARIANT for the action of D^times(A^infinity) =
D^times(A^{infinity,o}) x D^times_o.

**Hypotheses and warnings.**

- The quotient on the right is a FINITE UNION OF GALOIS TWISTED FORMS over unramified
  extensions, and not a naive quotient; Hausberger explains this after the statement
- The action of D^times_o on the coverings Sigma^d_n is DRINFELD'S LEFT ACTION TURNED
  INTO A RIGHT ACTION via g -> g^{-1}; and in the spectral sequences that follow, the
  GL_d(F_o)-action on the cohomology of the coverings is Drinfeld's composed with g ->
  transpose g^{-1}. The roadmap's insistence on tracking conventions is exactly right
  here: Hausberger flags this in his Remarque 10.8
- The formal-scheme statement (Theoreme 8.1) is the substantive one; the rigid-analytic
  one with the coverings (Theoreme 8.3) is deduced from it FORMALLY, using that
  E^infinity_{X,D,I} classifies the isomorphisms between the pi^n-torsion of the formal
  module and D_o tensor O_o/pi^n
- This is the Cerednik-Drinfeld analogue in equal characteristic, and Hausberger does
  NOT reprove Drinfeld's theorem, referring to Drinfeld, Boutot-Carayol and Genestier
- The proof uses the coordinate-module theory of special formal O_D-modules and, in
  Genestier's equal-characteristic proof of Drinfeld's theorem, the theory of the module
  of coordinates

**Proof outline.**

1. Fix a special D-elliptic sheaf of characteristic o and its associated formal
   O_{D_o}-module.
2. Show that the set of ALGEBRISATIONS with level structure - pairs of a D-elliptic sheaf
   and an equivariant isomorphism from the given formal module to the one it carries - is
   in natural bijection with a double-coset set Z_I.
3. Deduce the isomorphism of formal schemes, compatible with level and with the prime-
   to-o Hecke action, and lift it to the formal modules.
4. Deduce the rigid-analytic statement with the Drinfeld coverings formally, from the
   moduli description of the pi^n-torsion.

**Acceptance.**

- Check that the right-hand side is a finite union of Galois twisted forms
- Check the conversion between Drinfeld's left action and the right actions used
- Check that Theoreme 8.3 follows formally from Theoreme 8.1
- Check that the isomorphism lifts to the special formal modules, which is what the torsion argument needs

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/D-elliptic-sheaf`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS3`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic`, `EtaleDualityAndPerverseSheaves:EDC.2`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:Representation`, `mathlib:Subgroup`

**Sources.**

- *Theoreme 8.1, printed p. 1321.* “Avec les conventions et notations precedentes, on a un isomorphisme de O_o-schemas formels E-hat^infinity_{X,D,I} = [(Omega-hat^d tensor-hat_{O_o} O-hat^nr_o) x Z_I]/GL_d(F_o) ou E-hat^infinity_{X,D,I} designe le complete formel de E^infinity_{X,D,I} le long de sa fibre speciale. Ces isomorphismes sont compatibles, lorsque I varie, avec les morphismes de restriction du niveau.”
  The uniformisation theorem, quoted from the hash-verified Annales de l'institut
  Fourier PDF read in this session.
- *Theoreme 8.3, printed p. 1323.* “Il existe un isomorphisme d'espaces rigides-analytiques sur F_o : (E^infinity_{X,D,I})^an = [Sigma^d_n x Z_{I^o}]/GL_d(F_o). Ces isomorphismes sont compatibles, lorsque I varie (i.e. n et I^o varient), aux operations de projection, et l'isomorphisme ainsi obtenu entre les deux systemes projectifs est equivariant pour l'action du groupe D^times(A^infinity) = D^times(A^{infinity,o}) x D^times_o.”
  The rigid-analytic form with the Drinfeld coverings, quoted verbatim.
- *Remarque after Theoreme 8.3, printed p. 1323.* “Comme precedemment, le quotient du membre de droite de la formule n'est rien d'autre qu'une reunion finie de formes tordues galoisiennes de quotients Sigma^d_n/Gamma_i, pour des sous-groupes de congruences Gamma_i inside PGL_d(F_o).”
  What the quotient actually is.

### The fundamental local representation U^i_d and its three commuting actions

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation` — *definition* · planet **The fundamental local representation**

**Statement.**

Fix a prime l different from p, an algebraic closure Q-bar_l and a local field K, and
let Sigma^d_n be Drinfeld's coverings of the generalised upper half plane Omega^d_K. Put
U^i_{d,n} = H^i_c((Res_{K-hat^nr / K} Sigma^d_n) tensor K-bar, Q-bar_l), where Res
denotes Weil restriction of scalars. The FUNDAMENTAL LOCAL REPRESENTATION is the
inductive limit U^i_d = colim_n U^i_{d,n} for i = d-1, the MIDDLE DEGREE. It is an
l-adic representation of the product group G = GL_d(K) x D^times_d x W_K, and it is the
compact induction from the subgroup of elements of determinant of valuation zero, up to
the usual conventions, of the limit of the H^i_c((Sigma^d_n) tensor K-bar). A
representation of G is ADMISSIBLE if it comes by extension of scalars from a
representation over a finite extension of Q_l that is admissible for H = GL_d(K) x
D^times_d and on which, for every compact M inside H, the W_K-action on the M-invariants
is continuous; the irreducible admissible representations of G are the tensor products
pi tensor rho tensor sigma.

**Hypotheses and warnings.**

- The degree is the MIDDLE one, i = d-1; the other degrees are the subject of the
  Carayol-Harris conjecture and are NOT part of this statement
- The compact-induction description is how the fundamental local representation is
  traditionally defined, following Carayol; the two descriptions agree
- The admissibility of the GL_d(K)-action is NOT proved by Hausberger: he takes it from
  Boyer and Faltings and says he cannot prove it directly, while noting that it is not
  used in the proof of the main theorem. That is a genuine caveat and this packet
  records it
- The Weil restriction is 'a la Weil' in the sense of Hausberger's Section 9.2; and l is
  different from the residue characteristic p
- AUDIT-20 records the three-action cohomology as absent from both libraries, and notes
  that Mathlib's l-adic cohomology is a bare definition with no finiteness, purity or
  compact-support theory

**Proof outline.**

1. Define the coverings Sigma^d_n and their Weil restriction.
2. Take compactly supported l-adic cohomology in each degree and pass to the limit over
   n.
3. Single out the middle degree i = d-1 and record the three commuting actions of
   GL_d(K), D^times_d and W_K.
4. Define admissibility for the product group and record that the irreducible admissible
   objects are triple tensor products.

**Planning API.**

| Name | Role | Statement |
| --- | --- | --- |
| `U` | data | U^i_d = colim_n H^i_c((Res Sigma^d_n) tensor K-bar, Q-bar_l), with i = d-1 the middle degree. |
| `U.threeActions` | structure | Commuting actions of GL_d(K), D^times_d and W_K. |
| `U.compactInduction` | characterisation | U^i_d is the compact induction of the limit of the H^i_c((Sigma^d_n) tensor K-bar); this is Carayol's traditional definition. |
| `IsAdmissibleTriple` | data | Admissibility for the product group: admissible for GL_d(K) x D^times_d, with continuous W_K-action on invariants under any compact subgroup. |
| `irreducibleTriples` | characterisation | The irreducible admissible objects are the tensor products pi tensor rho tensor sigma. |
| `U.glAdmissibilityImported` | structure | Admissibility of the GL_d(K)-action is imported from Boyer and Faltings and is not used in the main theorem. |

**Where it is used.**

- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol` — the main theorem computes its supercuspidal isotypic components
- `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration` — the spectral sequence has its cohomology as E_2-input
- `HeckeStacksAndLocalShtukas:HS3` — the local-shtuka side of the Hecke comparison consumes it

**Unit tests.**

- `middle_degree` — The fundamental local representation is the middle degree d-1; the other degrees are conjectural (Carayol-Harris).
- `three_actions_commute` — GL_d(K), D^times_d and W_K act, and the actions commute.
- `compact_induction_agrees` — The compact-induction description agrees with the direct one.
- `gl_admissibility_is_imported` — Admissibility for GL_d(K) is quoted from Boyer and Faltings; a development that assumes it proved here has assumed too much.

**Acceptance.**

- Check that the degree is the middle one
- Check the compact-induction description against the direct one
- Check that the three actions commute
- Check that the admissibility of the GL_d(K)-action is imported and is not used in the main theorem

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/special-formal-modules`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS3`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.8`, `DeligneWeightsAndPurity:DWP.7`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `mathlib:Representation`, `mathlib:Condensed`, `mathlib:MonoidHom`, `tauceti:TauCeti.IsSmoothDiscrete`

**Sources.**

- *Definition 9.3, printed p. 1336.* “Nous appelons representation locale fondamentale la limite inductive U^i_d = colim_n U^i_{d,n}, pour i = d-1 (cohomologie en degre median). Il s'agit d'une representation l-adique du groupe G; en fait, on voit facilement que U^i_d est l'induite compacte de P_d a G de la limite sur n des representations H^i_c((Sigma^d_n) tensor K-bar, Q-bar_l). C'est de cette derniere maniere ...”
  The definition, quoted from the hash-verified Annales de l'institut Fourier PDF read
  in this session. The excerpt is truncated at a word boundary; the full passage is on
  the printed page named in the locator.
- *Section 9.3, printed p. 1337.* “Notons G le groupe produit GL_d(K) x D^times_d x W_K. On dira qu'une representation de G (sur Q-bar_l) est admissible si elle provient par extension des scalaires a Q-bar_l d'une representation de G definie sur une extension finie E de Q_l, la representation etant une representation admissible du groupe produit H = GL_d(K) x D^times_d telle que, pour tout compact M inside H, ...”
  The admissibility notion for the three-action category, quoted verbatim. The excerpt
  is truncated at a word boundary; the full passage is on the printed page named in
  the locator.
- *Proposition 9.4 and its discussion, printed p. 1337.* “Ce fait sera demontre plus loin (cf. proposition 10.6(i)), a l'exception de l'admissibilite de l'action de GL_d(K) qui decoule de [Bo] et [Fal1] (l'auteur ne sait pas demontrer directement que l'action de GL_d est admissible; noter cependant que cette admissibilite n'intervient pas dans la preuve du theoreme qui suit).”
  The caveat about admissibility, which this packet carries.

### Hausberger: the Hochschild-Serre spectral sequence and the degeneration of its cuspidal part

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration` — *theorem* · planet **The Hochschild-Serre degeneration**

**Statement.**

For every 0 <= j <= 2(d-1) the compactly supported cohomology H^j_c((Res Sigma^d_n)
tensor F-bar_o, Q-bar_l) is a SMOOTH Q-bar_l-representation of GL_d(F_o) x D^times_o, of
FINITE TYPE as a GL_d(F_o)-module. The l-adic cohomology of the analytic space Res
Sigma^d_n and that of the scheme E^infinity_{X,D,I} are related by the spectral sequence
E_2^{i,j} = Ext^i_{GL_d(F_o)-smooth}(H^{2(d-1)-j}_c((Res Sigma^d_n) tensor F-bar_o,
Q-bar_l)(d-1), A^infinity_{I^o}) => H^{i+j}(E^infinity_{X,D,I} tensor F-bar_o, Q-bar_l),
where A^infinity_{I^o} is the space of automorphic forms on Z_{I^o} trivial at infinity
and (d-1) is a Tate twist. The spectral sequences for varying I are compatible with the
transition maps, and the projective systems are equivariant for D^times(A^infinity) and
for W_{F_o}; passing to the limit gives a D^times(A^infinity) x W_{F_o}-equivariant
spectral sequence with A^infinity_D, the automorphic forms on D^times(A) trivial at
infinity, in place of A^infinity_{I^o}. Finally the CUSPIDAL PART OF THE SPECTRAL
SEQUENCE DEGENERATES: for every j there are isomorphisms of D^times_o x
W_{F_o}-representations E_2^{0,j}[pi] = (H^j_{o,n})^ss[pi] tensor pi_o.

**Hypotheses and warnings.**

- In these spectral sequences the GL_d(F_o)-action on the cohomology of the coverings is
  DRINFELD'S ACTION COMPOSED WITH g -> transpose g^{-1}; Hausberger flags this in
  Remarque 10.8 and it comes from the form of the uniformisation theorem used. Getting
  it wrong dualises the answer
- The degeneration is proved by showing Ext^i vanishes for i > 0 after Frobenius
  reciprocity and Harish-Chandra's theorem for the supercuspidal pi_o, and then a
  MULTIPLICITY-COUNTING argument comparing E_2 with E_infinity along the differentials
- The Ext groups are taken in SMOOTH GL_d(F_o)-modules; Res Sigma^d_n is a disjoint
  union of copies of Sigma^d_n indexed by Z, whose stabiliser is the subgroup of
  elements with unit determinant, and Frobenius reciprocity reduces the Ext to that
  subgroup
- Hausberger notes that Fargues has since written a spectral sequence valid in all known
  uniformisation cases, by a different approach using Huber's theory rather than
  Berkovich's
- The continuous Hochschild-Serre construction in general is
  ArithmeticGaloisDuality:R02.2's; what is proved here is its application to this
  geometric quotient

**Proof outline.**

1. Build an admissible covering of Res Sigma^d_n by distinguished Berkovich opens, using
   the map to the geometric realisation of the Bruhat-Tits building of PGL_d(F_o).
2. Construct the Hochschild-Serre spectral sequence for the quotient by GL_d(F_o), using
   Berkovich's theory of analytic spaces with operators.
3. Pass to the limit over the level to get the D^times(A^infinity) x W_{F_o}-equivariant
   form.
4. Show that the Ext^i vanish for i > 0 on the pi-isotypic part, by Frobenius reciprocity
   and Harish-Chandra's theorem for supercuspidal representations.
5. Compare E_2 with E_infinity by a multiplicity count along the differentials, and
   conclude the degeneration.

**Acceptance.**

- Check that the GL_d(F_o)-action is Drinfeld's composed with g -> transpose g^{-1}
- Check the finiteness and smoothness of the cohomology of the coverings
- Check the vanishing of the higher Ext on the cuspidal part
- Check the multiplicity argument that upgrades the vanishing to degeneration

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/moduli-and-hecke`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic`, `ArithmeticGaloisDuality:R02.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.8`, `DeligneWeightsAndPurity:DWP.7`, `DeligneWeightsAndPurity:DWP.8`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `mathlib:Representation`, `mathlib:CategoryTheory.Preadditive`, `mathlib:DirectSum`

**Sources.**

- *Proposition 10.6, printed p. 1341.* “(i) Pour tout entier 0 <= j <= 2(d-1), le groupe de cohomologie a support compact H^j_c((Res Sigma^d_n) tensor F-bar_o, Q-bar_l) est une Q-bar_l-representation lisse du groupe produit GL_d(F_o) x D^times_o. Elle est de type fini en tant que GL_d(F_o)-module. (ii) La cohomologie l-adique de l'espace analytique Res Sigma^d_n et la cohomologie l-adique du schema ...”
  The spectral sequence, quoted from the hash-verified Annales de l'institut Fourier
  PDF read in this session. The excerpt is truncated at a word boundary; the full
  passage is on the printed page named in the locator.
- *Corollaire 10.7, printed p. 1341.* “Il existe une suite spectrale D^times(A^infinity) x W_{F_o}-equivariante: E_2^{i,j} = Ext^i_{GL_d(F_o)-mod. lisse}(H^{2(d-1)-j}_c((Res Sigma^d_n) tensor F-bar_o, Q-bar_l)(d-1), A^infinity_D) => H^{i+j}(E^infinity_n tensor F-bar_o, Q-bar_l), ou A^infinity_D designe l'espace des formes automorphes sur D^times(A) triviales a l'infini.”
  The limit form with the automorphic forms on the division algebra, quoted verbatim.
- *Remarque 10.8, printed p. 1342.* “Attention, dans les suites spectrales de la proposition 10.6 et son corollaire, l'action de GL_d(F_o) sur la cohomologie a support des revetements Sigma^d_n est celle de Drinfeld composee avec l'application g -> transpose g^{-1}; cela provient de l'application du theoreme d'uniformisation 8.3.”
  The convention warning, quoted verbatim - exactly the kind of thing the roadmap
  insists be tracked.
- *Proposition 10.17, printed p. 1355.* “Pour tout entier 0 <= j <= 2(d-1), on a des isomorphismes entre representations de D^times_o x W_{F_o} : E_2^{0,j}[pi] = Hom_{GL_d(F_o)}(H^{2(d-1)-j}_c((Res Sigma^d_n) tensor F-bar_o, Q-bar_l)(d-1), pi_o) = (H^j_{o,n})^ss[pi] tensor pi_o. Cette proposition signifie que la partie cuspidale de la suite spectrale est degeneree.”
  The degeneration of the cuspidal part, quoted verbatim.

### Hausberger's main theorem: the Drinfeld-Carayol conjecture in equal characteristic

`ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/drinfeld-carayol` — *theorem* · planet **The Drinfeld-Carayol conjecture in equal characteristic**

**Statement.**

Let pi be an irreducible SUPERCUSPIDAL representation of GL_d(K) with central character
chi, where K = F_q((t)) is a local field of equal characteristic. Then pi occurs in the
decomposition into irreducible constituents of U^i_d(chi) IF AND ONLY IF i = d-1, and
the pi-isotypic component of the fundamental local representation is U^{d-1}_d(chi)[pi]
= JL(pi) tensor (sigma_d(pi) tensor |.|^{(1-d)/2}), where JL is the local Jacquet-
Langlands correspondence in equal characteristic, sigma_d is the local Langlands
correspondence of Laumon-Rapoport-Stuhler, and the isotypic component of an object W is
W[pi] = Hom_{GL_d(K)}(pi,W).

**Hypotheses and warnings.**

- This is the RIGID-ANALYTIC side of the Drinfeld-Deligne-Carayol conjecture, in EQUAL
  CHARACTERISTIC: the fourth and, at the time, missing quadrant of the table of cases.
  The vanishing-cycles side in equal characteristic is Boyer's, and the two p-adic cases
  are Harris, Harris-Taylor
- The twist is |.|^{(1-d)/2}, the Hecke normalisation sigma^r_d(pi) = sigma_d(pi) tensor
  |.|^{(1-d)/2} that Laumon-Rapoport-Stuhler's geometry produces directly; dropping it
  changes the correspondence
- The proof is GLOBAL: it uses the uniformisation theorem, the comparison between the
  local representation and the global cohomology of the moduli of D-elliptic sheaves,
  the Hochschild-Serre spectral sequence and its cuspidal degeneration. That comparison
  method is Deligne's, developed by Carayol, Harris, Harris-Taylor and Boyer
- The non-supercuspidal part of the cohomology is the Carayol-Harris conjecture, which
  is NOT proved here and is not planned
- The local Jacquet-Langlands correspondence in equal characteristic is Badulescu's
  theorem, characterised by the characters agreeing up to the sign (-1)^{d-1} on
  associated regular elements, and is imported

**Proof outline.**

1. Globalise: choose a curve, an algebra D and a place o so that the local situation at o
   is the given one, and use the globalisation and transfer lemmas of ES7:function-field-
   automorphic.
2. Apply the Laumon-Rapoport-Stuhler description of the cohomology of the moduli in terms
   of the local Langlands correspondence, to compute the chi-isotypic part of the global
   cohomology.
3. Apply the Hochschild-Serre spectral sequence of the uniformisation and its cuspidal
   degeneration to relate that to the cohomology of the Drinfeld coverings.
4. Read off the pi-isotypic component of the fundamental local representation.

**Acceptance.**

- Check that the answer is concentrated in the middle degree
- Check the twist |.|^{(1-d)/2} and that it is the Hecke normalisation
- Check that the proof is global and names each global input
- Check that the non-supercuspidal part is not claimed

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/hochschild-serre-and-degeneration`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/fundamental-local-representation`, `ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic/uniformisation`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic`, `ExcursionOperatorsAndSpectralAction:ES5`, `ExcursionOperatorsAndSpectralAction:ES6:functoriality`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic`, `HeckeStacksAndLocalShtukas:HS2`, `HeckeStacksAndLocalShtukas:HS3`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`, `WeilConjectures:WC.2`, `mathlib:Representation`, `mathlib:LinearMap.trace`

**Sources.**

- *Theoreme 9.5, printed p. 1337.* “Soit pi une representation irreductible supercuspidale de GL_d(K), de caractere central chi. Alors pi intervient dans la decomposition en elements irreductibles de U^i_d(chi) si et seulement si i = d-1. La composante pi-isotypique de la representation locale fondamentale est U^{d-1}_d(chi)[pi] = JL(pi) tensor (sigma_d(pi) tensor |.|^{(1-d)/2}).”
  The main theorem, quoted from the hash-verified Annales de l'institut Fourier PDF
  read in this session.
- *Theoreme 9.1, printed p. 1334.* “(Badulescu, en egale caracteristique p) Il existe une bijection A^d_d(K) -> AD_d, pi -> JL(pi), caracterisee par la propriete que les caracteres de pi et JL(pi) coincident au signe (-1)^{d-1} pres sur les elements associes reguliers.”
  The local Jacquet-Langlands correspondence in equal characteristic, imported.
- *Introduction, printed p. 1290.* “La preuve de la conjecture de Drinfeld-Deligne-Carayol relative a U^{d-1}_d procede par voie globale: on utilise le theoreme d'uniformisation, precedemment etabli (partie II), des varietes de modules E^infinity_{X,D,I}, et la methode (inventee par Deligne et developpee par differents auteurs) de comparaison entre la representation locale U_d et la cohomologie globale de la ...”
  That the proof is global and how it runs. The excerpt is truncated at a word
  boundary; the full passage is on the printed page named in the locator.

**What remains in this layer.**

- LAUMON-RAPOPORT-STUHLER ITSELF WAS NOT READ. A 124-page scan was obtained from the
  Goettingen digitisation centre and its hash is recorded in the gaps, but it has no
  text layer and no optical character recognition was available in this session, so its
  identity could not even be confirmed. Everything this packet attributes to Laumon-
  Rapoport-Stuhler comes through Hausberger's restatements, and every such node says so.
- Sections 4 and 5 of Laumon-Rapoport-Stuhler, which the roadmap names for the moduli,
  were therefore not read; Hausberger's Sections 5 and 6 restate what is needed.
- Drinfeld's theorem on the representability of the deformation functor is not reproved
  by Hausberger either; he refers to Drinfeld, Boutot-Carayol and Genestier, none of
  which was read.
- The Berkovich-theoretic appendix of Hausberger, which supplies the smoothness of the
  action on compactly supported cohomology and the results used in constructing the
  spectral sequence, was not read.
- The Carayol-Harris conjecture on the non-supercuspidal part of the cohomology is
  conjectural and is deliberately not planned.
- The roadmap asks that this realisation be TRANSPORTED TO HS3 and that ES7:GLn-
  comparison's trace argument then be repeated; no node here performs that transport,
  because the Hecke comparison it needs is HeckeStacksAndLocalShtukas' and the atlas
  records no edge from this layer to HS3 in that direction.

## ES7:function-field-automorphic — The required characteristic-p global supplier

*Coverage: **partial**. 4 nodes.*

The characteristic-p global inputs, as far as Hausberger restates them: the l-adic
cohomology of the moduli with its admissible D^times(A^infinity)-action and its Weil-
group action after proper base change; Laumon-Rapoport-Stuhler's determination of which
automorphic representations occur; the globalisation of a supercuspidal with prescribed
local components; the inner-form transfer by a simple trace formula, with multiplicity
one in the stated range; and the resulting isotypic computation. Kaiser's erratum is
recorded as a separate node.

### LRS 14.9 and 14.12: which automorphic representations occur in the cohomology of the moduli

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology` — *theorem* · planet **The global cohomology of the LRS varieties**

**Statement.**

Fix a prime l different from p and set H^n_I = H^n(E^infinity_{I,F} tensor_F F-bar,
Q-bar_l) for 0 <= n <= 2d-2. These are FINITE-DIMENSIONAL Q-bar_l-vector spaces with a
Q_l-structure and a continuous action of Gal(F^s/F); the right action of
D^times(A^infinity) on E^infinity_F through the Hecke correspondences induces a left
action, defined over Q_l and commuting with the Galois action, on the inductive limit
H^n = colim_I H^n_I, so that D^times(A^infinity) x Gal(F^s/F) acts. Fixing a place o,
one uses instead H^n_o = colim_I H^n(E^infinity_{I,F} tensor_F F-bar_o, Q-bar_l),
canonically isomorphic to H^n as a W_{F_o}-representation by proper base change, with
the D^times(A^infinity)-action ADMISSIBLE because the K_I-invariants are finite-
dimensional. Then: only representations Pi such that Pi tensor 1 or Pi tensor
St_infinity is AUTOMORPHIC can occur nontrivially in the isotypic decompositions of the
semisimplifications (H^n_o)^ss. In the first case Pi factors as chi composed with the
reduced norm for a character chi of the ideles such that chi tensor 1 is a Hecke
character. In the second case the V^n_Pi vanish for n different from d-1, while
V^{d-1}_Pi is a SEMISIMPLE representation of W_{F_o} OF DIMENSION m(Pi) d, where m(Pi)
is the multiplicity of Pi.

**Hypotheses and warnings.**

- This is Laumon-Rapoport-Stuhler's Theorems 14.9 and 14.12, quoted by Hausberger.
  LAUMON-RAPOPORT-STUHLER ITSELF WAS NOT READ IN THIS SESSION: the only copy obtained is
  a page scan with no text layer. Every statement here rests on Hausberger's
  restatement, and the packet says so
- The properties characterising V^{d-1}_Pi are in Laumon-Rapoport-Stuhler and are NOT
  restated by Hausberger; the packet does not restate them either
- Admissibility of the D^times(A^infinity)-action follows from the finite-dimensionality
  of the level-I cohomology, which follows from the properness of the moduli when D is a
  division algebra
- The passage from H^n to H^n_o is by PROPER BASE CHANGE, which needs the moduli to be
  proper - again the division-algebra case
- AUDIT-20 records this layer as duplicating FunctionFieldArithmetic:FA.6 and FA.2 and
  AdelicAlgebraicGroups:AA.0 and AA.1; the adelic and automorphic infrastructure is
  requested from them and not planned here

**Proof outline.**

1. Take the l-adic cohomology of the moduli at each level and pass to the limit over
   levels.
2. Record the commuting actions of D^times(A^infinity), by Hecke correspondences, and of
   the global Galois group.
3. Restrict attention to a place o and use proper base change to replace the global
   Galois action by the local Weil group.
4. Quote Laumon-Rapoport-Stuhler's determination of the automorphic representations that
   occur, and the shape of the associated Galois representations.

**Acceptance.**

- Check that the cohomology is finite-dimensional at each level and admissible in the limit
- Check that proper base change is used and where properness comes from
- Check that only the two named kinds of Pi occur
- Check that V^{d-1}_Pi has dimension m(Pi) d and is semisimple

**Prerequisites.** `FunctionFieldArithmetic:FA.6`, `FunctionFieldArithmetic:FA.2`, `AdelicAlgebraicGroups:AA.0`, `AdelicAlgebraicGroups:AA.1`, `AutomorphicSpectralTheory:AS.0`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `DeligneWeightsAndPurity:DWP.7`, `DeligneWeightsAndPurity:DWP.8`, `DeligneWeightsAndPurity:DWP.9`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.8`, `WeilConjectures:WC.2`, `mathlib:Representation`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:MonoidHom`

**Sources.**

- *Section 10.1, printed p. 1338.* “Fixons un nombre premier l different de p; on s'interesse aux espaces de cohomologie l-adique H^n_I = H^n(E^infinity_{I,F} tensor_F F-bar, Q-bar_l) (0 <= n <= 2d-2). Ce sont des Q-bar_l-espaces vectoriels de dimension finie, munis d'une Q_l-structure et d'une action (continue) du groupe de Galois Gal(F^s/F). Par ailleurs, l'action a droite de D^times(A^infinity) sur ...”
  The setting, quoted from the hash-verified Annales de l'institut Fourier PDF read in
  this session. Laumon-Rapoport-Stuhler itself could not be read; see the gaps. The
  excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.
- *Theoreme 10.1 (cf. [LRS, th. 14.9 et 14.12]), printed p. 1339.* “Seules peuvent intervenir non trivialement, dans les decompositions isotypiques des (H^n_o)^ss, des representations Pi telles que, ou bien Pi tensor 1, ou bien Pi tensor St_infinity, soit automorphe. Dans le premier cas, Pi se factorise sous la forme chi composee avec Nr, ou chi est un caractere des ideles tel que chi tensor 1 soit un caractere de Hecke de A^times. Dans le ...”
  Laumon-Rapoport-Stuhler's theorem as Hausberger states it, quoted verbatim. The
  excerpt is truncated at a word boundary; the full passage is on the printed page
  named in the locator.
- *Section 10.1, printed pp. 1338-1339.* “D'apres le theoreme de changement de base propre, H^n_o est canoniquement isomorphe a H^n en tant que Q-bar_l-representation de W_{F_o}. Comme (H^n_o)^{K_I} = H^n_{o,I} est de dimension finie, l'action de D^times(A^infinity) sur H^n_o est admissible.”
  Proper base change and admissibility, quoted verbatim.

### LRS 15.10 and Badulescu: globalising a supercuspidal with prescribed local components

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation` — *theorem* · planet **Globalisation with prescribed local components**

**Statement.**

Given pi in A^0_n(K) and a place x outside {o, o', infinity} of F, there is a CUSPIDAL
AUTOMORPHIC representation Pi-tilde = tensor Pi-tilde_v of GL_d(A) such that Pi-
tilde_infinity is the Steinberg representation, Pi-tilde_o is pi, and Pi-tilde_{o'} and
Pi-tilde_x are cuspidal. More generally, for a finite set S of places of F and
essentially square-integrable representations pi_v of GL_d(F_v) for v in S, there is a
cuspidal automorphic representation Pi-tilde of GL_d(A) with Pi-tilde_v isomorphic to
pi_v for every v in S. Here the division algebra D is the one of centre F, dimension d^2
and invariants +1/d at o, -1/d at o' and 0 elsewhere.

**Hypotheses and warnings.**

- The first statement is Laumon-Rapoport-Stuhler's Lemma 15.10, proved there by a
  SIMPLIFIED SELBERG TRACE FORMULA. That proof is in LRS, which could not be read: the
  copy obtained is a scan with no text layer
- The second statement is Badulescu's Theorem 1.11.8 as Hausberger cites it, and is the
  form this packet takes as the globalisation input
- The auxiliary places o' and x, and the choice of invariants of D, are part of the
  statement and must be carried; the roadmap says to retain the auxiliary-place
  assumptions until each is proved
- The roadmap also says explicitly that Laumon-Rapoport-Stuhler's remarks about an
  unproved GENERAL global Jacquet-Langlands correspondence cannot be used as theorems;
  this node uses only the specific transfer of the next node
- The whole adelic and automorphic apparatus - restricted products from the places of
  the curve, integral orders, the diagonal embedding, Haar measures, discreteness and
  cocompactness modulo the centre, the discrete spectral decomposition - is requested
  from FunctionFieldArithmetic and AdelicAlgebraicGroups, which AUDIT-20 names as the
  declared suppliers

**Proof outline.**

1. Fix the curve, the places o, o' and infinity, and the division algebra D with
   invariants +1/d, -1/d and 0.
2. Apply the simplified Selberg trace formula of Laumon-Rapoport-Stuhler to produce a
   cuspidal automorphic representation of GL_d(A) with the prescribed local components.
3. Or, in the form used here, apply Badulescu's globalisation with prescribed essentially
   square-integrable components at a finite set of places.

**Acceptance.**

- Check that the auxiliary places and the invariants of D are part of the statement
- Check that the local component at o is the given supercuspidal
- Check that the trace-formula input is the simplified one and not a general invariant trace formula
- Check that no general global Jacquet-Langlands correspondence is used

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology`, `FunctionFieldArithmetic:FA.6`, `FunctionFieldArithmetic:FA.2`, `AdelicAlgebraicGroups:AA.0`, `AdelicAlgebraicGroups:AA.1`, `AutomorphicSpectralTheory:AS.0`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `mathlib:Representation`, `mathlib:MonoidHom`, `mathlib:MonoidAlgebra`

**Sources.**

- *Lemme 10.2 (cf. [LRS, 15.10]), printed p. 1339.* “Donnons-nous pi in A^0_n(K) et une place x outside {o, o', infinity} de F. Il existe alors une representation automorphe parabolique Pi-tilde = tensor Pi-tilde_v de GL_d(A) telle que Pi-tilde_infinity = St_infinity, Pi-tilde_o = pi, et que Pi-tilde_{o'} et Pi-tilde_x soient cuspidales.”
  The globalisation lemma as Hausberger states it, quoted from the hash-verified PDF
  read in this session. LRS itself could not be read.
- *Before Lemme 10.2, printed p. 1339.* “Le lemme suivant, demontre dans [LRS] au moyen d'une formule des traces de Selberg simplifiee, permet de voir toute pi in A^0_n(K) comme composante en o d'une representation automorphe de GL_d(A).”
  What proves it in the source: a simplified Selberg trace formula, which is the
  roadmap's 'simple trace comparison'.
- *Theoreme 10.4 (1) (cf. [Ba1, th. 1.11.8]), printed p. 1340.* “Soit S un ensemble fini de places de F. Supposons que pour tout v in S on se donne une representation essentiellement de carre integrable pi_v de GL_d(F_v). Alors il existe une representation automorphe cuspidale Pi-tilde de GL_d(A) telle que, pour tout v in S, on ait Pi-tilde_v = pi_v.”
  Badulescu's globalisation, quoted verbatim.

### LRS 15.11 and Henniart: the inner-form transfer and the resulting isotypic computation

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer` — *theorem* · planet **Globalisation, transfer and the isotypic computation**

**Statement.**

Let Pi-tilde be as in the globalisation. Then there is a UNIQUE automorphic
representation Pi of D^times(A) such that Pi_v is isomorphic to Pi-tilde_v for every
place v outside {o, o'}; and Pi_v is the local Jacquet-Langlands transfer JL(Pi-tilde_v)
at v = o and v = o'. More generally, if D is SPLIT OUTSIDE a finite set S and Pi-tilde
is a cuspidal automorphic representation of GL_d(A) whose local component is essentially
square-integrable at every v in S and CUSPIDAL at at least one v in S, then there is a
unique automorphic Pi of D^times(A) with Pi^S isomorphic to Pi-tilde^S; it satisfies
Pi_v = Pi-tilde_v where D is split at v and Pi_v = JL(Pi-tilde_v) where D_v is ramified,
and its MULTIPLICITY m(Pi) IS 1. Consequently, for Pi obtained from a supercuspidal pi
by globalisation and transfer, the chi_{pi,o}-isotypic component of (H^n_o)^ss vanishes
except for n = d-1, where it is (H^{d-1}_o)^ss[Pi^{infinity,o}] tensor Pi_o = JL(pi)
tensor (sigma_d(pi) tensor |.|^{(1-d)/2}).

**Hypotheses and warnings.**

- The second statement is proved by the SIMPLE TRACE FORMULA OF DELIGNE-KAZHDAN, as
  Hausberger records, citing Boyer's proof of Proposition 15.4; it is NOT a general
  global Jacquet-Langlands correspondence, and the roadmap forbids treating LRS's
  remarks about one as theorems
- The hypothesis that Pi-tilde be CUSPIDAL at at least one place of S is what makes the
  transfer available; the roadmap says to retain the local-transfer assumptions until
  each is proved
- MULTIPLICITY ONE is part of the conclusion in the stated range, and the roadmap
  forbids asserting multiplicity one or arbitrary automorphic isotypic concentration for
  every division-algebra constituent
- The final computation is the bridge to ES7:equal-characteristic: it is what the
  Hochschild-Serre degeneration is applied to
- The twist |.|^{(1-d)/2} is the Hecke normalisation of the Laumon-Rapoport-Stuhler
  correspondence

**Proof outline.**

1. Transfer the globalised representation from GL_d(A) to D^times(A) by the simple trace
   formula of Deligne-Kazhdan.
2. Record uniqueness, the local shape of the transfer and multiplicity one in the stated
   range.
3. Apply the Laumon-Rapoport-Stuhler determination of the cohomology to compute the
   isotypic component of (H^n_o)^ss.

**Acceptance.**

- Check that the transfer is by a simple trace formula and is not a general global Jacquet-Langlands correspondence
- Check that the cuspidality hypothesis at a place of S is retained
- Check that multiplicity one is asserted only in the stated range
- Check that the isotypic computation is concentrated in degree d-1 and carries the twist

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/globalisation`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology`, `FunctionFieldArithmetic:FA.6`, `FunctionFieldArithmetic:FA.2`, `AdelicAlgebraicGroups:AA.0`, `AdelicAlgebraicGroups:AA.1`, `AutomorphicSpectralTheory:AS.0`, `SmoothRepresentationsOfLocalGroups:SR.0`, `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `DeligneWeightsAndPurity:DWP.7`, `EtaleDualityAndPerverseSheaves:EDC.2`, `WeilConjectures:WC.2`, `mathlib:Representation`, `mathlib:LinearMap.trace`

**Sources.**

- *Lemme 10.3 (cf. [LRS, 15.11]), printed p. 1339.* “Soit Pi-tilde comme dans le lemme precedent. Il existe alors une unique representation automorphe Pi de D^times(A) telle que, pour tout v outside {o, o'}, on ait Pi_v = Pi-tilde_v. On a Pi_v = JL(Pi-tilde_v), pour v = o et o'.”
  The transfer lemma as Hausberger states it, quoted from the hash-verified PDF read
  in this session. LRS itself could not be read.
- *Theoreme 10.4 (2) (cf. [He1, app. A.4]), printed p. 1340.* “Supposons que l'algebre a division D soit scindee en dehors de S. Donnons-nous une representation automorphe cuspidale Pi-tilde de GL_d(A) telle que Pi-tilde_v soit essentiellement de carre integrable en toute place v in S et qu'en une place v in S au moins Pi-tilde_v soit cuspidale. Alors il existe une unique representation automorphe Pi de D^times(A) telle que Pi^S = ...”
  The transfer with multiplicity one, quoted verbatim. The excerpt is truncated at a
  word boundary; the full passage is on the printed page named in the locator.
- *After Theoreme 10.4, printed p. 1340.* “Le point 2) se demontre en appliquant la formule des traces simples de Deligne-Kazhdan (voir [Bo], preuve de la prop. 15.4).”
  What proves it - a SIMPLE trace formula, not a general one.
- *Proposition 10.5, printed p. 1341.* “Soit Pi la representation automorphe de D^times(A) obtenue a partir de pi en appliquant les lemmes 10.2 et 10.3. Alors la composante Pi^{infinity,o}-isotypique de (H^n_o)^ss est nulle sauf pour n = d-1. Dans ce dernier cas, on a (H^{d-1}_o)^ss[Pi^{infinity,o}] tensor Pi_o = JL(pi) tensor (sigma_d(pi) tensor |.|^{(1-d)/2}).”
  The bridge to the local statement, quoted verbatim.

### Kaiser's erratum: an automorphic eigenspace is not self-dual, and what must be replaced

`ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/kaiser-erratum` — *comparison*

**Statement.**

The published text of Laumon-Rapoport-Stuhler must be used together with CHRISTIAN
KAISER'S AUTHOR-HOSTED ERRATUM. The point of the erratum, as the roadmap records it, is
that AN AUTOMORPHIC EIGENSPACE IS NOT SELF-DUAL unless its representation is self-dual
up to the required character twist. Concretely: the L-factor in Corollary 14.11 must be
replaced by the CONTRAGREDIENT expression, and the amended Lemma 14.14 and Proposition
14.17 must be used in the proof of Theorem 14.12; the geometric pairing pairs the
APPROPRIATE DUAL ISOTYPIC COMPONENTS, not an arbitrary component with itself. Since
Theorem 14.12 is one of the two Laumon-Rapoport-Stuhler theorems this layer's global-
cohomology node rests on, every consumer of that node inherits the correction.

**Hypotheses and warnings.**

- THE ERRATUM ITSELF WAS NOT READ. The file was obtained from the author-hosted location
  recorded in the source list and its SHA-256 is recorded there, but it is a TWO-PAGE
  SCAN WITH NO TEXT LAYER, and no optical character recognition was available in this
  session. The statement above is taken from the roadmap's own text, not from the
  erratum
- Laumon-Rapoport-Stuhler itself was likewise not read; the copy obtained is a 124-page
  scan with no text layer
- Theorem 14.12 is quoted in this packet only through Hausberger's Theoreme 10.1, which
  states its conclusion and not its proof; whether Hausberger's restatement already
  incorporates the correction was NOT determined
- The correction concerns duality of isotypic components under a geometric pairing, so
  it interacts with the duality conventions of ES6:duality and with the purity and
  Poincare-duality inputs requested from DeligneWeightsAndPurity and
  EtaleDualityAndPerverseSheaves

**Proof outline.**

1. Record that the published Corollary 14.11's L-factor is to be replaced by the
   contragredient expression.
2. Record that the amended Lemma 14.14 and Proposition 14.17 are the ones to be used in
   Theorem 14.12.
3. Record that the geometric pairing pairs dual isotypic components, and check every use
   of Theorem 14.12 against that.
4. Determine, by reading the erratum, whether Hausberger's restatement already
   incorporates it.

**Acceptance.**

- Check that every use of Theorem 14.12 in this packet is compatible with the corrected pairing
- Check that no statement here assumes an automorphic eigenspace is self-dual
- Check whether Hausberger's Theoreme 10.1 already incorporates the correction

**Prerequisites.** `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/global-cohomology`, `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic/jacquet-langlands-transfer`, `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.8`, `DeligneWeightsAndPurity:DWP.7`, `DeligneWeightsAndPurity:DWP.8`, `DeligneWeightsAndPurity:DWP.9`, `WeilConjectures:WC.2`, `SmoothRepresentationsOfLocalGroups:SR.0`, `mathlib:Representation`

**Sources.**

- *Theoreme 10.1 (cf. [LRS, th. 14.9 et 14.12]), printed p. 1339.* “Seules peuvent intervenir non trivialement, dans les decompositions isotypiques des (H^n_o)^ss, des representations Pi telles que, ou bien Pi tensor 1, ou bien Pi tensor St_infinity, soit automorphe.”
  The only access this packet has to Theorem 14.12: Hausberger's restatement of its
  conclusion. The erratum applies to the proof of that theorem, and neither the
  theorem's proof nor the erratum could be read here.

**What remains in this layer.**

- This layer is, by AUDIT-20's own duplicate records, largely a restatement for a
  division algebra of what FunctionFieldArithmetic:FA.6 and FA.2 and
  AdelicAlgebraicGroups:AA.0 and AA.1 own: restricted products of local completions,
  compatible Haar measures, the adelic quotient, central characters and the finiteness
  of cuspidal spaces. Those are REQUESTED here and not planned, and a restructuring
  proposal is filed.
- Laumon-Rapoport-Stuhler's Sections 13 and 15 - the Euler-Poincare and weakly cuspidal
  local functions, their orbital and character identities, and the simplified Selberg
  trace formula - were NOT read, because LRS could not be read at all. This packet plans
  their CONCLUSIONS as Hausberger states them and plans none of their proofs.
- KAISER'S ERRATUM WAS NOT READ EITHER: the author-hosted file was obtained and hashed
  but is a two-page scan with no text layer. Its content is recorded from the roadmap's
  own description, and whether Hausberger's restatement of Theorem 14.12 already
  incorporates it was not determined.
- The roadmap forbids using Laumon-Rapoport-Stuhler's remarks about an unproved general
  global Jacquet-Langlands correspondence as theorems, and forbids asserting
  multiplicity one for every division-algebra constituent. This packet uses only the
  specific transfer with its cuspidality hypothesis, and states multiplicity one only in
  the range Hausberger states it.
- The roadmap also warns against treating the source's unpublished invariant ample class
  argument as available; nothing read here uses it, and nothing in this packet does.

## Baseline: what the pinned libraries already have

Mathlib `082e2d3`, Tau Ceti `f790474`. The reviewed audit **AUDIT-20** (reviewed as
`REV-AUDIT-20`, 17 September 2026, 240 targets checked, 89 corrections) covers every
layer of this roadmap and returns **not built** for each. Two of its targets are
recorded as *partial*, and both are cited below rather than planned: `ES0`'s algebra
of natural endomorphisms of the identity, which is Mathlib's `CategoryTheory.CatCenter`,
and `ES3`'s coefficient hypothesis, which the pinned root pairings can state. Every
declaration below was read at the pins before being cited.

| Declaration | Module | Why it is baseline |
| --- | --- | --- |
| `mathlib:Representation` | `Mathlib/RepresentationTheory/Basic.lean` | Representations of a group on a module. The smooth representations of GL_n(E), of D^times and of the Weil group, the Satake input V of an excursion datum, and the three commuting actions on the fundamental local representation are all this notion. |
| `mathlib:MonoidHom` | `Mathlib/Algebra/Group/Hom/Defs.lean` | Group homomorphisms. An L-parameter is a continuous 1-cocycle, the degree map \|.\| : W_E -> Z is one, and the twisted Levi cocycle map is defined on them. |
| `mathlib:RootPairing` | `Mathlib/LinearAlgebra/RootSystem/Defs.lean` | Root pairings. 2rho_{G-hat}, 2rho_{G-hat_b} and their difference, the dominant weight N mu, the Levi structure of G-hat_b inside G-hat and <2rho,mu> are all root-datum data; the dual group itself is GeometricSatakeAndFusion:GS4's and ReductiveGroupsPartII:RG2.5's. |
| `mathlib:Subgroup` | `Mathlib/Algebra/Group/Subgroup/Defs.lean` | Subgroups. The parabolic P and its Levi M, the compact open K used for the Bernstein centre, the congruence subgroups of PGL_d(F_o) appearing in the uniformisation, and the stabiliser of a connected component of the Weil restriction of the Drinfeld coverings are subgroups. |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` | Monoid algebras. The level Hecke algebras Lambda[K \ G_b(E) / K] whose centres exhaust the classical Bernstein centre and whose l-adic separatedness licenses the reduction to torsion coefficients. |
| `mathlib:Module.End` | `Mathlib/Algebra/Module/LinearMap/End.lean` | Endomorphism rings. End(Ind pi) and End(pi) are the corners of the parabolic-induction square. |
| `mathlib:CommRing` | `Mathlib/Algebra/Ring/Defs.lean` | Commutative rings. The spectral centre, the excursion algebra and the classical Bernstein centres are commutative rings; so are the coordinate rings of the moduli. |
| `mathlib:CategoryTheory.Adjunction` | `Mathlib/CategoryTheory/Adjunction/Basic.lean` | Adjunctions. The embedding of a stratum's category is the left adjoint to i_b^*, and the unit and counit of an excursion datum are adjunction data. |
| `mathlib:CategoryTheory.MonoidalCategory` | `Mathlib/CategoryTheory/Monoidal/Category.lean` | Monoidal categories. The Satake category and the composite of two Hecke operators in the GL_n computation live here. |
| `mathlib:CategoryTheory.Functor` | `Mathlib/CategoryTheory/Functor/Basic.lean` | Functors. The moduli problem of D-elliptic sheaves is a functor, and its representability is the statement that it is representable. |
| `mathlib:CategoryTheory.Preadditive` | `Mathlib/CategoryTheory/Preadditive/Basic.lean` | Preadditive categories. The Ext groups of smooth GL_d(F_o)-modules that form the E_2-page of the Hochschild-Serre spectral sequence are computed in an abelian category of this kind. |
| `mathlib:DirectSum` | `Mathlib/Algebra/DirectSum/Basic.lean` | Direct sums. The isotypic decompositions of the global cohomology, and the decomposition of the Weil restriction of the Drinfeld coverings into copies indexed by Z, are stated in these terms. |
| `mathlib:LinearMap.trace` | `Mathlib/LinearAlgebra/Trace.lean` | Traces. The two-leg excursion datum computes the trace of the Weil-group representation, which is the whole mechanism of the GL_n comparison; and the simple trace formulae behind the globalisation are trace identities. |
| `mathlib:Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | Free modules. The E_i of a D-elliptic sheaf are locally free of rank d^2, and the pole and zero quotients are locally free of rank d. |
| `mathlib:Module.Projective` | `Mathlib/LinearAlgebra/Projective.lean` | Projective modules. The projectivity of the smooth representations of a compact group used in the degeneration argument, and the local freeness conditions in the moduli problem, are of this kind. |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | Schemes. The curve X, the moduli E^infinity_{X,D,I}, the auxiliary Vect and Hecke schemes and the formal schemes of the uniformisation are all schemes or formal schemes over them. |
| `mathlib:Condensed` | `Mathlib/Condensed/Basic.lean` | Condensed objects. The continuity of the Weil-group actions, and the condensed Schur condition that ES5's parameter assignment rests on, are stated in condensed terms. |
| `mathlib:MeasureTheory.Measure.modularCharacter` | `Mathlib/MeasureTheory/Group/ModularCharacter.lean` | THE MODULAR CHARACTER of a locally compact group, at the pins, with map_right_mul_eq_modularCharacterFun_smul. AUDIT-20 records this as the closest available notion to the modulus delta_P of a parabolic: delta of a GROUP is available in general, delta_P of a parabolic and normalised smooth induction are not. The normalised-induction dictionary of ES7:parabolic is stated against it. |
| `tauceti:TauCeti.Cocharacter.parabolic` | `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean` | The DYNAMIC PARABOLIC subgroup attached to a cocharacter, at the pins. The proof of IX.7.2 picks a cocharacter mu with dynamical parabolic P, and the proof of IX.7.3 does the same; this is the pinned form of that construction. AUDIT-20 records it as available. |
| `tauceti:TauCeti.Cocharacter.levi` | `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean` | The Levi subgroup of a dynamic parabolic, at the pins, with the Levi decomposition. The Levi M of P, through which the constant term is computed, is this notion. |
| `tauceti:TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/SmoothDiscrete.lean` | Smooth discrete actions. The smooth representations of G_b(E), of GL_d(F_o) and of D^times to which the Bernstein centres and the isotypic decompositions refer are of this kind at the pins. |
| `tauceti:Representation.nonempty_equiv_of_character_eq` | `TauCeti/RepresentationTheory/CharacterTable/Determined.lean` | SEMISIMPLE TRACE DETERMINATION, at the pins, for FINITE groups in characteristic zero: equal characters give isomorphic representations. AUDIT-20 records this as the closest available statement to the one the GL_n comparison needs, which is for CONTINUOUS WEIL-GROUP representations and is absent. Citing it fixes the boundary precisely. |

Confirmed **absent** at both pins by AUDIT-20 and by direct search, and therefore not
cited: the Bernstein centre of a locally profinite group, the Weil group of a local
field as a topological group, the Langlands dual group, stable infinity-categories and
their Ind-completions, perfect complexes on a stack, animated rings and animated groups,
anima, derived mapping stacks, good filtrations and Donkin's theorem, and the Bernstein
decomposition. Everything this packet needs from those notions is requested from another
roadmap rather than cited as baseline.

## Gaps

Twelve. The first two are the standing caveats on this packet; the rest each carry a
next source action.

### 1. Laumon-Rapoport-Stuhler could not be read: the only copy obtained is a scan without a text layer

Two of the five layers in scope name Laumon-Rapoport-Stuhler, D-elliptic sheaves and the
Langlands correspondence, Inventiones Mathematicae 113 (1993), 217-338, as their primary
source. A 124-page PDF was downloaded in this session from the Goettingen digitisation
centre at https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0113/LOG_0019.pdf,
SHA-256 05ea7ab8cb64577f5d421f37255a7cfd58b6fc763294038cd2e87475d80ab87e, 9926138 bytes.
It is a SCAN: every page is a single CCITTFaxDecode image, there is no text layer, and
no optical character recognition tool was available in this session, so not one word of
it was read and even its identity could not be confirmed beyond the page count matching
338-217+1 = 122 plus two cover pages and the journal being Inventiones Mathematicae.
EVERYTHING this packet attributes to Laumon-Rapoport-Stuhler - the definition of a
D-elliptic sheaf, the representability and smoothness of the moduli, Theorems 14.9 and
14.12 on the cohomology, and Lemmas 15.10 and 15.11 on globalisation and transfer -
comes through HAUSBERGER'S RESTATEMENTS, which were read in full and are cited as such.
Every affected node says so in its sources. NEXT SOURCE ACTION: obtain a text-bearing
copy of Laumon-Rapoport-Stuhler, or run optical character recognition on the scan, and
check each restatement against the original; in particular read Sections 4 to 6, 13, 14
and 15.

### 2. Kaiser's erratum could not be read either

Christian Kaiser's erratum to Laumon-Rapoport-Stuhler, which the roadmap says must be
used with the published text, was located on Michael Rapoport's own page and downloaded
in this session from https://www.math.uni-
bonn.de/people/rapoport/myalggeom/preprints/ErratumvonChrKaiser.pdf, SHA-256
6aa9e01d3551e3f0e3d8ca3d98acba98a1e163e723d342f9ccd719ae4dc02c54, 1294218 bytes, two
pages. It too is a SCAN with no text layer and was not read. The node ES7:function-
field-automorphic/kaiser-erratum therefore states the correction as the ROADMAP
DESCRIBES IT - the L-factor in Corollary 14.11 replaced by the contragredient
expression, the amended Lemma 14.14 and Proposition 14.17 used in Theorem 14.12, and the
geometric pairing pairing dual isotypic components rather than a component with itself -
and attributes it to the roadmap rather than to the erratum. Whether Hausberger's
Theoreme 10.1, which is this packet's only access to Theorem 14.12, already incorporates
the correction was NOT determined. NEXT SOURCE ACTION: read the two pages of the erratum
and record its statements verbatim.

### 3. The dictionary between unnormalised and normalised parabolic induction has no locator

ES7:parabolic's stage text requires: 'Then prove the dictionary with the local-group
owner's normalized induction (SR.1-SR.2): the square-root modulus and cyclotomic twist
must cancel in precisely the stated convention. Do not silently call the source formula
normalized induction or omit the twist.' Fargues-Scholze state Corollary IX.7.3 for
UNNORMALISED induction, produce the explicit twist (d/2)[d] with d = <2rho,mu> in the
proof, and separately give the Levi inclusion's factor (2rho_{G-hat} -
2rho_{G-hat_b})(sqrt q)^{|w|}. Nowhere do they state that the two cancel against
delta_P^{1/2}. The node ES7:parabolic/normalised-induction-dictionary records the two
places the twist appears and does NOT manufacture a locator for the cancellation.
AUDIT-20 records that the modulus character of a GROUP is at the pins as
MeasureTheory.Measure.modularCharacter but that delta_P of a parabolic and normalised
smooth induction are not, so the statement cannot even be formulated against the
libraries yet. NEXT SOURCE ACTION: none in Fargues-Scholze; the statement has to be
formulated against SmoothRepresentationsOfLocalGroups:SR.1 and SR.2 and proved.

### 4. Kaletha's Section 5, on which the quasisplit reduction rests, was not read

The proof of Theorem IX.7.2 reduces to a quasisplit group by choosing a z-embedding G ->
G' with torus quotient and connected centre, and uses the surjectivity of Z'(E) -> D(E)
quoted as [Kal18, Fact 5.5]. Neither the construction nor the fact was read in this
session. The roadmap makes these lemmas an obligation of ES6:functoriality, where the
companion part of this roadmap plans them as a node and records the same gap. NEXT
SOURCE ACTION: read Kaletha's Section 5 and Fact 5.5.

### 5. The constant-term functor and Proposition VI.12.1 are quoted and were not read

The heart of the proof of Theorem IX.7.2 is the identification of R g_! S_V with the
constant term CT_P(S_V) and of that, up to the shift [deg_P], with the restriction of
S_V along the dual Levi with a cyclotomic twist. The constant-term functor and its
Satake compatibility live in Chapter VI and were NOT read here; they belong to
GeometricSatakeAndFusion. The same holds for Proposition VI.12.1, which the duality
statements of the companion part use. NEXT SOURCE ACTION: read FS VI.11 and VI.12.

### 6. Gross-Iancu Theorem 4.26, cited in a footnote to the parabolic-induction computation, was not read

The proof of Corollary IX.7.3 carries a footnote: 'See [GI16, Theorem 4.26] for more
details on the analysis of Hodge-Newton reducible local Shimura varieties.' That
reference was not read. The main computation - that the moduli of modifications of the
trivial torsor of type bounded by mu isomorphic to E_b is G(E)/P(E), all of type exactly
mu - is stated in the text and is planned here; the footnote supplies more detail on the
geometry behind it. NEXT SOURCE ACTION: read Gross-Iancu Theorem 4.26.

### 7. Hausberger's Berkovich appendix, which supports the spectral sequence, was not read

Hausberger's appendix gives a brief exposition of the l-adic cohomology theory of
Berkovich analytic spaces, proves a smoothness theorem for the action on properly
supported cohomology due to Berkovich, and establishes several results used in
constructing the Hochschild-Serre spectral sequence. It was not read in this session;
the spectral sequence itself, Proposition 10.6 and Corollary 10.7, was. So the node
ES7:equal-characteristic/hochschild-serre-and-degeneration rests on a construction whose
analytic foundations this packet has not checked. NEXT SOURCE ACTION: read Hausberger's
appendix, printed pages 1357 onwards.

### 8. Drinfeld's theorem on the deformation functor is quoted by Hausberger and was not read

Theorems 7.2 and 7.4, the representability of the deformation functor of special formal
O_D-modules by Omega-hat^d tensor-hat_O O-hat^nr, are Drinfeld's; Hausberger says
explicitly that he will say nothing of the proof, which is a keystone of the edifice,
and refers to Drinfeld, Boutot-Carayol and Genestier. None was read. He also notes the
particular nature of Genestier's proof, valid only in equal characteristic, which uses
the theory of the module of coordinates of formal O_D-modules - the same theory
Hausberger uses to relate Dieudonne modules and divisible modules. NEXT SOURCE ACTION:
read Boutot-Carayol, or Genestier for the equal-characteristic proof.

### 9. The transport of the equal-characteristic realisation to HS3 is asked for and is not planned

ES7:equal-characteristic's stage text ends: 'Transport this realization to HS3 and
repeat ES7:GLn-comparison's trace argument.' This packet plans the realisation - the
uniformisation, the spectral sequence, the degeneration and the Drinfeld-Carayol theorem
- but writes no node for the transport, because the Hecke comparison it needs is
HeckeStacksAndLocalShtukas:HS3's and the atlas records ES7:equal-characteristic as
REQUIRING HS3 rather than supplying it. Repeating the trace argument would then be a
second copy of ES7:GLn-comparison's nodes with a different input, which PROTOCOL.md
section 15 forbids. The right shape is probably a single trace-argument node
parameterised by the realisation, and that is filed as a structural proposal. NEXT
SOURCE ACTION: none in the sources; this is a structural question.

### 10. Semisimple trace determination for Weil-group representations does not exist at the pins

The GL_n comparison determines the parameter from the trace: the two-leg excursion
operators 'determine the trace of the representation (and thus the semisimplified
representation)'. AUDIT-20 records that the pinned libraries have this implication only
for FINITE groups in characteristic zero - Tau Ceti's
Representation.nonempty_equiv_of_character_eq and its irreducible variant - while
Mathlib has only the converse, that isomorphic representations have equal characters.
Nothing covers continuous representations of the Weil group. That declaration is cited
in the packet so that the boundary is exact, and the missing statement is recorded here.
NEXT SOURCE ACTION: none in these sources; it is a library gap for the representation-
theory roadmaps.

### 11. The Carayol-Harris conjecture on the non-supercuspidal cohomology is not planned

Hausberger's Conjecture 9.6, due to Carayol for b = 0 and to Harris outside the middle
degree, describes U^{d-1+b}_d(chi) for 0 <= b <= d-1 in terms of generalised Steinberg
representations and the representations S_{b,s}(pi). It is a CONJECTURE and is
deliberately not planned; the main theorem of this layer concerns the supercuspidal part
of the middle degree only. Recorded so that a reader does not take the layer to cover
the whole cohomology.

## Requests to other roadmaps

| Supplier | What is needed |
| --- | --- |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.6` | The classical local Langlands correspondence for GL_n over a p-adic field, and the local Jacquet-Langlands correspondence with the division algebra of invariant 1/n. FS Theorem IX.7.4 compares its own parameter with this one and proves nothing about it; AUDIT-20 records ET.6 as the owner and records that neither correspondence exists in either pinned library. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.6a` | The TWO-TOWER COHOMOLOGICAL REALISATION: the computation of the pi- and rho-isotypic parts of the cohomology of the Lubin-Tate and Drinfeld towers over a p-adic field. This is the single external input of the whole of Fargues-Scholze, and AUDIT-20 records ET.6a as its owner. |
| `HeckeStacksAndLocalShtukas:HS2` | The Hecke correspondences with minuscule bounds and the identification of their fibres with moduli of local shtukas; and the local-shtuka side of the equal-characteristic story, the special formal O_D-modules and the Drinfeld coverings. |
| `HeckeStacksAndLocalShtukas:HS3` | The translation between Hecke operators and moduli of local shtukas, including Theorem IX.3.1 on the cohomology of local Shimura varieties. Both the p-adic and the equal-characteristic routes of this part pass through it, and the roadmap asks that the equal-characteristic realisation be transported to it. |
| `HeckeStacksAndLocalShtukas:HS4` | The Hecke functors given coCartesianly in the finite set, which the excursion operators of the two-leg computation are built from, and the fusion compatibility. |
| `GeometricSatakeAndFusion:GS4:integral-dual-group` | The dual group with its Q-action, the half-sum of positive coroots 2rho as a cocharacter of it, the CONSTANT-TERM functor CT_P and its comparison with restriction along the dual Levi, and the compatibility of geometric Satake with the Levi inclusion including the cyclotomic twist. The constant-term computation in the proof of Theorem IX.7.2 is a statement about these. |
| `ReductiveGroupsPartII:RG2.5` | The integral pinned dual group and the L-group with its Levi inclusions; the twisted Levi cocycle inclusion of this part is a statement about those inclusions and the coefficient choice sqrt q. |
| `BunGAndNewtonStrata:BG0` | B(G), the strata Bun^b_G, the sigma-centralisers G_b and their description as centralisers of the slope morphism, on which the Levi structure of G-hat_b rests. |
| `BunGAndNewtonStrata:BG1` | The Newton and Kottwitz invariants, the partial order and the behaviour of b under twisting by a cocharacter, which the sequence b_N = b mu(pi)^N uses. |
| `BunGAndNewtonStrata:BG2` | Bun_G as an Artin v-stack and the fibre-product description Bun_G = Bun_{G'} x_{Bun_D} {*} for a z-embedding. |
| `BunGAndNewtonStrata:BG3` | Corollary III.4.3, the identification Bun_G = Bun_{G_b} for basic b, AND ITS HECKE-EQUIVARIANCE. The basic case of Theorem IX.7.2 is exactly this statement, and the equivariance is what makes it a statement about excursion operators. |
| `BunGAndNewtonStrata:BG4` | The Harder-Narasimhan stratification and the CANONICAL PARABOLIC of an element of B(G), together with the semistability theory that makes bounded self-modifications of E_{b_N} preserve it for N large. AUDIT-20 records that there is no Harder-Narasimhan theory in either pinned library. |
| `VStackSheavesAndLisseCategories:VS1` | The universal local acyclicity formalism and the properness and smoothness statements for the Hecke correspondences used in the constant-term computation. |
| `VStackSheavesAndLisseCategories:VS4` | The identification D(G_b(E),Lambda) = D_lis(Bun^b_G,Lambda) and the fully faithful stratum embeddings, without which Psi^b_G has no definition. |
| `SmoothRepresentationsOfLocalGroups:SR.0` | Smooth representations of a locally profinite group and their Bernstein centre, the target of Psi_G and Psi^b_G. |
| `SmoothRepresentationsOfLocalGroups:SR.1` | The normalisation conventions: the modulus character delta_P of a parabolic, normalised smooth induction, and the fixed geometric-Frobenius normalisation of the degree map. The dictionary of ES7:parabolic cannot be stated without them, and AUDIT-20 records that delta_P and normalised induction are absent from both libraries. |
| `SmoothRepresentationsOfLocalGroups:SR.2` | Unnormalised and normalised parabolic induction and their comparison, and the classification of irreducible smooth representations of GL_n(E) by segments, by which the GL_n comparison reduces to the supercuspidal case. |
| `SmoothRepresentationsOfLocalGroups:SR.3` | The classical Bernstein decomposition and the supercuspidal support, used both in the Bernstein-centre statements and in the degeneration argument, where Harish-Chandra's theorem for a supercuspidal representation is what kills the higher Ext groups. |
| `ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic` | Within this roadmap: the characteristic-p global automorphic inputs, which ES7:equal-characteristic consumes. |
| `FunctionFieldArithmetic:FA.6` | The adelic quotient G(K)\G(A_K) over a function field, Haar-compatible level structures, central characters and the finiteness of cuspidal spaces. AUDIT-20 names FA.6 as the DECLARED SUPPLIER of what ES7:function-field-automorphic restates for a division algebra, so by PROTOCOL.md section 15 it is imported here and not planned. |
| `FunctionFieldArithmetic:FA.2` | The restricted product of local completions of a function field, Haar measures on it, and the compactness of the degree-zero idele class group. AUDIT-20 names FA.2 as the owner. |
| `AdelicAlgebraicGroups:AA.0` | Restricted products of locally compact groups with compatible normalised Haar measures, and the distinction from Tamagawa measures. AUDIT-20 names AA.0 as the owner of the first two constructions this layer's stage text lists. |
| `AdelicAlgebraicGroups:AA.1` | Adelic points of an algebraic group over a global field as a restricted product, including the D^times case, with the diagonal embedding. AUDIT-20 names AA.1 as the owner. |
| `AutomorphicSpectralTheory:AS.0` | The abstract functional analysis behind a discrete spectral decomposition: the decomposition of an L^2-space under a unitary representation with finite multiplicities, in the form the division-algebra quotient needs. The roadmap is explicit that the number-field automorphic theorems of AF.2-3 and AS.6 must NOT be used here. |
| `DeligneWeightsAndPurity:DWP.7` | Purity for the cohomology of a smooth proper variety over a finite field, in the form the weight arguments of Laumon-Rapoport-Stuhler need. |
| `DeligneWeightsAndPurity:DWP.8` | Weight-monodromy and the behaviour of weights under the operations used on the cohomology of the moduli. |
| `DeligneWeightsAndPurity:DWP.9` | Functional equations and the compatibility of L-factors with duality, which the corrected dual isotypic pairing of Kaiser's erratum is about. |
| `EtaleDualityAndPerverseSheaves:EDC.2` | Poincare duality and cycle classes for the l-adic cohomology of the moduli, and the compactly supported cohomology of the Berkovich analytic spaces appearing in the uniformisation. |
| `EtaleDualityAndPerverseSheaves:EDC.8` | Perverse sheaves and the finiteness results for compactly supported cohomology used in the spectral-sequence argument. |
| `WeilConjectures:WC.2` | The Weil conjectures in the form used for the purity and the eigenvalue arguments in the cohomology of the Laumon-Rapoport-Stuhler varieties. |
| `ArithmeticGaloisDuality:R02.2` | The CONTINUOUS HOCHSCHILD-SERRE construction in general. The roadmap asks that the general construction be imported from ArithmeticGaloisDuality:R02.2 and that only its application to this geometric quotient be proved here, which is what this packet plans. |
| `DrinfeldModulesAndTModules:DM.7` | Drinfeld's elliptic sheaves and their moduli. AUDIT-20 records DM.7 as a duplicate of ES7:equal-characteristic's first target, being the case D = M_d(F) of the D-elliptic sheaves defined here; by PROTOCOL.md section 15 the shared construction should be planned once. |
| `LanglandsParameterStacks:LP2:semisimple-characters` | The geometric character theorem, FS Proposition VIII.3.8, which ES5's parameter assignment rests on and which every statement of this part inherits. |
| `LanglandsParameterStacks:LP2:excursion-presentation` | The excursion algebra with its presentation, which is the source of the excursion-algebra variants of the stratum maps. |
| `LanglandsParameterStacks:LP0` | The Weil group W_E with its inertia and the degree map \|.\| : W_E -> W_E/I_E = Z, normalised by sending a GEOMETRIC Frobenius to 1, and the scheme Z^1(W_E,G-hat) of continuous 1-cocycles on which the twisted Levi inclusion acts. The whole formula (2rho_{G-hat} - 2rho_{G-hat_b})(sqrt q)^{\|w\|} is a statement about that degree map, and neither pinned library has a Weil group. |
| `VStackSheavesAndLisseCategories:VS3` | The Ind-category of D_lis(Bun_G,Lambda) and its compact objects, and the relation between D_lis and D_et that the coefficient reduction of Theorem IX.7.2's proof is designed to circumvent. |

## Structural findings

### 1. ES7:function-field-automorphic restates for a division algebra what FunctionFieldArithmetic and AdelicAlgebraicGroups already own

*Kind: `duplicate-layer`.*

The reviewed audit AUDIT-20 records FOUR duplicate relations for this layer, more than
for any other layer of this roadmap: FunctionFieldArithmetic:FA.6 is named the DECLARED
SUPPLIER, constructing the adelic quotient, Haar-compatible level structures, central
characters and the finiteness of cuspidal spaces; FA.2 owns the restricted product of
local completions, the Haar measures and the compactness of the degree-zero idele class
group; AdelicAlgebraicGroups:AA.1 owns adelic points of an algebraic group over a global
field as a restricted product, INCLUDING THE D-TIMES CASE; and AA.0 owns restricted
products of locally compact groups with compatible normalised Haar measures, which are
the first two constructions the stage text lists. The stage text nevertheless opens by
asking this layer to 'define restricted products from curve places, integral orders, the
diagonal embedding, degree/central quotients and compatible Haar measures' - all four of
those duplicates - before it reaches anything specific to Laumon-Rapoport-Stuhler.
PROTOCOL.md section 15 says a construction two layers share is planned once, by the
owner. This packet accordingly plans NONE of that infrastructure and files it as four
requests, and plans only what is genuinely this layer's: the determination of which
automorphic representations occur in the cohomology of the moduli, the globalisation
with prescribed supercuspidal places, the inner-form transfer by a simple trace formula,
and the isotypic computation. A restructuring job should narrow the stage text to match,
so that a reader is not told to build the adeles twice.

### 2. The trace argument of ES7:GLn-comparison would have to be written twice, and should be written once

*Kind: `shared-node`.*

ES7:equal-characteristic's text ends 'Transport this realization to HS3 and repeat
ES7:GLn-comparison's trace argument.' Read literally that asks for a second copy of the
three nodes of ES7:GLn-comparison - the two-tower realisation, the two-leg trace
computation and the supercuspidal agreement - with the equal-characteristic realisation
in place of the p-adic one. PROTOCOL.md section 15 forbids planning the same thing
twice. What the mathematics actually has is ONE argument with TWO inputs: given a
realisation of the classical correspondence in the cohomology of the two towers over E,
the two-leg excursion operator computes the trace and ES5's uniqueness gives phi_pi =
rho_pi^ss. The input is p-adic in one case and equal-characteristic in the other. The
right shape is a single trace-argument node in ES7:GLn-comparison, stated for an
abstract realisation, together with two nodes supplying the realisation - one importing
ET.6a, one exporting from ES7:equal-characteristic. This packet has written the argument
once, in ES7:GLn-comparison, and recorded in ES7:equal-characteristic that the transport
is not planned. A restructuring job should settle where the abstract statement lives.

### 3. D-elliptic sheaves and Drinfeld's elliptic sheaves are the same construction at different D

*Kind: `duplicate-layer`.*

AUDIT-20 records DrinfeldModulesAndTModules:DM.7 as a duplicate of this layer's first
target, with the note that DM.7's elliptic sheaves are the D = matrix algebra case of
the D-elliptic sheaves ES7:equal-characteristic constructs. That is exactly right:
Laumon-Rapoport-Stuhler's definition, as Hausberger restates it, specialises to
Drinfeld's when D = M_d(F). The moduli, the level structures and the Hecke
correspondences specialise likewise. The packet plans the general definition here,
because the equal-characteristic realisation needs the division-algebra case and nothing
else supplies it, and files a request to DM.7. A restructuring job should decide whether
DM.7 should own the general definition with ES7:equal-characteristic importing it, or
whether DM.7's should be narrowed to the special case with a pointer. The second seems
better: the D-elliptic case is where the local Langlands correspondence comes from, and
it needs the maximal orders, the ramification locus R and the constraint that the zero
avoid it, none of which the Drinfeld case has.

