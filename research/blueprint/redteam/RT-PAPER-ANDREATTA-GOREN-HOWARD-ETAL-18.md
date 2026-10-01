# RT-PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18

Red team of the accepted extraction PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18: Fabrizio Andreatta, Eyal Z. Goren, Benjamin
Howard and Keerthi Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*, Annals of
Mathematics 187 (2018), 391–531. Issue #4102.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`codex-a71f92`, PR #2034; `cc-442dc5`, PR #2116);
- its review (`cc-39fac3`, PR #2480).

**Disclosures.** Some findings cite, as existing owners or records, papers on which this session worked. They carry
coordinator notes; no finding rests on my verdicts.
- /4, /21, /22, /31, /32 and /59: PAPER-YUAN-ZHANG-18, whose red team I verified (#5466).
- /6, /21, /22 and /31: PAPER-TSIMERMAN-18, whose red team I verified (#4912).
- /30, /33, /35 and /49: PAPER-SHANKAR-SHANKAR-TANG-ETAL-22, whose red team I verified (#5417).
- /35: PAPER-YUAN-26, which I red-teamed (#5331).
- /27: PAPER-BURUNGALE-KOBAYASHI-OTA-21, whose red-team fixes I applied (#5153).

**Result: 59 findings, 4 high, 34 medium and 21 low.**

## Method

**The source.** The published version (<https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf>)
was re-downloaded on 2026-10-01; its SHA-256 (`e1274468…40c6bb`) equals the extraction’s. It has 141 pages, with printed
page = PDF page + 390.

**The passes.** Five parallel passes were run by this session.
- Four read every page: §§1–3, §§4–5, §§6–7, and §§8–9 with the references. Page images were rendered for the formulas
  that matter.
- One checked the eleven routes, the briefs, the planned statuses and duplication against the atlas stages, other
  accepted extractions, earlier red teams, `make_queue.py` and the pinned libraries (Mathlib 082e2d3, Tau Ceti f790474).

**Route numbers.** The findings count this extraction’s routes from 1: routes 1–7 are source routes, 8 is the Lubin–Tate
Part II, 9 the orthogonal Part II, 10 the GSpin Part II and 11 the CM Part II.

**Merging.** Findings reported by two or more passes were merged, among them the cycle of the three Part IIs (three
passes), completed-l and the quadratic Hecke L-function (four findings), and rev-adic-order-of-a-special and the
arithmetic divisors on stacks (three each).

**What I re-verified myself.** Every high finding, at its evidence:
- the dependsOn edges between routes 9, 10 and 11, and the three briefs’ import lists;
- the edges dr-descent → polarized-cm-family → ell-system and betti-system, and cm-integral-dr → dr-descent;
- GZ.6’s stage text, PAPER-YUAN-ZHANG-18/whittaker and /mixed-kernel (planned at GZ.6), and the statuses of the route 10
  Eisenstein and Whittaker items;
- Corollary 5.4.6(3) (p. 464) against its proof (p. 465), and the arithmetic of the counterexample.

The full list of what was checked is in the result’s `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.result.json items /dr-descent and /ell-system
(route 4, AutomorphicBundles source) with /polarized-cm-family (route 11,
ComplexMultiplicationAndExplicitReciprocityPartII);
research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.result.json route 4 (AutomorphicBundles B0–B2) items
dr-descent and ell-system, with route 11 item polarized-cm-family

**Claim.** Stage cycle across routes. dr-descent is planned at AutomorphicBundles:B1/B2 but dependsOn
polarized-cm-family (a missing item routed to ComplexMultiplicationAndExplicitReciprocityPartII), which in turn
dependsOn ell-system (planned at AutomorphicBundles:B2) and torus-integral; in the atlas B2 depends on B1, so B1 -> CM
Part II -> B2 -> B1. Route 11's brief also imports 'canonical realization tensors (AutomorphicBundles B1-B2)', so the
two roadmaps import each other. Separately, ell-system's corrected statement is about lisse sheaves on the integral
Y_K[1/l] built from the finite etaleness in the proof of Prop. 3.2.1 (torus-integral, CM Part II); B2 only plans local
systems on the canonical model, so 'planned' is the wrong status for it (the item's own review note says that part is
missing, but the status was left planned). Also: The source route makes AGHMP a source for AutomorphicBundles:B1/B2 with
dr-descent, which dependsOn polarized-cm-family (route 11, CM Part II). Meanwhile eight CM Part II items depend on
route-4 items: polarized-cm-family on betti-system and ell-system, and cm-local-crystal, cm-integral-dr, -generic,
-crys, -tensors and cm-hecke on dr-descent. Following the paper's proof in B1/B2 would therefore make AutomorphicBundles
import the CM Part II that imports AutomorphicBundles. ell-system also depends, without saying so, on the integral model
and finite étaleness of torus-integral (CM Part II). Proposition 3.5.1 needs only the generic abelian scheme A_{H,Q}
(canonical models, Siegel map), not the integral extension of Proposition 3.4.1.

**Evidence.** dr-descent: planned [AutomorphicBundles:B1, AutomorphicBundles:B2], dependsOn [betti-system,
polarized-cm-family]; polarized-cm-family: dependsOn [torus-integral, betti-system, ell-system]; ell-system note:
'AutomorphicBundles:B2 covers at most the generic-fibre local system. The extension over Y_K[1/l] rests on
torus-integral and is not planned there, so that part is missing.' Atlas AutomorphicBundles B2: '**Dependencies:** B1.'
Paper p. 418-419: 'the proof of Proposition 3.2.1 shows that the map of integral models Y_{K'} -> Y_K is finite etale
over O_E[l^{-1}]'; p. 421 (proof of Prop. 3.5.1): 'Take H to be a faithful Q-representation of T as in Section 3.4, so
that ... corresponds to a canonical abelian scheme A_H over Y_K.' Also: Paper p. 421, proof of Prop. 3.5.1: 'Take H to
be a faithful Q-representation of T as in Section 3.4, so that the associated variation of Hodge structures HHdg ...
corresponds to a canonical abelian scheme AH over YK. We can always find such a representation; see Proposition 3.4.2.'
Paper p. 419: 'the map of integral models YK′ → YK is finite étale over OE[ℓ−1] ... we obtain a functor ... to locally
constant ℓ-adic sheaves on YK[ℓ−1]'. dependsOn: dr-descent -> [betti-system, polarized-cm-family].

**Fix.** Keep at AutomorphicBundles only the generic statements (B1: absolute-Hodge descent of Hodge tensors for
Hodge-type data; B2: Betti and l-adic local systems on the canonical model), with no dependsOn on CM Part II items:
delete polarized-cm-family from dr-descent.dependsOn. Add to ComplexMultiplicationAndExplicitReciprocityPartII two
missing items for the CM instances: 'CM de Rham descent' (Prop. 3.5.1 for T, with P_{T,Q} defined from A_{H#}; dependsOn
polarized-cm-family, total-reflex-polarization; planned input AutomorphicBundles:B1) and change ell-system to status
missing, routed to ComplexMultiplicationAndExplicitReciprocityPartII, dependsOn torus-integral, with
AutomorphicBundles:B2 as its planned input for the generic-fibre local system. Also: Split polarized-cm-family into (i)
the generic polarized CM abelian scheme A_{H,Q} → Y_K via Y_K → X_{r,m,E}, planned at ShimuraVarieties:V5 /
AutomorphicBundles:B1, and (ii) Proposition 3.4.1 (extension over 𝒴_K, ℓ-adic Tate modules over 𝒴_K[1/ℓ]), kept in the
CM Part II. Make dr-descent depend on (i) and on total-reflex-polarization only through its generic Hodge-type
statement. Move the integral half of ell-system (sheaves on 𝒴_K[1/ℓ]) to the CM Part II next to torus-integral.

### /2 — error

**Where.** research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.result.json item /special-cm-nearby (Corollary
5.4.6(3)); sourceIssues (no entry)

**Claim.** Corollary 5.4.6(3), and the item's part (3), are false for connected 𝒴-schemes S = Spec k with k a finite
field: then V(A_S) can be 0 while ^𝔭𝒱 ≠ 0. For S = Spec k with geometric point ȳ, V(A_S)_Q is the fixed space of
conjugation by the k-Frobenius π of A_S on V(A_ȳ)_Q. That conjugation is T-equivariant and isometric, and E is the
commutant of T (proof of 5.4.6, pp. 464–465), so it is multiplication by some u ∈ E with uū = 1, and V(A_S)_Q = 0 unless
u = 1. Twisting the k-point by an automorphism t ∈ T(Q) ∩ K_{L,0} replaces u by θ(t)^{±1}u. Counterexample: E = Q(ζ_8),
F = Q(√2), d = 2, ξ = 1 − √2 (negative at ι0, positive at ι1). V = (E, Tr_{F/Q}(ξ x x̄)) has signature (2,2) and square
discriminant (D_E = 2^8, N_{F/Q}(ξ)² = 1), and it is isotropic at every odd p: at p ≡ 7 mod 8 the two binary summands
have unit scalars and −1 is a norm from Q_p(i). Hence V ≅ U ⊕ U, and the even unimodular L (take L ⊗ Z_p = O_E ⊗ Z_p for
odd p) is maximal with D_L = 1. The class t of i ∈ E^× lies in K_0 (a unit) and in K: its image θ(t) = i/ī = −1_V lies
in SO(L̂) = the discriminant kernel, and ν(t) = N_{E/Q}(i) = 1 forces the central correction into Ẑ^×. Take 𝔭 = (3+√2) |
7, which is inert in E since F_𝔭 = Q_7 ∌ i. For any y ∈ 𝒴(k), k ⊃ F_𝔮 finite, the twist y^(t) ∈ 𝒴(k) has u(y^(t)) =
−u(y), so one of the two connected 𝒴-schemes Spec k → 𝒴, supported on 𝒴_{F_𝔮}, has V(A_S) = 0, although V(A_ȳ) ≠ 0
(Proposition 5.4.5). The printed proof covers only S with V(A_S) ≠ 0. The item note suspected this but recorded no error
for want of a counterexample.

**Evidence.** p. 464, Corollary 5.4.6: '(3) If S → 𝒴 is supported on a single special fiber 𝒴_{F_𝔮} as in (2), then
there is an isometry 𝒱(A_S)_Q ≃ ^𝔭𝒱 of Hermitian spaces over E.' p. 465, proof: 'If S is any 𝒴-scheme with V(A_S) ≠ 0, …
since V(A_y)_Q is an irreducible representation of T, the map V(A_S)_Q → V(A_y)_Q must be an isomorphism.' pp. 464–465:
'the commutant of T in End(V(A_y)_Q) … must be the field E'. p. 464, proof of 5.4.5: 'we can find a finite extension of
F_𝔮 over which y and all the elements of V(A_y[ℓ^∞]) are defined.' Item note: 'add the hypothesis V(A_S) ≠ 0 … No
counterexample was verified, so it is not recorded as an error.' K_0 contains the image of (Z_p ⊗ O_E)^× (p. 416,
(3.2.1)–(3.2.2)).

**Fix.** Add sourceIssue E63: kind error, affects 'a stated result', locator 'Corollary 5.4.6(3), p. 464 (proof p.
465)', printed as quoted, correction '(3) If S is connected, S → 𝒴 is supported on 𝒴_{F_𝔮} and V(A_S) ≠ 0 (e.g. S a
geometric point), then V(A_S)_Q ≅ ^𝔭𝒱', reason = the Frobenius-twist counterexample above. Nothing downstream is
affected, because every later use (Z_F(α,μ), Propositions 7.6.1–7.6.4) is at points carrying a nonzero special
quasi-endomorphism. Replace item part (3) by: '(3) If moreover V(A_S) ≠ 0, then V(A_S)_Q ≅ ^𝔭𝒱 as Hermitian E-spaces;
for S = Spec k with k finite, V(A_S)_Q is the fixed space of an element u ∈ E^{Nm=1} and can be 0.'

### /3 — error

**Where.** research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.result.json routes 9
(OrthogonalIntegralModelsAndKugaSatake, parent ShimuraVarieties), 10 (GSpinSpecialDivisorHeights, parent
GrossZagierAndArithmeticHeights) and 11 (ComplexMultiplicationAndExplicitReciprocityPartII); their briefs;
research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.result.json routes 10 (GSpinSpecialDivisorHeights) and 11
(ComplexMultiplicationAndExplicitReciprocityPartII) and their briefs; also route 9 item /reflex-clifford;
research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.result.json routes 9, 10 and 11 (briefs); items
/reflex-clifford, /big-cm-cycle, /big-cm-realizations, /good-etale, /special-cm-zero, /special-cm-split,
/special-cm-supersingular

**Claim.** The three Part IIs import each other in a cycle. Orthogonal -> CM Part II (reflex-clifford dependsOn
total-reflex-algebra); CM Part II -> GSpin (averaged-colmez dependsOn prescribed-borcherds and borcherds-error;
orth-cm-line-adapter on omega-height and big-cm-realizations; good-lattice and auxiliary-good on good-prime;
average-analytic and different-character on completed-l); GSpin -> Orthogonal (12 edges, e.g. borcherds-product on
orth-hodge-line). There is also a direct 2-cycle GSpin <-> CM Part II (big-cm-realizations dependsOn cm-integral-bk,
good-etale on torus-integral, special-cm-zero and special-cm-split on cm-nonsplit, special-cm-supersingular on
cm-supersingular) and a hidden 2-cycle Orthogonal <-> CM Part II (torus-integral uses stack-normalization, Definition
4.2.1, routed to the orthogonal Part II). None of the briefs records this: the GSpin brief takes 'CM types and torus
realizations from ComplexMultiplicationAndExplicitReciprocity, ShimuraVarieties V4 and AutomorphicBundles B1-B2' (the
integral CM items are in the CM Part II, not in that roadmap), and the orthogonal brief names no CM Part II import.
After make_queue's merge this is ShimuraVarietiesPartII -> ComplexMultiplicationAndExplicitReciprocityPartII ->
GrossZagierAndArithmeticHeightsPartII -> ShimuraVarietiesPartII, three separate design jobs. Also: The section 3
CM-Shimura-variety block (integral model Y_K, K0, realizations, Props. 3.2.1, 3.5.4, 3.6.1, 3.6.2) is routed to the CM
Part II, whose brief imports GSpinSpecialDivisorHeights, yet five GSpin items depend on it and one Orthogonal item
depends on the total reflex algebra. As written the two proposed Part IIs import each other (and Orthogonal -> CM Part
II -> GSpin -> Orthogonal). Route 10's brief hides this: it imports 'CM types and torus realizations from
ComplexMultiplicationAndExplicitReciprocity', the parent roadmap, which plans none of the integral CM model or its
realizations. Route 9's brief does not import the CM Part II at all although reflex-clifford needs E#. Also: The §5
items routed to OrthogonalIntegralModelsAndKugaSatake (route 9) and GSpinSpecialDivisorHeights (route 10) depend on §3
items routed to ComplexMultiplicationAndExplicitReciprocityPartII (route 11): reflex-clifford→total-reflex-algebra,
big-cm-realizations→cm-integral-bk, good-etale→torus-integral, special-cm-zero and special-cm-split→cm-nonsplit,
special-cm-supersingular→cm-supersingular; big-cm-cycle (no dependsOn) needs the integral CM model 𝒴_{K_{L,0}} of §3.2
and Proposition 3.4.1, both route 11. Neither the route 9 nor the route 10 brief imports route 11, while the route 11
brief imports GSpinSpecialDivisorHeights, which imports OrthogonalIntegralModelsAndKugaSatake. As briefed the three Part
II proposals import each other in a cycle (R9→R11→R10→R9, and R10↔R11): the route 10 design job must either rebuild the
§3 CM integral model and its realizations (duplicating about fifteen route 11 items) or import from a roadmap that
imports it.

**Evidence.** Item dependsOn lists in research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.result.json
(computed over all 212 items). Paper p. 417: 'For any compact open subgroup K ⊂ T(Af), let 𝒴K be the normalization of
Spec(OE) in YK; see Definition 4.2.1 below.' Paper p. 420: the total reflex algebra E♯ and Nm♯: T ↪ TE♯ are defined in
§3.4, and Proposition 5.2.1 (reflex-clifford) embeds E♯ in C+(V). GSpin brief: 'CM types and torus realizations from
ComplexMultiplicationAndExplicitReciprocity, ShimuraVarieties V4 and AutomorphicBundles B1–B2'; CM brief: 'and
GSpinSpecialDivisorHeights for the big-CM Hodge height'. Also: dependsOn: good-etale -> torus-integral;
big-cm-realizations -> cm-integral-bk; special-cm-zero -> cm-nonsplit; special-cm-split -> cm-nonsplit;
special-cm-supersingular -> cm-supersingular (all GSpin route -> CM Part II); reflex-clifford -> total-reflex-algebra
(Orthogonal -> CM Part II); conversely average-analytic, different-character -> completed-l, orth-cm-line-adapter ->
omega-height and big-cm-realizations, auxiliary-good -> good-prime, averaged-colmez -> prescribed-borcherds,
borcherds-error (CM Part II -> GSpin). Route 11 brief: '... and GSpinSpecialDivisorHeights for the big-CM Hodge height.'
Route 10 brief: 'CM types and torus realizations from ComplexMultiplicationAndExplicitReciprocity, ShimuraVarieties V4
and AutomorphicBundles B1-B2'. Paper p. 458-460 (section 5.3) builds Y from 'the normal integral model ... of Section 3'
(K_{L,0} = K0 cap K), and p. 462-465 uses Props. 3.6.1-3.6.2. Also: Route 9 brief: 'Augment the existing
OrthogonalIntegralModelsAndKugaSatake proposal with AGHMP18 §4 and the total-reflex Clifford embedding of5.2. Import
Complex Shimura varieties … and Mathlib CliffordAlgebra/TauCeti.IntegralLattice' (no CM Part II). Route 10 brief:
'Import OrthogonalIntegralModelsAndKugaSatake …; CM types and torus realizations from
ComplexMultiplicationAndExplicitReciprocity, ShimuraVarieties V4 and AutomorphicBundles B1–B2; … Construct big CM Y'.
Route 11 brief: '… and GSpinSpecialDivisorHeights for the big-CM Hodge height. Construct integral maximal-level CM
realizations, total reflex algebra/type, its polarized abelian scheme'. Paper p. 459: 'In Section 3, we associated with
it a 0-dimensional Shimura variety Y_{K_{L,0}}, as well as a normal integral model 𝒴_{K_{L,0}} over O_E'; p. 457: 'Let
E♯ be the total reflex algebra … see Section 3.4'; p. 462: 'V(A_y[p^∞]) ⊂ V_cris,y[p^{-1}]^{φ=1} = 0, by Proposition
3.6.1'; p. 464: 'A_y being supersingular follows from Proposition 3.6.2'.

**Fix.** Make the order explicit at layer level: CM Part II layer 1 = the §3 package (cm-torus,
rev-the-compact-open-subgroup-k0, torus-integral, polarized-cm-family, total-reflex-algebra, total-reflex-polarization,
cm-local-crystal, cm-integral-bk/-dr/-generic/-crys/-tensors/-completion, cm-hecke, cm-torus-abelian, standard-cm-line,
cm-nonsplit, cm-supersingular, newton-factorization, rev-blasius-wintenberger-p-adic-de,
rev-integral-t-torsor-of-tensor, rev-crystalline-realization-of-the-tautological), importing only V4, B1-B2, R07, the
Lubin-Tate Part II and a generic stack-normalization supplier; orthogonal Part II after it; GSpin after both; CM Part II
§9 layers last. Move reflex-clifford (Prop. 5.2.1) to route 10. Add to the GSpin brief: 'Import
ComplexMultiplicationAndExplicitReciprocityPartII (its §3 layer: integral CM models, total reflex algebra, CM
realizations, cm-nonsplit, cm-supersingular)'; add the same to the orthogonal brief if reflex-clifford stays there; add
to the CM brief that its §3 layer exports to the GSpin and orthogonal Part IIs and its §9 layers import GSpin. Also:
Layer the CM Part II explicitly: an early layer 'integral CM Shimura varieties and their realizations' containing
cm-torus, rev-the-compact-open-subgroup-k0, torus-integral, ell-system, polarized-cm-family, total-reflex-algebra,
total-reflex-polarization, cm-local-crystal, cm-integral-bk, cm-integral-dr, cm-integral-generic, cm-integral-crys,
cm-integral-tensors, cm-integral-completion, cm-hecke, cm-torus-abelian, standard-cm-line,
rev-crystalline-realization-of-the-tautological, cm-nonsplit, cm-supersingular, newton-factorization,
rev-blasius-wintenberger-p-adic-de, rev-integral-t-torsor-of-tensor, which imports neither GSpinSpecialDivisorHeights
nor OrthogonalIntegralModelsAndKugaSatake; and a late layer (section 9) that imports GSpinSpecialDivisorHeights. Say so
in the route 11 brief. In the route 10 brief replace 'CM types and torus realizations from
ComplexMultiplicationAndExplicitReciprocity' by 'CM types (ComplexMultiplicationAndExplicitReciprocity CM.0) and the
integral CM Shimura varieties and realizations of the early layer of ComplexMultiplicationAndExplicitReciprocityPartII';
add the same import (for E#) to the route 9 brief, or move reflex-clifford to the GSpin route. Also: Give the §3 CM
integral-model items that §§5–7 consume (cm-torus, rev-the-compact-open-subgroup-k0, torus-integral,
total-reflex-algebra, polarized-cm-family, cm-local-crystal, cm-integral-bk, cm-integral-dr, cm-integral-generic,
cm-integral-crys, cm-integral-tensors, cm-integral-completion, cm-hecke, cm-torus-abelian, standard-cm-line,
cm-nonsplit, cm-supersingular, newton-factorization and their rev- companions) an owner that GSpinSpecialDivisorHeights
can import without a cycle: either a first layer of ComplexMultiplicationAndExplicitReciprocityPartII, with the route 11
brief stating that this layer does not import GSpinSpecialDivisorHeights and that only its averaged-Colmez layer (§9)
does, or GSpinSpecialDivisorHeights itself. Name that import by title and stage in the route 10 brief. Move
reflex-clifford (Proposition 5.2.1, used only by big-cm-cycle) to route 10 and delete 'and the total-reflex Clifford
embedding of5.2' from the route 9 brief. Give big-cm-cycle dependsOn [reflex-clifford, gspin-datum, torus-integral,
polarized-cm-family, orth-normalization, orth-global-model].

### /4 — duplicate

**Where.** research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.result.json route 10
(GSpinSpecialDivisorHeights) items incoherent-eisenstein, local-whittaker, rev-local-weil-index-and-constant,
whittaker-unrepresented, whittaker-inert, whittaker-ramified, whittaker-zero, constant-factor, constant-fourier,
positive-fourier; research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.result.json items
/incoherent-eisenstein, /rev-local-weil-index-and-constant, /constant-fourier, /positive-fourier; route 10
(GSpinSpecialDivisorHeights) brief

**Claim.** These items plan, as new GSpin Part II mathematics, the weight-one incoherent Eisenstein series of a CM
extension E/F over a totally real F, its Weil-index-normalised local Whittaker functions, the inert/ramified zero-coset
Whittaker polynomials and the constant-term factor. GrossZagierAndArithmeticHeights:GZ.6 already plans exactly these
('incoherent Eisenstein/Weil kernels and their central derivatives, normalized local Whittaker terms'), and the accepted
PAPER-YUAN-ZHANG-18 extraction routes the same local integrals for the same rank-one Hermitian space (E_v j_v, uq) to
GZ.6/GZ.7 (its item whittaker is planned at GZ.6; rev-local-whittaker-series-for-incoherent, shell-inert and
shell-ramified go to GZ by its source route 5). The same mathematics thus gets two owners, and the GSpin brief never
names its parent GrossZagierAndArithmeticHeights or GZ.6 as an import. The route reason's 'do not duplicate ...
curve-level GZ.6–7' does not apply: these are local objects, not curve-level ones. Also: These items plan, inside the
GSpin Part II as 'missing', the weight-one incoherent Eisenstein series of the rank-two incoherent space attached to
E/F, its normalised local constant-term factors M_p = N(p)^{f(p)/2} gamma_p(V)^{-1} (L_p(s+1,chi)/L_p(s,chi)) W_{0,p},
the global identity W_0 = -N(v)^{(1-s)/2}(Lambda(s,chi)/Lambda(s+1,chi)) M(s,phi), and the log-rationality of the
positive coefficients (BKY12 Prop. 4.6). The accepted extraction PAPER-YUAN-ZHANG-18 already assigns exactly this
rank-two E/F incoherent kernel and the same normalisation to GrossZagierAndArithmeticHeights:GZ.6 (items mixed-kernel
and whittaker, status planned, source route accepted), and PAPER-LI-23/52 plans BKY12 Prop. 4.6 at GZ.6
(PAPER-BRUINIER-EHLEN-YANG-21/10 also routes it to GZ.6). So the same mathematics now has two owners. The review's
reason for keeping 'missing' ('None states this SL2(A_F), weight-one, rank-two Hermitian instance') is contradicted by
YZ18's accepted items, which are the GL2 version of the same instance. The GSpin brief, a Part II of
GrossZagierAndArithmeticHeights, imports MP.4-6, QM.3 and AL.1 but never names GZ.6 or GZ.7. Coordinator note:
PAPER-YUAN-ZHANG-18: this session verified its red team (REV-RT-PAPER-YUAN-ZHANG-18, PR #5466). It is cited here only
for its accepted text, as an existing owner or record; nothing here rests on a verdict of this session.

**Evidence.** GZ.6 stage description (research/blueprint/atlas/roadmaps/GrossZagierAndArithmeticHeights.json):
'Construct incoherent Eisenstein/Weil kernels and their central derivatives, normalized local Whittaker terms'. MP.6:
'export the coherent/incoherent local sections and functional-equation conventions to GZ.6'.
PAPER-YUAN-ZHANG-18/whittaker (planned GZ.6): 'W°_{a,v} = γ_{u,v}^{−1}W_{a,v}, where γ_{u,v} is the Weil index of
(E_v𝔧_v, uq)'. Review of YZ, route 5: 'Five items are now planned at GZ.6, which names them explicitly.' AGHMP
local-whittaker: 'W*_{α,𝔭} = N(𝔭)^{f(𝔭)/2}·γ_𝔭(^{(𝔭)}V)^{−1}·W_{α,𝔭}'; paper §7.1 pp. 475–477 and §6.1–6.2 pp. 466–469.
Also: AGHMP p. 469, (6.2.3): 'M_p(s,phi_p) = N(p)^{f(p)/2}/gamma_p(V) · L_p(s+1,chi)/L_p(s,chi) · W_{0,p}(I,s,Phi_p)';
p. 470: 'W_0(g_tau,s,Phi) = -N(v)^{(1-s)/2} Lambda(s,chi)/Lambda(s+1,chi) · M(s,phi)'. PAPER-YUAN-ZHANG-18/whittaker
(planned GZ.6): 'W°_{0,v} = gamma_{u,v}^{-1}·(L(s+1,eta_v)/L(s,eta_v))·|D_v|^{-1/2}|d_v|^{-1/2}·W_{0,v} ... Globally
W_0(s,g,u) = -(L(s,eta)/L(0,eta))/(L(s+1,eta)/L(1,eta))·prod_v W°_{0,v}(s,g,u), since prod_v gamma_{u,v} = -1 for
incoherent B' (here |D_v|^{-1/2}|d_v|^{-1/2} = N(p)^{f(p)/2}, so W°_{0,v} = M_p). PAPER-YUAN-ZHANG-18/mixed-kernel
(planned GZ.6) contains the Eisenstein series E(s,g,u,phi_2) of the binary space E_v j and 'By incoherence I(0,g,phi) =
0'. PAPER-LI-23/52 (planned GZ.6): 'BKY Proposition 4.6 and its local proof express the positive Fourier coefficients of
the holomorphic part of the normalized incoherent Eisenstein derivative as finite linear combinations of log p with
coefficients in the field generated by the finite Schwartz function'. GZ.6: 'Construct incoherent Eisenstein/Weil
kernels and their central derivatives, normalized local Whittaker terms ... Prove the functional-equation vanishing that
permits differentiation'.

**Fix.** Mark incoherent-eisenstein, local-whittaker, rev-local-weil-index-and-constant and the λ = 0 Whittaker values
(whittaker-unrepresented, whittaker-inert, whittaker-ramified, whittaker-zero, constant-factor) as planned at
GrossZagierAndArithmeticHeights:GZ.6 (MP.6 for the sections), or move them to a source route for GZ.6/GZ.7. Keep in
route 10 only the AGHMP-specific nearby-coset and dyadic computations (whittaker-denominators, gauss-support,
annular-support, character-average, whittaker-ratio, local-length, nearby-schwartz, fourier-orbital). Add to the GSpin
brief: 'Start beyond Gross–Zagier formulas and arithmetic heights (GrossZagierAndArithmeticHeights); import incoherent
Eisenstein series and normalized local Whittaker functions from GZ.6 and MP.6.' Also: Set incoherent-eisenstein,
rev-local-weil-index-and-constant and positive-fourier to status 'planned', planned
['GrossZagierAndArithmeticHeights:GZ.6'] (the SL2(A_F) restriction of the GZ.6/YZ18 kernel), with a note naming
PAPER-YUAN-ZHANG-18/mixed-kernel, /whittaker and PAPER-LI-23/52 as the same targets. Keep constant-fourier 'missing'
(GSpin) only for what GZ.6 does not plan: the corrected constant term with the -M'(0,phi) term and the rationality of
M_p in Q(phi_p); make it depend on the GZ.6 items. Add to the GSpin brief: 'Import Gross–Zagier formulas and arithmetic
heights GZ.6 (rank-two incoherent Eisenstein series of E/F, central-derivative vanishing, normalised local Whittaker
terms) and GZ.7 (local Whittaker-derivative and deformation-length identities); this roadmap proves only the GSpin
big-CM instance.' Cross-check whittaker-inert/-ramified against
PAPER-YUAN-ZHANG-18/rev-local-whittaker-series-for-incoherent (source-routed to GZ.6-GZ.7) so the local series is
planned once.

## All findings

Locations are in the extraction’s `result.json` unless stated.

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | items /dr-descent and /ell-system (route 4, AutomorphicBundles …; … | Stage cycle across routes. dr-descent is planned at AutomorphicBundles:B1/B2 but dependsOn polarized-cm-family (a missing item routed to … |
| /2 | high | error | item /special-cm-nearby (Corollary 5.4.6(3)); … | Corollary 5.4.6(3), and the item's part (3), are false for connected 𝒴-schemes S = Spec k with k a finite field: then V(A_S) can be 0 while ^𝔭𝒱 ≠ 0. For S = … |
| /3 | high | error | routes 9 (OrthogonalIntegralModelsAndKugaSatake, parent …; … | The three Part IIs import each other in a cycle. Orthogonal -> CM Part II (reflex-clifford dependsOn total-reflex-algebra); CM Part II -> GSpin … |
| /4 | high | duplicate | route 10 (GSpinSpecialDivisorHeights) items incoherent-eisenstein, …; … | These items plan, as new GSpin Part II mathematics, the weight-one incoherent Eisenstein series of a CM extension E/F over a totally real F, its … |
| /5 | medium | error | conventions.analytic, item /completed-l statement, route 11 brief …; … | The discriminant terms are written without absolute values: 'Lambda(s,chi)=(D_E/D_F)^(s/2)...', 'L'/L(0)+1/2 log(D_E/D_F)', and in the route 11 brief the main … |
| /6 | medium | duplicate | route 11 brief ('prove the adapter h_YZ=h_AGHMP+d log(2 pi)/2') …; … | The metric adapter between the AGHMP Faltings height (//s//^2 = /integral s ^ s-bar/) and the Yuan-Zhang one ((2 pi)^(-g) times it) is assigned twice inside … |
| /7 | medium | duplicate | items /bk-carrier, /rev-kisin-s-functor-on-crystalline, /bk-classify, …; … | Theorem 2.1.1 is, by the paper's own proof, [Kis17, Th. 1.1.6] (plus Kim for p = 2). PAPER-KISIN-17 extracts the same definitions and theorem (Breuil-Kisin … |
| /8 | medium | missing | item /polarized-cm-family (Prop. 3.4.1) and its cited inputs | Prop. 3.4.1 rests on three cited results that have no item: the Neron-Ogg-Shafarevich criterion (used to extend A_{H,Q} over every Y_K[l^{-1}]), the Siegel … |
| /9 | medium | error | route 11 brief (ComplexMultiplicationAndExplicitReciprocityPartII), … | The brief must name the roadmaps it imports (PROTOCOL 16) but omits several that its own items depend on: LubinTateFormalModulesAndQuasiCanonicalLifts … |
| /10 | medium | error | item /depth-one-obstructed (Lemma 2.5.4), proofOutline and dependsOn | The proof outline 'Evaluate the obstruction of Lemma 2.5.2(2) with k = 1' does not work when e = e_E = 1 (e.g. E the unramified quadratic extension of F = Q_p, … |
| /11 | medium | error | item /rev-special-divisors-on-the-generic (route 10) versus item … | The generic special divisors Z(m,μ) → M of (4.1.5) are routed to GSpinSpecialDivisorHeights, but Proposition 4.5.8 (special-cartier, routed to … |
| /12 | medium | error | item /big-cm-realizations (Proposition 5.3.2), its review note, and … | The item, as corrected by the review, asserts at every prime 𝔮 ⊂ O_E an F-crystal N_cris over 𝒴_{F_𝔮} 'given by Proposition 3.5.5 (and its proof)' and the … |
| /13 | medium | missing | items /special-cosets, /special-independence, /orth-special, …; … | No item defines the special endomorphisms of ℓ-divisible groups over the general integral model, although V(A_S[ℓ^∞]) is used in special-cosets (V_{μ_ℓ}), … |
| /14 | medium | missing | prerequisites; … | Several papers that §4–§5 build on, and that the atlas does not cover, are missing from prerequisites. (a) AGHMP17 (Height pairings on orthogonal Shimura … |
| /15 | medium | error | items /orth-flat-normal, /orth-lci, /orth-complement-codim, … | The dependencies of the §4.4 normality argument are inverted, and orth-flat-normal's proof outline does not follow the paper. Lemma 4.4.3 (orth-lci) is a lemma … |
| /16 | medium | missing | (no item); … | The proof of Theorem 7.7.4 reduces the deformation theory of the point z = (y, x) of Z_F(alpha, mu) to that of the induced endomorphism of the p-divisible … |
| /17 | medium | missing | (no item); … | Three proofs use the measure lemma [HY12, Lemma 4.6.1]: Proposition 6.2.3 (it fixes the Haar measure on V_p and Vol(O_{E,p})), Proposition 7.1.4 and Lemma … |
| /18 | medium | missing | item /constant-fourier (proofOutline) and the chain to … | Proposition 6.2.3 states that each M_p(s, phi_p) is a rational function of N(p)^s with coefficients in Q(phi_p). This rationality is what makes the error term … |
| /19 | medium | missing | items /borcherds-green, /green-cm, /main-intersection (hypothesis … | Theorems 6.3.1, 6.4.2 and B assume f has 'integral principal part', and the items repeat the phrase, but no item defines the holomorphic part f^+, its … |
| /20 | medium | error | dependsOn of the section 6-7 items (gauss-support, annular-support, … | The dependency graph of the main chain is wrong in several places, and some of these the review flagged without fixing. (1) Inverted edges: gauss-support … |
| /21 | medium | duplicate | item /averaged-colmez, item /faltings-height (api), route 11 …; … | Theorem A is the same theorem as PAPER-YUAN-ZHANG-18/averaged-colmez and PAPER-TSIMERMAN-18/quadratic-hecke-averaged-colmez (and … |
| /22 | medium | duplicate | items /colmez-linearity, /cm-classfunction, /colmez-height | Colmez's theorem that h^Falt of a maximal-order CM abelian variety depends only on (E,Φ) ([Col93]) is recorded as a separate 'missing' item in three … |
| /23 | medium | other | dependsOn of items /averaged-colmez, /faltings-omega, /artin-length, …; … | None of the 14 review-added §8–9 items (rev-lifting-the-colmez-class-function through rev-averaged-colmez-formula-for-imaginary) has a dependsOn field, and no … |
| /24 | medium | missing | item /extended-green (no item for its key input); … | The only non-formal step of Proposition 8.2.1 is the cited fact that pulling back the Borcherds–Bruinier Green function along M(C) → M⋄(C) gives the Green … |
| /25 | medium | missing | item /reflex-local-length (inputs of (9.4.10)-(9.4.11) not stated by … | The local length (9.4.9) rests on three identifications that the paper asserts with 'One can now check' and 'Moreover' (p. 521). No item states them. … |
| /26 | medium | error | item /standard-cm-line (statement, api), item /reflex-determinant … | These still carry the superseded E4 repair, 'the positive ω0 metric' with Q0 positive definite (the extraction's original correction was to use +[z,z̄]_0). The … |
| /27 | medium | other | routes 8, 9 and 10 (roadmap ids … | research/blueprint/make_queue.py ignores a part-ii route's roadmap id. It groups every accepted part-ii route by parent and names the design job … |
| /28 | medium | error | route 8 (LubinTateFormalModulesAndQuasiCanonicalLifts) item …; … | rev-adic-order-of-a-special (§7.7, p. 500) defines ord_𝔮 on V(A_y[p^∞]_𝔭)_Q, the Lubin–Tate factor of the Kuga–Satake p-divisible group at a big CM point. It … |
| /29 | medium | error | route 11 (ComplexMultiplicationAndExplicitReciprocityPartII) brief; … | The brief imports 'generic Artin/Hecke conductors (AutomorphicLFunctionsAndLocalFactors AL.1)'. AL.1 is Tate's thesis for quasi-characters of F_v^× and Hecke … |
| /30 | medium | error | route 10 (GSpinSpecialDivisorHeights) brief | The brief's import list misattributes and omits suppliers. It takes 'CM types and torus realizations from ComplexMultiplicationAndExplicitReciprocity', but the … |
| /31 | medium | duplicate | route 10 item completed-l; … | completed-l (the finite and completed quadratic Hecke L-functions of E/F, Λ(s,χ) = (D_E/D_F)^{s/2}Γ_R(s+1)^d L(s,χ), with Λ(1−s) = Λ(s)) is marked missing and … |
| /32 | medium | duplicate | route 8 items lt-bk and lt-realization | lt-bk (the explicit rank-one BK module of the Lubin–Tate O_E-module, with φ_M multiplication by β, β_{ι0} = E_{ι0}(u) and β_ι = 1 otherwise) and lt-realization … |
| /33 | medium | duplicate | route 6 (MetaplecticAutomorphicForms MP.4–MP.6) item finite-weil; … | AGHMP routes the finite Weil representation ω_L of the metaplectic SL̃2(Z) on S_L = C[L^∨/L], and the vector-valued forms for it, to … |
| /34 | medium | duplicate | route 9 item rev-automorphic-realizations-over-the-generic | This item plans, inside the orthogonal Part II, the generic-fibre automorphic realizations of the GSpin datum: local systems N_B, the variation of Hodge … |
| /35 | medium | error | route 5 (ArakelovGeometryAndAbelianHeights R35.1–R35.2) item …; … | The generic Arakelov formalism on stacks is split across two owners inconsistently. The review moved arithmetic-divisor (Gillet–Soulé ĈH¹ of the stack M, Pic^ … |
| /36 | medium | library-claim | route 10 items rev-rank-one-hermitian-spaces-and, … | These items record classical local–global facts for rank-one Hermitian spaces over a CM extension E/F. A rank-one Hermitian space is determined up to isometry … |
| /37 | medium | library-claim | route 3 (ShimuraVarieties V4) item torus-stack | torus-stack is marked planned at ShimuraVarieties:V4. Its statement, and its unit test 'At non-neat K keep 1//Aut/ rather than count coarse points', require … |
| /38 | medium | library-claim | route 4 item ell-system | ell-system is marked planned at AutomorphicBundles:B2. As corrected by the review, its statement builds lisse ℓ-adic sheaves on the integral model 𝒴_K[1/ℓ], … |
| /39 | low | missing | sourceIssues (nothing recorded at section 1.3, p. 394) | The introduction describes the torus T by 'T(Q) = E^x/ker(Nm: F^x -> Q^x)'. With T = T_E/T^1_F (section 3.1) this is false for d >= 2: the image of E^x has … |
| /40 | low | missing | sourceIssues (nothing recorded at section 1.2, p. 393) | The introduction asserts that for every prime p > 2 the special fibre of the integral model is normal and Cohen-Macaulay, 'as we explain in Section 4'. Section … |
| /41 | low | missing | sourceIssues E10/E38 (sections 2.4, 2.5, 3.5) | Three further slips in pp. 408-426 are unrecorded. (a) Proof of Prop. 2.4.1: 'f_i = Fr^i(f_0)' contradicts Prop. 2.3.4, which gives f_i = (1 tensor … |
| /42 | low | other | dependsOn of /lift-depth, /cm-supersingular, /lt-realization, … | Several dependency lists miss the inputs the proofs use, including two that the review explicitly asked to add: lift-depth (Theorem 2.5.5, 'Immediate from … |
| /43 | low | error | items /cm-torus (unitTests, api), /cm-supersingular (statement), … | Presentation slips in section 3 items. (a) cm-torus's unit test 'The norm-one torus has dimension d' is false for the item's norm-one torus T^1_F = … |
| /44 | low | other | route 5 (ArakelovGeometryAndAbelianHeights) stages and route 11 brief; … | (a) Route 5 lists stages R35.1-R35.2 only, but its item faltings-height is planned at R35.2 and R35.3 (the review added R35.3), and the route 11 brief imports … |
| /45 | low | duplicate | items /borcherds-green and /borcherds-product (route 10) versus … | The route 10 reason claims GSpinSpecialDivisorHeights as owner of the ordinary Borcherds Green functions ('do not duplicate the distinct … |
| /46 | low | error | items /special-cm-zero, /orth-dr, /orth-crys, /borcherds-green …; … | Defects the review flagged but left in place, plus two it missed. (1) special-cm-zero is still named 'Characteristic-zero and split-prime vanishing'; its … |
| /47 | low | other | research/blueprint/papers/PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18.md, …; … | The reader report is stale relative to the accepted JSON for §4. E14 is still listed as '(gap; affects the proof)', with the superseded correction 'Retain n≥2 … |
| /48 | low | error | sourceIssues E44 (reason) | E44's correction is right, but its reason is not. A connection with values in M ⊗_{D_R} Ω̂¹_{R/W(k)} does satisfy a Leibniz rule, namely the one for the … |
| /49 | low | other | item /arithmetic-divisor versus PAPER-SHANKAR-SHANKAR-TANG-ETAL-22 … | The two extractions feeding GSpinSpecialDivisorHeights use different Petersson normalizations of the same tautological bundle: AGHMP's ‖z‖² = −[z, z̄], and … |
| /50 | low | error | item /lt-factor (proofOutline, dependsOn) | The outline proves Proposition 7.4.1 by 'Tate's full faithfulness'. Full faithfulness gives maps between p-divisible groups that already exist. It does not … |
| /51 | low | missing | sourceIssues (pp. 478, 487, 491) | Three misprints in this range are not recorded; each affects nothing. (a) p. 478: the expansion of Q(λ+x) writes b·⟨λ,x⟩ for b·Tr_{E_q/F_p}⟨λ,x⟩, and claims … |
| /52 | low | error | sourceIssues E16 (locator) | E16's locator reads 'Published Proposition7.1.3 measure calculation', but its quoted text 'N(p)^−r Vol(OF,p)=N(p)^(r−m/2)' is equation (7.1.3), p. 478, in the … |
| /53 | low | error | sourceIssues E27 (bibliography) | E27 records two DOI slips in the references but misses three more of the same kind on pp. 528 and 530. [Tsi18] has the same slash for dot as [YZ18]. The DOI … |
| /54 | low | missing | sourceIssues (p. 525) | The proof of Proposition 9.5.2 cites '(9.5.4)' for the value χ_{E/F}(𝔟) = (−1)^{d/2+1}. Equation (9.5.4) is the norm map Cl(E) → Cl^+(F); the value comes from … |
| /55 | low | missing | prerequisites; … | Since the review added the d = 1 case (E57, item 211), Theorem A needs an outside input that no prerequisite names: the Chowla–Selberg formula for Faltings … |
| /56 | low | other | items /faltings-omega, /reflex-local-length, /averaged-colmez …; … | Several texts in scope contradict the accepted review. faltings-omega's statement says 'This is a target pending G4, not established ...', while its review … |
| /57 | low | error | route 9 (OrthogonalIntegralModelsAndKugaSatake) brief | The brief's imports are incomplete or unresolvable. 'Shimura data (ShimuraData)' names no stage. 'the pending general integral Hodge-type models … |
| /58 | low | error | route 8 (LubinTateFormalModulesAndQuasiCanonicalLifts) brief | The brief imports 'the existing Class field theory Artin map' with no roadmap id or layer, contrary to PROTOCOL section 16 ('names the roadmaps it imports … |
| /59 | low | other | baseline.declarations | The library-check records in baseline.declarations attribute the cm-field, product-formula and vandermonde checks to the wrong paper ('item': … |

## Notes for the fix job

- **Cycles first (/1, /3).** Make the §3 CM package the first layer of the CM Part II, importing only V4, B1–B2, R07 and
  the Lubin–Tate Part II; put the orthogonal Part II after it and the GSpin Part II after both. Split
  polarized-cm-family so that dr-descent needs only the generic CM abelian scheme, and name every cross-Part II import
  in the briefs.
- **Corollary 5.4.6(3) (/2).** Add the hypothesis V(A_S) ≠ 0 to the item and record the counterexample as a new
  sourceIssue. No later use is affected.
- **GZ.6 (/4).** Plan the incoherent Eisenstein series, its normalised local Whittaker functions and the constant term
  at GrossZagierAndArithmeticHeights:GZ.6 (MP.6 for the sections), and keep in route 10 only the AGHMP-specific
  nearby-coset and dyadic computations. Import GZ.6 in the GSpin brief.
- **Owners.** Take completed-l and the conductors from AL (/29, /31). Name one owner for the averaged Colmez targets and
  Colmez’s theorem (/21, /22), Theorem 2.1.1 (/7), the metric adapter (/6), arithmetic divisors on stacks (/35) and the
  finite Weil representation (/33).
- **Then** the absolute values of D_E/D_F (/5), the missing cited inputs and the dependsOn repairs.
