# Independent review: PeriodsAndSpecialValues PS.8–PS.9

**Verdict: accepted as a complete target-level planning pass.** Both stages remain
`planned`, neither is `closed`. The explicit obligations below must be discharged
before proof implementation; this verdict does not claim formalised mathematics.

Job `REV-PeriodsAndSpecialValues--PS.8`, issue #543. Reviewer: Codex GPT-6,
session `codex-g6jj0S`, 11 October 2026. The input was produced under the separate
`codex-ILKXck` session; this reviewer did not author it.

The review covered the entire packet, suggested file and reader, the original
handoff, the reviewed library audit, the actual supplier statements and current
upstream roadmap/library boundaries. Only the issue's named packet and Lean file,
this review and this reviewer's handoff were edited. Source results are stated in
our own words.

## Counts and scope

| Item | Result |
| --- | --- |
| Nodes | 40: 8 definitions, 13 constructions, 18 theorems, 1 comparison |
| Node verdicts | 17 verified, 23 corrected, 0 added, 0 unverifiable |
| Definition/construction APIs and tests | All 21 have 3 API items and 3 tests: 63 of each |
| Planets | 6 per stage, 12 total; key definitions/constructions/theorems |
| Pinned baseline statements | All 19 original entries confirmed; 1 strip theorem added and confirmed |
| Supplier requests | 9 explicit open requests; actual current contracts read |
| Explicit obligations | 4 mathematical proof/interface gaps plus 1 upstream catalogue link |
| Source findings | E1/E2 independently confirmed; E3/E4 added and confirmed |
| New target nodes | None; corrections stay inside existing target-level nodes |

`complete` records a finished planning pass under the node budget. It does not
mean the two stages are proved or their suppliers are accepted. The geometry and
crystalline bridge are conditional work with precisely recorded owners and
interfaces, rather than claims covered by the presently stated suppliers.

## Source versions and corrections

All eleven original PDFs were read at the relevant passages and their SHA-256
hashes match the packet. Locators use the stated edition, not a guessed journal
page number. Brown is the 19-page arXiv v1, not the final Annals pagination. DG
printed pages are PDF pages minus two; NS and LYA printed pages are PDF pages
minus one. Soudères v3 has 26 PDF pages: its frame-preserving shuffle is
Proposition 3.8, §3.2, pp.10–12; its stuffle is Proposition 4.24, **§4.4**, pp.23–26.
Those locators were checked visually because the PDF text encoding is poor;
the mathematical proof was also checked in the ar5iv rendering.

The corrected quartic family and residue locators are H §4.1, Propositions
4.1–4.4, pp.10–11, and §4.2, Propositions 4.6–4.7, pp.12–13. The residue is
not in its Picard–Fuchs section. H 4.12 is a theorem, not a proposition. LYA's
quartic polynomial is equation (5.19), printed p.21; the integral-branch
induction is equations (6.1)–(6.4), p.22, with the quartic application on p.23.
IKZ's A(u) and ρ are equations (2.1)–(2.2), pp.309–310. DG's free Lie algebra
uses Proposition 2.3, pp.19–20, as well as the fibre-functor Proposition 2.2.
Theorem 4.4 starts on printed p.47.

Shapiro's source title is *Frobenius map for quintic threefolds*. Its Section 6
starts with **Definition 6.1**, p.14, not “Theorem 6.1.” The Dwork calculations
use Lemmas 6.2–6.3 and §§6.1–6.4, pp.14–19, with the coefficient reduction
Theorem 5.13, pp.13–14. The Schwarz–Shapiro source title ends in *“Physics over
a ring”*. Zagier's main Theorem 1 is on **p.981** of the checked final copy;
its all-two identities are on p.979 and the proof occupies §§2–4, pp.982–990.
Secondary citations previously embedded in another source's locator now have
their own source ids where needed.

### Confirmed preprint findings

