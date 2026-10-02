# RT-PAPER-DEMARCO-MAVRAKI-YE-26

Red team of the accepted extraction PAPER-DEMARCO-MAVRAKI-YE-26: Laura DeMarco, Niki Myrto Mavraki and Hexi Ye, *Bounded
geometry for PCF-special subvarieties*, Forum Math. Pi 14 (2026), e4 (arXiv 2405.17343v3). Issue #4202.

Red team: Claude Code, session `cc-c2c06b`, 2 October 2026. I did not write or review:
- the extraction (`cc-fb70e5`, PR #1847);
- its review (`cc-442dc5`, PRs #2402 and #2433).

**Disclosures.** A later correction of this extraction's item 7 (Codex, PR #5125) applied my finding
RT-PAPER-DEMARCO-KRIEGER-YE-20/1 (#4919). Findings also cite, as existing owner decisions or examples, other work of
mine:
- the red team of DEMARCO-KRIEGER-YE-20 (#4919);
- the red team of YUAN-26 (#5331);
- the red-team verification for GHOSH-SARNAK-22 (#4857);
- the fix for CHEN-24 (#5131).

The findings that cite them (/1, /4, /11, /12, /22) carry coordinator notes, and none rests on a verdict of mine.

**Result: 27 findings, 2 high, 12 medium and 13 low.**

## Method

**The source.** The published open-access article (<https://doi.org/10.1017/fmp.2026.10024>), 22 pages, downloaded from
Cambridge Core on 2026-10-02. Cambridge stamps each download, so its hash differs from the extraction's, but the pages
match. arXiv v3, the accepted version, was used for comparison.

**The passes.** Three parallel passes were run by this session.
- Two read all 22 pages, checking decisive formulas on page images: §§1–2, and §§3–5 with the references.
- One checked the five routes, the 16 prerequisites and the statuses against the atlas, the ArithmeticDynamics packet,
  RS-27 and other extractions.

**Merging.** Six pairs of findings that two passes each reported were merged.

**What I re-verified myself.** Both high findings.
- **/1.** Route 5's brief imports DY.0, DY.4 and DY.6 and exports to DY.6, while the DY-routed items use route 5's
  definitions.
- **/2.** At the diagonal point of p. 10 the landing locus contains a curve whenever any two points of Y lie on a common
  fibre. So the isolatedness that [DM1, Prop. 4.8] needs fails.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json routes 1, 3 and 5 (route 5 brief and
reason; route 3 brief acceptance; item /10 in route 1 to DY.4; items /8, /9 in route 1 to DY.6, which use items /3, /4
of route 5); report line 46

**Claim.** The routes create dependency cycles between ArithmeticDynamics and the two proposed Part IIs. (a) Route 5
imports from DY.0, DY.1, DY.4, DY.6 and HeightsRationalPointsAndObstructionsPartII, but also exports its theorems back
into DY.6. That gives DY.6 → Part II → DY.6, and DY.6 → HeightsPartII → Part II → DY.6, because DKY's accepted
HeightsPartII route imports from DY.6. (b) Item /10, routed to DY.4, needs T_bif and [BB] (item /24, route 5) and
Yuan–Zhang quasi-projective bundles (items /33-/35, route 3). Route 5 in turn imports 'equidistribution of PCF
parameters from DY.4'. (c) Items /8 and /9 at DY.6 use PCF maps and L_d, which items /3 and /4 send downstream to route
5. (d) Route 3's acceptance test needs the critical height (DY.6) and M_d^cm (DY.0), so DY.4 → DY.6 → ArakelovPartII →
DY.4. (e) Ingram's theorem (item /9, DY.6) rests on McMullen's rigidity theorem, which route 5 plans. Coordinator note:
PAPER-DEMARCO-KRIEGER-YE-20 was red-teamed by this session (PR #4919); its route 3 brief is cited only as an existing
owner decision. The cycle rests on this extraction's own routes and briefs.

**Evidence.** Route 5 brief: 'Import the moduli space M_d, its critically marked cover, the critical height and Ingram's
comparison from ArithmeticDynamics DY.0 and DY.6, Call–Silverman heights from DY.1, and equidistribution of PCF
parameters from DY.4.' … 'Export the uniform results to ArithmeticDynamics DY.6 as proven unlikely-intersection
endpoints.' Route 5 reason: 'The main theorems are uniform Dynamical André–Oort results and are exported to DY.6.' Item
/10: 'ĥ_crit is the height of a non-degenerate adelically metrized line bundle on M_d^cm … with archimedean curvature
T_bif. Galois orbits of generic sequences of PCF parameters equidistribute to the bifurcation measure T_bif^{∧(2d−2)}';
note 'Routed to ArithmeticDynamics DY.4 as a source.' Paper p.7, §2.4: 'Important for us is that the curvature
distribution at the archimedean place is equal to the bifurcation current T_bif defined in §2.3. The non-degeneracy of
this metrized line bundle follows because the bifurcation measure is non-trivial, as was proved in [BB].' Item /8: 'for
[f] ∈ M_d(Q̄), ĥ_crit(f) = 0 iff f is PCF'. Item /9: 'off the flexible Lattès locus'. Route 3 brief: 'Acceptance: … for
the critically marked family the restriction to the ramification divisor gives the critical height.' Atlas:
ArithmeticDynamics:DY.6 requires DY.3, DY.4, DY.5. PAPER-DEMARCO-KRIEGER-YE-20 route 3 brief: 'Import the Lattès
heights, the Arakelov–Zhang pairing and the uniform common-torsion bound for Legendre curves … from ArithmeticDynamics
DY.6'. research/blueprint/packets/ArithmeticDynamics.json:30519 (G3) and :30526 (G4) are gaps needed by
DY.4/equidistribution-of-pcf-parameters-in-moduli; G4 reads 'Routed by PAPER-DEMARCO-MAVRAKI-YE-26 to the proposed
ArithmeticDynamicsPartIIBifurcation'. :30576 is needed by DY.6/critical-height-is-a-moduli-height and reads 'McMullen's
theorem belongs with the bifurcation theory of the proposed Part II'.

**Fix.** (1) In route 5, delete 'Export the uniform results to ArithmeticDynamics DY.6 as proven unlikely-intersection
endpoints.' and, in its reason, 'and are exported to DY.6'. Write instead: 'Theorems 1.1, 1.2, 1.5, 1.6 and 1.8 are
endpoints of this Part II. It cites the statement ArithmeticDynamics:DY.6/dynamical-andre-oort-conjecture. DY.6 imports
nothing from this Part II.' Make the same change in report line 46. (2) Move item /10 from route 1 to route 5, so route
1 keeps items /1, /2, /8, /9 and stages DY.0, DY.6. In route 5, replace 'equidistribution of PCF parameters from DY.4'
with 'the projective equidistribution theorem of Arithmetic dynamics (ArithmeticDynamics:DY.4)'. Add to route 5's
construction list: 'ĥ_crit as the height of the non-degenerate Yuan–Zhang bundle on M_d^cm with archimedean curvature
T_bif, and equidistribution of PCF parameters to T_bif^{∧(2d−2)} (Gauthier; Yuan–Zhang §6.3)'. (3) Plan the definitions
of PCF maps and of flexible Lattès maps and L_d at DY.6; see the duplicate finding. (4) In route 3, delete 'and for the
critically marked family the restriction to the ramification divisor gives the critical height' and put that test in
route 5's acceptance. (5) Record McMullen's rigidity theorem and Corollary 2.3 (finiteness of the multiplier spectrum
off L_d), which Ingram's proof uses, as cited inputs of ArithmeticDynamics DY.6. Route 5 imports them and does not plan
them.

### /2 — error

**Where.** research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json sourceIssues E7 (correction and review
reason), item /27 note, route 5 brief (ArithmeticDynamicsPartIIBifurcation); PAPER-DEMARCO-MAVRAKI-YE-26.md review
section ('What survives')

**Claim.** E7, the note of item /27 and the route 5 brief assert that the diagonal construction still proves the
non-vanishing mu_l != 0 because 'it uses (3.2) over Y_l, where the intersection at y is isolated'. That is false in
general. At y = (y0,...,y0) every landing locus L_i (where the (r+1)-tuple c_{i,1..r+1} lands on its repelling cycles)
passes through y0 and, by the proof's own transversality over U, L_1 is a germ of dimension k - r - 1 in Y. Every z in
L_1 that lies on a common fibre X_lambda with y0 gives a point (z, y0, ..., y0) of Y_l satisfying all l(r+1) landing
equations, so when k >= r + 2 and such z exist the common zero set at y is positive-dimensional: c is not even properly
prerepelling at y over Y_l, Gamma_c is not a rigid repeller in the sense of [DM1, §4.3], and [DM1, Prop. 4.8] does not
give (3.2). Counterexample: d >= 3, Y = image of a generically finite morphism A^3 -> M_d^cm (exists since dim M_d^cm =
2d-2 >= 4; T_bif^3 != 0 on Y by [GOV, Lemma 6.8]), X_lambda = images of the affine lines (r = 1, l = dim V = 4, k = 3;
maximally varying, rho_4 generically finite). Any two points of Y lie on a common X_lambda, so {(z, y0, y0, y0) : z in
L_1}, a curve, lies in the landing set. E7's own example (lines in M_2, k = r + 1) is exactly the case where L_1 = {y0}
and the problem does not show; in §5 (V a whole component of Ch(M_d, 1, D), d >= 3) k = 2d-2 >= r+2 and the failure is
the typical case. So both assertions of Proposition 3.1 (mu_l != 0 and the witness) are unproved, and Theorem 1.8 rests
on more than relocating the witness.

**Evidence.** p.10: 'Then pi_2^{-1}(Z_2) ∩ pi_1^{-1}(Z_1) has codimension 2(r+1) in Y_l. In this way, we inductively
construct a parameter y = (y0, ..., y0) in Y_l and an l(r+1)-tuple of marked critical points c ... which is transversely
prerepelling for the map Phi at y over Y_l. In particular, in the language of [DM1, §4.3], the graph Gamma_c of c in Y_l
x (P^1)^{l(r+1)} defines a rigid repeller for the map Phi at this parameter, and we conclude from [DM1, Proposition 4.8]
that T_Phi^{l(r+1)} ∧ [Gamma_c] != 0, (3.2)' (same text in arXiv v3). [DM1] arXiv:2212.13215v2 §4.3, condition (3) of a
rigid repeller: 'x0 is an isolated point of the intersection of Phi^{n0}(Y) with the image of eta'. E7 correction: 'The
conclusion mu_l != 0 is not affected: it uses (3.2) over Y_l, where the intersection at y is isolated.' Item /27 note:
'the non-vanishing of mu_l stands, but the witness must be found off the diagonal (E7)'.

**Fix.** In E7.correction replace 'The conclusion µ_ℓ ≠ 0 is not affected: it uses (3.2) over Y_ℓ, where the
intersection at y is isolated.' by 'The diagonal point also invalidates (3.2). Let L_i ⊂ Y be the germ at y₀ where
(c_{i,1},…,c_{i,r+1}) land on the continued repelling cycles; it has dimension k − r − 1. Every z ∈ L_1 lying on a
common fibre X_λ with y₀ gives (z, y₀, …, y₀) ∈ Y_ℓ satisfying all ℓ(r+1) landing equations, so when k ≥ r + 2 the
intersection at y need not be isolated, Γ_c need not be a rigid repeller [DM1, §4.3], and [DM1, Prop. 4.8] does not
apply. Example: d ≥ 3, Y the image of a generically finite A³ → M_d^cm, X_λ the images of lines (r = 1, ℓ = 4, k = 3):
{(z, y₀, y₀, y₀) : z ∈ L_1} is a curve of solutions. Both assertions of Proposition 3.1 (µ_ℓ ≠ 0 and the witness) must
be proved at a point off the diagonal where Y_ℓ is smooth and ρ_ℓ is a local isomorphism.' Append the example to
E7.reason. In item /27's note replace 'the non-vanishing of µ_ℓ stands, but the witness must be found off the diagonal
(E7)' by 'when dim ρ₁(X) ≥ r + 2 the diagonal construction proves neither µ_ℓ ≠ 0 nor the witness (E7); both must be
obtained off the diagonal'. In the route 5 brief replace 'Propositions 3.1–3.2, with the witness of Proposition 3.1
found where ρ_ℓ is a local isomorphism (sourceIssues E7)' by 'Propositions 3.1–3.2, proving both µ_ℓ ≠ 0 and the
existence of a witness at a point of X^ℓ_V off the diagonal where Y_ℓ is smooth and ρ_ℓ is a local isomorphism
(sourceIssues E7)'. Delete the 'What survives' bullet of the report's E7 summary.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | The routes create dependency cycles between ArithmeticDynamics and the two proposed Part IIs. (a) Route 5 imports from DY.0, DY.1, DY.4, DY.6 and … |
| /2 | high | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | E7, the note of item /27 and the route 5 brief assert that the diagonal construction still proves the non-vanishing mu_l != 0 because 'it uses (3.2) over Y_l, … |
| /3 | medium | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | Neither R09.1 nor R09.2 plans Chow varieties of cycles, in the original stage text or in the scope RS-27 narrowed them to. RS-27 states exactly what each layer … |
| /4 | medium | other | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | The id ArithmeticDynamicsPartIIBifurcation will never be designed. The queue merges every accepted Part II route with parent ArithmeticDynamics into one job, … |
| /5 | medium | duplicate | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | Items 3 and 4 are routed to the proposed ArithmeticDynamicsPartIIBifurcation as mathematics it must build, but the ArithmeticDynamics blueprint now plans both … |
| /6 | medium | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | Route 1 sends the scheme-level moduli space (Silverman's geometric quotient over ℤ, its GIT compactification over ℚ) and the cover M_d^cm carrying the family … |
| /7 | medium | missing | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | The paper cites a result for the PCF-specialness of M_d, of MPoly_d and of every subvariety cut out by critical orbit relations: [BD, Proposition 2.6] and … |
| /8 | medium | missing | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | Four cited works used in §§1–2 are missing from the prerequisites, and no atlas extraction or packet covers them. (a) [De1], DeMarco 2001: it supplies the … |
| /9 | medium | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | E9's 'correction' gives no corrected statement: it proposes two routes ('prove Theorem 1.5 in that relative form ... or show h_Ch(Y(λ)) ≥ c h_Ch(λ) − c′'), … |
| /10 | medium | missing | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | The proof of Theorem 1.8 uses two specific Yuan-Zhang results that no item states. (a) Specialization: the height of the relative-dimension-0 Deligne pairing … |
| /11 | medium | duplicate | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | The route 3 brief says 'Add: nef adelic line bundles P̂ic(X)_{ℚ,nef}; ... the relative-dimension-0 Deligne pairing ...; ... the height inequality ... (Thm. … |
| /12 | medium | duplicate | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | Route 5 tells the bifurcation Part II to build pluripotential theory itself, on Tau Ceti PDE Lane C, and item /23 plans 'positive closed (1,1)-currents with … |
| /13 | medium | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | Item /28 says that parameters with a parabolic cycle are dense in the bifurcation locus of an active marked critical point (Mañé–Sad–Sullivan) and that 'the … |
| /14 | medium | missing | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | E7's suggested repair rests on 'a density theorem for transversely prerepelling parameters, in the style of [Du, Theorem 1.1], for the product family Φ over … |
| /15 | low | other | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | PROTOCOL §16 asks briefs to name imports by title and id and to state the final theorems as the paper does. All three briefs name other roadmaps by id only. … |
| /16 | low | missing | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | This is an unrecorded citation misprint, and the extraction copies it. On p.6 the paper deduces T_bif ≠ 0 on X from '[Mc1, Lemma 2.2]'. McMullen 1987 has no … |
| /17 | low | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | The paper says h_Ch is defined in §2.5, but §2.5 defines only Chow varieties; no height on them is defined anywhere. The proof needs h_Ch to be a Weil height … |
| /18 | low | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | Item 9 states Ingram's theorem as 'there are constants with c₁ h_{M_d} − c₂ ≤ ĥ_crit ≤ c₃ h_{M_d} + c₄', with no positivity and no ampleness. With c₁ = c₂ = 0 … |
| /19 | low | other | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | Route 1 has been carried out: the ArithmeticDynamics packet now plans the critical height, its zero-set criterion, Ingram's comparison, and the critical height … |
| /20 | low | missing | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json …; … | The paper's main theorems are presented as a 'Uniform DAO' that avoids the conjectural classification. That classification, the Dynamical André–Oort conjecture … |
| /21 | low | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | Item 16 puts three results into one item, against §16's 'Split multi-part results'. Its cubic clause, 'similarly for Per_n(λ) in the cubic polynomial moduli … |
| /22 | low | other | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.md (status …; … | The report contradicts the JSON on item 7. The report says '35 items (2 planned, 33 missing)', 'Library. Mathlib has the Weil height … |
| /23 | low | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | Item /26 states Dujardin's theorem 'for a single family (f₁ = ⋯ = f_m = f) and m ≤ 2d − 2 marked critical points' without saying over which parameter space. … |
| /24 | low | missing | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | The step 'd^n(r_n)^*T_{c_{r+1}} → 0 weakly, and therefore d^{nr}(r_n)^*µ¹_{λ₁} → 0' needs more than item /32 states. It needs uniform convergence of the … |
| /25 | low | missing | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json §5 …; … | The counting argument of §5 uses a family version of bounded geometry that no item records: for a closed subvariety Z ⊂ X^{ℓ+1}_V over V there is a dense open … |
| /26 | low | other | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | PROTOCOL §18 requires every mistake found in the source to be recorded under sourceIssues. Several slips in my pages are unregistered. The review noted three … |
| /27 | low | error | research/blueprint/papers/PAPER-DEMARCO-MAVRAKI-YE-26.result.json … | Item /30 states the slicing identity (4.7) and the proportionality (4.8) for µ_ℓ and λ ∈ supp π_*µ_ℓ. After E8, the equidistribution identity, and hence (4.7) … |

## Notes for the fix job

- **Routes first.** Choose one direction between ArithmeticDynamics and the bifurcation Part II. Either the Part II
  consumes DY.0/DY.4/DY.6 and DY.6 owns the PCF and Lattès definitions with no export back, or the reverse. Route 5
  should take the design id the queue actually creates.
- **E7.** Restate the gap as covering (3.2) and both assertions of Proposition 3.1, and record the density theorem that
  the repair needs.
- **Owners.** Point the duplicated items at DY.6, PAPER-YUAN-26 and SeveralComplexVariables CV.2, and settle the owners
  of the scheme-level M_d and of Chow varieties.