[The checked Hartmann preprint](https://arxiv.org/pdf/1101.4601v1) is the complete
29-page PDF whose title page is dated 29 October 2018, hash
`11e54e5ed83a516011217fa7f6fb40d4d890fb7ecf276d7ae398b5ae97a49909`.
The [publisher page](https://link.springer.com/article/10.1007/s00229-012-0577-7)
was inspected but full published text was unavailable there. **E1–E4 concern
only this checked preprint; they make no assertion about the unread version of
record.** The packet now says this in `sourceVersions`, and each finding has a
finished independent verdict and a record of the correction search.

- **E1, Proposition 4.26 and Example 4.27, p.21.** With u=t⁻⁴ and
  θ=−t∂t/4, the pulled operator is `(1−t⁴)/64 · D_t ∘ m_(1/t)`.
  Raw periods are t⁻¹ times hypergeometric solutions; rescale the form by t.
  Expanding all four derivative coefficients independently confirms the
  correction. On the constant function the printed composition gives −t²/8,
  whereas the correct operator gives −3/(32t⁴). The period ratio is unchanged.
- **E2, Theorem 4.28, p.22.** The regular U₁ uses upper parameters
  (1/8,1/8) at 1−t⁴, as in NS formula (26), printed p.9/PDF p.10.
  Its first coefficient is 1/32; the unequal printed pair gives 3/32.
  U₂ keeps (5/8,5/8).
- **E3, Theorem 4.12, p.15.** The asserted general primitive-embedding
  uniqueness lacks ambient unimodularity. Take L=U⊕U⊕⟨−6⟩ and S=⟨2⟩.
  In a hyperbolic basis, v=e₁+f₁ and w=2e₁+2f₁+g have coprime coordinates
  and norm 2. Their pairing ideals are Z and 2Z, invariant under O(L), so
  they give inequivalent primitive embeddings. Yet signatures (2,3),(1,0)
  are strictly separated and rank gap 4≥l(S)+2=3. The K3 application on
  p.16 remains valid: its ambient H² is even unimodular of signature (3,19).
- **E4, Theorem 4.29 proof, p.23.** The claimed equality of the γ₁ and γ₄
  based images loses the branch translation. Their already computed actions
  are R(p)=−1/(2p) and T R T⁻¹(p)=(3−2p)/(2−2p), T(p)=p+1, with distinct
  fixed-point sets. Pull the real local formula at s=1 by t=i·s to the marked
  γ₁ chart at t=i; (−it)⁴=t⁴ and the logarithm agrees on the ray t=i√2.
  This supplies the reflection needed by Proposition 4.25 without identifying
  the two based loops. The normalized mirror-series conclusion is retained.

### Proof and convention corrections

Brown's Lemma 3.8, pp.10–11, uses **convergent motivic stuffle** and the
shuffle-regularized leading-zero integral in equation (3.8), p.9. The previous
“regularized leading-one extension” description added a prerequisite that this
proof does not require. The corrected target gives both exact formulas for
ζ₁ᵐ(2ⁿ)=Iᵐ(0;0(10)ⁿ;1), including its indecomposable coefficient 2(−1)ⁿ.
G3 is now the frame-preserving comparison from Soudères's relative-cohomology
presentation to Brown's H, preserving ζᵐ(2)≠0. It remains open; numerical
period injectivity cannot replace it. The later motivic induction and cut
coefficients use this corrected prerequisite.

Brown Lemma 5.5, pp.13–14, proves **level lowering by parity of contiguous
cuts**, before the one-three coefficients are evaluated. That proof and its
direct coaction prerequisite are now explicit. Definition 5.9, p.15, uses
**source words as rows and target words as columns**. For descending words the
column reindexing deletes the prefix 2ᵏ3; its inverse sends (r=2k+3,u) to 2ᵏ3u.
It must not silently use the usual column-input convention or suffix deletion.

At weight five the row order [3,2],[2,3] and column order (3,[2]),(5,[]) give

\[
M_{5,1}=\begin{pmatrix}3&-11/2\\-2&9/2\end{pmatrix},\qquad
\det M_{5,1}=5/2.
\]

Scaling the second column by 2 gives [[3,−11],[−2,9]], whose reduction modulo 2
is upper triangular with unit diagonal. This replaces the old test that only
counted two rows and columns. The r=N empty target remains included at level one.

Zagier's uniqueness step now records the actual directional estimate
O(exp(π|Im y|)), integer zeros and the diagonal comparison. Dividing by sin(πy)
gives an entire finite-order quotient bounded off a horizontal strip; the
pinned Mathlib strip theorem and Liouville give a constant. The diagonal forces
it to vanish for nonintegral x, and analyticity handles integral x. Generic
special-function and strip theory are reused, rather than replaced by an
interpolation heuristic.

The forward ζ(2,1)=ζ(3) statement was removed from the earlier convergent
product target and remains in the existing later regularized-double-shuffle
target. This keeps the polynomial-extension proof from importing its consumer.

## Library and supplier boundary

Every original `baseline.declarations` entry was checked by opening its actual
Lean source **at the pinned Git commit**, rather than by name or current-library
proximity. The original 19 entries are correct; none was removed. The only new
entry is `PhragmenLindelof.horizontal_strip`, read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`.

| Baseline declaration(s) | Verified contract and limitation |
| --- | --- |
| `Complex.Gamma_mul_Gamma_eq_betaIntegral` | Positive real parts of both parameters; Gamma/Beta identity used in continuation |
| `Complex.Gamma_mul_Gamma_one_sub` | Reflection identity with Mathlib's total-value convention |
| `Finsupp.single`, `Ideal.Quotient.mk` | Free coordinate vector and canonical quotient map; no motivic identities supplied |
| `LinearIndependent`, `Matrix.det`, `Submodule.span` | Actual linear-algebra definitions, finite-square determinant and span |
| `PowerSeries.derivative`, `PowerSeries.exp`, `PowerSeries.mk` | Exact formal coefficients; exponential substitution retains zero-constant requirement |
| `PowerSeries.substInv` | Requires invertible linear coefficient; inverse identities also retain zero constant term |
| `intervalIntegral` | Oriented interval integral; integrability and endpoint limits are additional obligations |
| `ordinaryHypergeometricSeries` | The ordinary ₂F₁ formal multilinear series, not ₃F₂ or analytic continuation |
| `riemannZeta`, `zeta_nat_eq_tsum_of_gt_one` | Ordinary complex zeta and natural k>1 tsum; not an MZV library |
| `riemannZeta_two`, `riemannZeta_four` | Exact π²/6 and π⁴/90 complex evaluations |
| `TauCeti.TensorWords.of`, `.deconcatenation` | Pinned TauCeti `f790474821cf4256814db967cb154e7af3d0c369`: degree-zero words and every cut, including outer cuts; no shuffle product |
| `PhragmenLindelof.horizontal_strip` | Closed-strip continuity/holomorphy, both boundary bounds, and growth exp(B exp(c|Re z|)) with c<π/(b−a) |

The reviewed PS.8/PS.9 library audit agrees: generic ₂F₁, ordinary zeta,
tensor-word coalgebra and formal-series operations exist; the selected family
geometry, motivic path quotient/coaction and Hoffman theorem do not.

The current [IntegralLattices roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/070dc2becd74419e76303ede84b465ed4a69461f/TauCetiRoadmap/IntegralLattices/README.md)
and its suggested file were read. **5H and 6A already own** primitive-embedding
uniqueness in an even unimodular ambient lattice and indefinite classification.
The packet imports those contracts for the quartic marking; it does not plan a
generic replacement for Nikulin. The atlas only indexes the retired Completed
predecessor, which does not supply those targets. G5 records the catalogue link
needed when the upstream snapshot is refreshed. It is not a mathematical gap or
a request to change upstream. Completed ContourIntegration and HodgeStructures
were read; their generic theories are not recreated.

The actual C5 Gauss–Manin, Polylogarithms P.1, MC.2/MC.3/MC.4/MC.6,
CR.5–CR.7, Borel R.3/R.4 and modular R13.3 descriptions/packet statements were
checked. C5 and the polylogarithm part have accepted plans. The MC packet's
`needs_changes` state remains relevant: these are planned supplier contracts,
not claims of finished implementation. The actual general neutral Tannaka
reconstruction node is used, not its diagram-specific automorphism group.

CR.7 does not prove a Dwork comparison; CR.5/CR.6 need a proved log/semistable
model before their stated comparisons apply. R13.3's formal Tate cusp expansion
does not by itself supply analytic Schwarzian comparison; the request names
R12.1 or a source-qualified addition. NC.2 currently supplies unipotent de
Rham/étale structures, so its requested Betti/bar/tangential comparison is now
explicitly an extension with DG locators, not an existing export. The general
relative quotient/resolution interface stays with a geometry owner (G4).

The confirmed RT-AREA-iwasawa-3/8 correction is respected at the PS.2 import:
PS.9 uses P_eff[L⁻¹] and sends L⁻¹ to (2πi)⁻¹. No endomorphism of all
numerical periods or general injectivity is used. The other part owns that
supplier's implementation.

## Remaining obligations and assembly action

- **G1:** prove the actual projective/completed Dwork comparison, invariant
  integral torsion-freeness, rational F-crystal identification, semistable/log
  λ=0 model and compatibility of its transported lattice, connection and pairing.
  SH's boundary computation is not this bridge; SS explicitly leaves comparison
  work open. CR.5–CR.7 and a source-qualified rigid-cohomology addition are the
  proposed generic suppliers.
- **G2:** supply quantitative p-adic convergence estimates for both weighted
  Dwork sums. The boundary matrix retains convergence as a premise and makes
  no asserted p-adic L-value evaluation.
- **G3:** compare relative-cohomology MZV frames with Brown's path generators in
  H before using convergent motivic stuffle. No new divergent-stuffle extension
  is required by the corrected proof route.
- **G4:** link a generic finite quotient/relative A₃ resolution interface to the
  geometry owner. MC.2 provides realisations, not minimal resolutions.
- **G5:** link current upstream IntegralLattices 5H/6A into the atlas catalogue.
  Their exact existing contracts are already read and recorded.

The reader document was reviewed but is not among this issue's editable paths.
Assembly must propagate the packet corrections into it: source titles/locators,
E1–E4 version scoping, the two local based charts, the shifted integral identity,
G3, parity level lowering, explicit source-row/target-column matrix convention,
weight-five test and current IntegralLattices import/G5. No further review work
is deferred. The supplier obligations are implementation/routing work, not an
unverified node in this completed review.

## Node-by-node record

Each row checks its statement, source, prerequisites and proof route; every
definition/construction also has its three API items and three discriminating
tests checked. The packet carries the same full record in `review.checked`.

| Node suffix | Verdict | Independent check |
| --- | --- | --- |
| quartic-pencil | corrected | Checked the order-16 quotient, invariant equation, six A₃ resolutions and smooth/excluded fibres against H §4.1, pp.10–11. Corrected irrelevant section references; generic relative geometry remains G4. |
| quartic-residue | corrected | Checked H Propositions 4.6–4.7, pp.12–13, including the 2πi tube convention, chart restriction and crepant extension. Replaced the Picard–Fuchs section locator. |
| quartic-picard-fuchs | verified | Verified H Proposition 4.14 and independently expanded the corrected E1 pullback. Ω and tΩ have the distinct stated equations; no missing scale is absorbed into an integral marking. |
| quartic-lattice | corrected | Verified the primitive rank-19 polarization, rank-three complement and rational splitting. Corrected Theorem 4.12 attribution and its ambient hypothesis (E3), imported existing current IntegralLattices 5H/6A, and recorded G5 catalogue linkage. |
| quartic-monodromy | verified | Verified all five cycle matrices, Gram preservation and ordered product exactly. Their Gram-conjugated period-row action gives the stated infinity translation and γ₁ reflection; γ₄ is translation-conjugate, as used in E4. |
| quartic-frobenius-series | verified | Verified the harmonic-number Frobenius coefficients and logarithmic basis against H §4.7. Independent exact calculation gives the stated q coefficients after the tΩ normalization. |
| quartic-symmetric-square | verified | Verified LYH Proposition 3.1 at λ=256,ν=1/4 and independently squared the first five ₂F₁ coefficients. Existing Mathlib provides only ordinary ₂F₁; the symmetric-square target is not duplicated. |
| quartic-mirror-coordinate | corrected | Verified zero constant term, unit linear coefficient and formal inverse. Corrected the geometric normalization proof to pull the local formula to t=i rather than equate the γ₁ and γ₄ based paths (E4). |
| quartic-modular-relation | corrected | Checked every coefficient of LYA equation (5.19), printed p.21, and x=1/j versus J=j/1728. Corrected page numbers; the analytic Schwarzian supplier is explicitly requested. |
| quartic-integrality | corrected | Checked LYA equations (6.1)–(6.4), printed p.22, and its quartic application. ℓ=2,m=1 gives integral coefficients; degree-four integrality does not use the prime-degree theorem. Tightened the locator. |
| quintic-pencil | verified | Verified SH §§3.1–3.3: Γ has order 125, smoothness excludes λ=0 and 1+5⁵λ⁵=0, and invariant rank four is distinguished from full H³ rank 204. |
| quintic-formal-connection | corrected | Verified SH Definition 4.2 and Lemma 4.12, including homogeneity, δ and its (24,50,35,10) relation. Separated SS’s affine comparison citation; no integral formal lattice is asserted and G1 remains explicit. |
| quintic-dwork-frobenius | verified | Verified the exponential correction, p⁻² normalization, parameter semilinearity and δF=pFδ. Cup-pairing scaling is retained with its comparison hypotheses; CR.7 is not treated as a proved Dwork comparison. |
| dwork-coefficients | corrected | Verified the Dwork exponential and harmonic-weighted sums. Corrected the nonexistent SH Theorem 6.1 to Definition 6.1, Lemmas 6.2–6.3 and §§6.1–6.4. Convergence is a genuine premise (G2). |
| quintic-boundary-matrix | corrected | Verified the diagonal p³,p²,p,1 and row-3/column-0 correction 24p³Δ₃/25 against SH’s reductions. Corrected the theorem locator. Exact matrix checks give NF=pFN and FᵀJF=p³J without interpreting numerical L-value evidence as a theorem. |
| quintic-crystalline-comparison | corrected | Checked SS §§2–3 and its explicit comparison limitation. The projective/completed, integral and semistable bridge is a precise target with G1, rather than a claim already proved by SH or CR.5–CR.7. Separated the two source references. |
| mzv-indices | corrected | Verified descending positive-index convergence, the empty value and non-example [1]. Separated Brown’s reverse convention from the IKZ citation; no ordinary value is assigned to the divergent series. |
| word-products | verified | Verified both recursive products, multiplicities, units and the 0/1 encoding. Pinned TauCeti supplies pure words and all-cut deconcatenation, including outer cuts, but not shuffle multiplication. |
| iterated-integrals | corrected | Verified the largest-time head convention, interval integrability conditions and endpoint/tangential treatment. Separated the DG tangential source from IKZ. The increasing-time motivic word is explicitly reversed. |
| convergent-double-shuffle | corrected | Verified the two admissible product decompositions and their ζ(3,1),ζ(2,2) consequences. Removed the forward ζ(2,1)=ζ(3) claim from this prerequisite; the existing later regularization node owns that corollary. |
| polynomial-regularizations | verified | Verified IKZ Proposition 1 and its polynomial decomposition/uniqueness proof. T is the formal divergence parameter, with separate shuffle and stuffle algebra structures; each has three discriminating tests. |
| regularization-operator | corrected | Verified the linear triangular operator, factorial coefficient formula and inverse. Corrected equations (2.1)–(2.2); the T² and T³ tests exclude a ring-homomorphism interpretation. |
| regularized-double-shuffle | verified | Verified IKZ Theorems 1–2 and the asymptotic comparison proof. The admissible factor in the extended relation is retained; the [1,2] corollary and [1,1] polynomial check use no numerical ζ(1). Completeness is not asserted. |
| mixed-tate-z | verified | Verified the number-field mixed-Tate t-structure input, adjacent Kummer unramifiedness criterion over Z and exact graded fibre functor in DG §§1–2. The general category of all mixed motives is not a premise. |
| mixed-tate-galois | corrected | Verified the Ext computations, noncanonical free negative-odd Lie generators and regulator/Hodge injection. Added DG Proposition 2.3 for freeness and separated Brown’s grading convention. The actual neutral reconstruction supplier is used. |
| motivic-path-torsor | corrected | Verified DG finite path construction, tangential groupoid and unramifiedness. Corrected Theorem 4.4 page range and identified Betti/bar/tangential comparison as an open NC.2 extension, rather than its current export. |
| motivic-mzv-algebra | verified | Verified Brown’s largest graded stable ideal construction and period map. The whole numerical kernel is not substituted, and ζᵐ(2) stays nonzero. Word reversal matches the numerical encoding. |
| motivic-coaction | verified | Verified Brown Theorem 2.4: cut-segment products are in the first A factor and the retained motivic word is second; empty cuts/segments are retained. Coassociativity and algebra compatibility are correctly required. |
| motivic-f-alphabet | verified | Verified the noncanonical f-alphabet comodule embedding and Hilbert series 1/(1−t²−t³). The dimension result is an upper bound before the basis theorem and does not assume freeness of the MZV generators. |
| coaction-derivation-kernel | verified | Verified Brown Theorem 3.3 with the strict odd range 3≤r<N and N≥2. The joint kernel is the single ζᵐ(N) line, not automatically zero. Projection to indecomposables yields contiguous cuts. |
| motivic-double-shuffle | corrected | Verified SO’s convergent frame-preserving products, correcting the stuffle section to §4.4, pp.23–26. Replaced the invented divergent-extension obligation by Brown’s exact shifted all-two formulas, equation (3.8) and Lemma 3.8; G3 remains presentation transport. |
| zagier-coefficients | corrected | Verified the descending coefficient by whole-word reversal and all three low-weight tests. Corrected Zagier Theorem 1 to p.981 and gave Brown’s dyadic estimates their own source id. |
| zagier-evaluation | corrected | Verified Zagier Theorem 1, p.981, and all-two identities, p.979. Expanded integer/diagonal interpolation and directional exponential growth, with the pinned horizontal-strip theorem and Liouville step; no unsupported numerical interpolation heuristic remains. |
| motivic-zagier-evaluation | corrected | Verified Brown’s motivic coaction induction and joint-kernel argument. Replaced the misleading leading-one premise by the shifted integral identity; positivity of one odd numerical zeta kills the final scalar without period-map injectivity. |
| hoffman-level | corrected | Verified the free enumeration and level span before independence, including empty/weight-five/weight-six tests. Corrected level lowering to parity of contiguous cuts (Lemma 5.5), and added the direct coaction prerequisite. |
| hoffman-cut-matrix | corrected | Verified Brown Definitions 5.8–5.9 and Theorem 6.1/Corollary 6.2. Pinned source rows, target columns and the descending prefix-deletion bijection. Strengthened the weight-five test to actual coefficients, determinant 5/2 and mod-2 column rescaling. |
| hoffman-matrix-invertible | verified | Verified Brown Lemma 7.1 and Theorem 7.3: below-diagonal valuations ≥1 and diagonal column minima ≤0 imply determinant nonzero after column scaling. The corrected matrix orientation supports that argument; original determinant need not be a unit. |
| hoffman-motivic-basis | verified | Verified Brown Theorem 7.4’s weight/level induction, nonzero level-zero period and word count matching the earlier Hilbert upper bound. Weight zero/one conventions are included; numerical independence is not inferred. |
| numerical-spanning | verified | Verified the actual period-map transfer and Brown Corollary 7.5. PS.2 supplies the localized Tate algebra, including L⁻¹→(2πi)⁻¹, so the confirmed RT finding is respected. Numerical spanning and dimension upper bounds are distinguished from conjectural independence. |
| quartic-local-continuation | corrected | Verified NS formula (26) and reflection (39). Corrected the local branch to the marked γ₁ root t=i via s=−it, kept the γ₄ centred coordinate separate, and confirmed E2/E4 against the preprint and exact monodromy maps. |

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PeriodsAndSpecialValues--PS.8.json`: **0 errors, 0 warnings**.
- Source findings passed the shared `source_issues.check_issues` and
  `check_errata.versions_checked` validators; this remains a blueprint packet,
  not a separate errata-format job.
- `lean-check` on the complete suggested file at the existing pinned build:
  **exit 0, no errors, only declaration-uses-`sorry` warnings**. Available memory
  was above the required 20 GiB before each invocation. No language server,
  library build, update or cache fetch was started.
- Exact rational computations independently checked the quartic coefficients
  through degree four and inverse composition, Clausen square, corrected pullback
  on Laurent monomials, all five monodromy Gram identities and ordered product,
  E2 coefficient, E3 norms/primitivity/divisibility, E4 conjugacy, weight-five
  coefficients/determinant/mod-2 rescaling, and quintic residue/pairing identities.
- The Lean rational coefficient determinant and local translation-conjugacy
  examples have actual tactic proofs. The geometric/motivic theorems retain
  placeholders: elaboration is a signature check, not mathematical proof.
- The suggested file is deliberately nonexhaustive, as protocol §13 permits.
  Its comments name the exact missing supplier-dependent geometry, endpoint
  groupoid, Hopf/coaction and valuation signatures. It uses typed core data and
  honest omissions, with no dummy proposition fields or matrix defined by its
  future invertibility.
- All changes are confined to this issue's three deliverables and its handoff;
  `git diff --check` passes. No content/data promotion was performed.
