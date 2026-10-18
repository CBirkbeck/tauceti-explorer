# REV-DESIGN-GeometricFreyMazur: independent review

Reviewer: Claude (session claude-ftr875), issue #1725. The design was written by Codex (codex-gGYY9f, DESIGN-GeometricFreyMazur, issue #1698).

**Verdict: accepted, with corrections made in place.** The packet stays `complete` with every stage `planned`, not `closed`: it has 19 open supplier requests. The analytic volume theory it imports comes from HyperbolicCurveVolumesAndGonality, whose own review is still `needs_changes`.

## What was read and checked

- **Sources.**
  - Bakker–Tsimerman, Annals 184 (2016) 709–744, read in full. The SHA-256 matches the packet; PDF page n is printed page 708+n.
  - The five-page author erratum, read in full, with the page image of p. 4.
  - Abramovich, alg-geom/9609012, read in full.
  - arXiv 1403.7168v1, Proposition 29 (pp. 26–27), added to `sourceVersions`.
  - Bosch–Lütkebohmert–Raynaud, *Néron Models*, §1.2 Proposition 8 (p. 15) and §1.4 Proposition 2 (p. 19), in the maintainer-cleared copy (printed page = PDF page − 9).
  - The existing atlas errata `PAPER-BAKKER-TSIMERMAN-16` (E1–E13) and the paper route brief.
- **Baseline.** All 11 declarations were read at Mathlib 082e2d3 and Tau Ceti f790474: `Matrix.ProjGenLinGroup`, `…mk_eq_mk_iff`, `Matrix.ProjectiveSpecialLinearGroup`, `Matrix.norm_eq_sup_sup_nnnorm`, `Matrix.norm_entry_le_entrywise_sup_norm`, `Subgroup.index`, `Sym`, `Sym.map`, `Sym.map_map`, `Matrix.SL2.commutator_eq_top` (field, a≠0, a²≠1; a=2 works for p>3), and `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field`. All are confirmed; none was removed.
- **Suppliers.**
  - A Sonnet subagent checked all 29 requests and all 43 external supplier nodes clause by clause. It worked against the atlas packets and the upstream READMEs: TauCetiRoadmap main 9a305e19 for FuchsianOrbifolds, AlgebraicCurves, ModularCurves and SchemeAndStackFoundations, and open PRs #913 ModularCurvesPartII, #852 Néron, #850 IG, #849 AbelianSchemes and #848 ComplexComparisonPartII.
  - Its quotes were machine-checked as verbatim. Every finding acted on below was re-read here in the supplier node itself.
- **Duplication.**
  - No other atlas packet, TauCetiRoadmap main roadmap or open TauCetiRoadmap PR plans geometric Frey–Mazur, gonality of modular curves or the repulsion estimates.
  - No other packet cites a GeometricFreyMazur id. GeometricFreyMazur is not one of the 94 Caraiani–Newton roadmaps.
  - One genuine duplication inside ModularCurvesPartII was found and removed (correction 2 below).
- **Build.**
  - `check_blueprint.py` with the pinned declaration index reports 0 errors and 0 warnings. `intake.py check-files` on the three edited files reports 0 problems.
  - An in-memory `assemble(require_distances=False)` with the packet and definition added to the promoted set builds; the roadmap appears with no skipped links.
  - `lean-check` on the suggested file: exit 0, 38 placeholder-proof warnings only, 242 lines.

## Mathematics verified independently

- **Systolic witness (E12).** M_p was checked as follows:
  - Its two word factorizations are exact integer identities.
  - M_p ≡ I mod p, with trace 2p²+2.
  - Under the compact triangle representation, |tr|/p² tends to 27/(4π²)=0.683918… with error O(1/p), checked for every prime class up to p=100003.
  - Both translation lengths are 4 log p+O(1).
  - The published witness U(p)L(−p) is trivial in Ξ(p).
- **Proposition 27 counterexample (E17).** For D∈|L⊠L| on X×X embedded in T₁×T₁, the summed big-diagonal multiplicity is 2d·|PSL₂(F_p)| and the canonical degree is 4d(2g_X−2), so the ratio is exactly 3p/(p−6).
- **Proposition 17 sign (E18).**
  - Take an ordinary cyclic boundary isogeny M≡λI (mod p) of determinant m. Let u be the gcd of M·w at a cusp with primitive vector w, and put v=m/u. The squared ratio of the cusp labels is v/u.
  - The three bicusps (v_j, a v_j) with a²=−1 therefore force u+v≡0 (mod p), so m≥p−1.
  - Those bicusps are within log p+O(1) of (i,γi) and lie on the conjugate index-one locus.
- **Rotation count (E16).** sinh(D/2)=sinh d·|sin(πk/p)|. For R≈2δ log p and d≈ρ_X/2 the true count is of order p^{2δ}, not O(log p).
- **Point-ball comparison requested from HV.4 (E20).**
  - Every step of the Green-identity and coarea derivation was checked: ω=4π dd^c v, v≤n·h(b) on Ω_b, the flux identity N(b)=∫_{u=b}d^c u, h′(s_t)=sinh²(t/2), and the exponential bounds.
  - The example (z,az) gives V(t)/a(t)=1+a²(1−q)/(1−a²q), which decreases.
- **Erratum ratio and Prop 23 coefficient (E4, E10).** Monotonicity of vol/sinh r gives the reciprocal of the factor printed on erratum p. 3. The dd^c coefficient on p. 735 recomputes to −1.
- **Counts and small arithmetic.**
  - ψ(4)=6, ψ(6)=12 and ψ(9)=12 by enumeration, against σ₁(4)=7 and σ₁(9)=13.
  - At p=7: genus 3, 24 cusps, area ratio 7.
  - The minimal hyperbolic |trace| in Γ(7) is 47.
  - (21/100)/24=7/800.
  - The proper-subgroup index ≥ p argument holds via transvection generation.
  - The Hurwitz bookkeeping (D≤2nd(2g_X−2), 2g(C)−2≥D/(2n)) checks out.

## Corrections made

1. **Isogeny descent (GF.9), an error in the design.**
   - GF.9/geometric-prime-to-p-isogeny said that no isogeny over K follows from Hecke containment alone. That is false.
     - The lift through the cyclic correspondence gives f:E→E′ over K̄ with f[p]=λΨ.
     - For σ∈G_K, σ(f)[p]=λΨ=f[p] because Ψ is equivariant. With σ(f)=±f, f[p] invertible and p odd, σ(f)=f.
   - The node now states the scalar relation. GF.9/actual-linear-descent drops the full-SL₂-image hypothesis and proves descent this way.
   - GF.9/characteristic-zero-spread was split. The new node GF.9/characteristic-zero-monodromy (`addedBy`) keeps the full-monodromy statement over any k and cites IG.1/charzero-base-extension.
   - GF.9/geometric-frey-mazur now allows any M_N≥max(M_N^geom,5).
   - Effect: the end theorem's closure no longer runs through Abramovich, Li–Yau and the Luo–Rudnick–Sarnak gap. Those stay targets of GF.8 as the brief asks, and GF.8/no-quadratic-self-twist stays as a theorem of that layer.
2. **Duplication (GF.0).**
   - GF.0/projective-frames restated ModularCurvesPartII:R13.4a/projective-scalar-coarse-quotient, an accepted node with planet "Projective level curve" whose uses already cite Bakker–Tsimerman §§2–3.
     - It is now a `comparison` adapter. It fixes the left-action convention g·(E,[φ])=(E,[φ∘g̃⁻¹]) and the choice of component.
     - Its API, tests and planet were removed. Its tests became acceptance lines, plus one on conjugation and p mod 4.
   - GF.0/hecke-loci now takes T_m, its boundary maps and the ψ(m) pull-push degree from ModularCurvesPartII:R14.1/projective-boundary-hecke-and-degree. It adds only H_m and Hecke curves, and its two degree API items are recast as compatibilities.
3. **Supplier ids (PROTOCOL §3).**
   - Twelve bare-stage requests had exact accepted supplier nodes and were replaced by node prerequisites: ModularCurvesPartII R12.1, R12.2, R12.3, R12.4, R12.6, R13.1, R13.2, R13.3, R13.4a, R13.4b and R14.1, and IG.0.
   - The substitutions:
     - R12.1/pointed-elliptic-uniformization, homothety-and-isogeny-compatibility;
     - R12.2/open-level-uniformization, stabilizers-and-small-levels, projective-prime-level-application;
     - R12.3/compact-modular-uniformization, tate-and-cusp-parameter-agreement;
     - R12.4/fixed-pairing-geometric-connectedness;
     - R12.6/complex-conjugation-comparison, generic-base-change-and-level-compatibility;
     - R13.1/neron-polygon-automorphisms; R13.3/formal-level-cusp-charts;
     - R13.4a/projective-scalar-coarse-quotient, level-h-structures, coarse-level-quotients;
     - R13.4b/generic-component-comparison; R14.1/projective-boundary-hecke-and-degree;
     - IG.1/charzero-base-extension (the IG.0 request named the wrong stage);
     - SF.1/finite-group-quotient, SF.1/galois-descent-quasi-projective, SF.0/spreading-out-models;
     - SF.5/chow-proper-push, flat-pullback, chern-projection; A6/hom-descent-at-full-level;
     - Tau Ceti ModularCurves §2C for φ̂∘φ=[deg φ], which the A3 nodes do not state.
   - Prerequisites the proofs never use were dropped:
     - A3 entries in five GF.8–GF.9 nodes;
     - IG.0/etale-fundamental-group in the classifying map;
     - A6 entries in the spread node;
     - HV.2/analytic-normalization in GF.6/normalized-pullback, whose normalization is algebraic;
     - C4 in GF.10/quotient-resolution.
   - The remaining requests were narrowed to what the suppliers lack:
     - SF.1 records that upstream SchemeAndStackFoundations §1.17 `finiteGroupQuotient_projective` already states projective quotients. Étaleness over the free locus and the cycle morphism to SymⁿZ are still absent.
     - SF.5 now asks only for the Hirzebruch–Jung chain self-intersections and the contraction update.
     - AlgebraicCurves Layer 12 no longer asks for the analytic comparison, which AlgebraicCurves excludes from scope. That comparison is ComplexComparisonPartII's.
     - The FuchsianOrbifolds requests drop clauses stated elsewhere (Layer 0 cyclicity, Layer 5 Euler characteristic, the HV.2 cusp density), and drop the torsion-freeness of Ξ(p), which GF.1 proves.
     - Two requests were added: HV.0 for the half-plane trigonometry (translation length 2arcosh(|tr|/2), the second law of cosines, the rotation identity), which upstream FuchsianOrbifolds lacks; and Tau Ceti ModularCurves §2C.
   - Stage `requires` in the roadmap definition were recomputed from the node prerequisites.
4. **Sources.**
   - 59 of 66 `match` fields were generic ("… is the source input; the statement here fixes the conventions …" or "The cited passage supplies the endpoint …"). All were rewritten from the pages.
   - Locators were made precise in 57 nodes. Nine were wrong:
     - the triangle uniformization is in the opening of §3, not §3.1;
     - Lemma 6, Proposition 7, display (2)–(3) and Lemma 10 sit on pp. 720–722;
     - the reconstruction proofs run to p. 731;
     - the quotient singularities are described on p. 742, not p. 743.
5. **Checks and tests.**
   - 30 generic acceptance lines ("Check the stated hypotheses and constants; …") were replaced by node-specific checks with concrete values.
   - 34 unit-test kinds were corrected from the uniform `characterisation` to `computation`, `degenerate`, `non-example` or `compatibility`.
6. **Wording.** GF.0/quotient-branch-locus attached the orders 2, 3 and p to CM⁺, CM⁻ and SBC "respectively". Its stabilizers are now stated by j-value (order 2 over j=1728, order 3 over j=0, either sign) and order p at singular bicusps. The roadmap's GF.0 and GF.9 descriptions were regenerated from the node statements, which they mirror word for word.
7. **Source issues.**
   - All 20 findings were checked at their locators and confirmed, each with a verdict. Those already in PAPER-BAKKER-TSIMERMAN-16 (E1–E10, E12, E13) now name that id in `known`.
   - E15 ([−1] fixes projective frames) now affects nothing, since no argument uses fineness.
   - **New E22** (erratum Proposition 4.2, p. 4): the overlap of (1/2+δ₃)ρ_X-balls about diagonal bicusps is counted once per point. The cusp count p^{24δ₃} of Proposition 12(c) is missing, and the step is attributed to Theorem 19(b). arXiv v1 Proposition 29 has the same omission. The result is unaffected for δ₃<1/26, and GF.5/bicusp-multiplicity already counts the overlap.
8. **Packet bookkeeping.**
   - The design's first upstream note gave the head of the TauCetiRoadmap branch roadmap/integral-hecke-and-galois-determinants as "main"; it now names main 9a305e19 and the PRs read.
   - Coverage `remaining` lists, which were one sentence copied eleven times, now name each stage's own open requests.
   - Baseline `checked` strings now name their module and pin.
9. **Suggested Lean file.**
   - The module docstring opened with `/-!+#`; it is now `/-!` followed by a heading.
   - The self-twist docstring no longer claims a GF.9 use.
   - One light lemma, `descent_sign_trivial`, states the sign step of the corrected descent.
   - Every statement was read and is true as written: the witness algebra, cyclic degrees, graph adapters, the reflection factorization, the degree obstruction, the subgroup index and the self-twist lemma.

Counts: 66 nodes reviewed, all corrected at least in their source match; 1 node added; 0 nodes removed; 11 baseline declarations confirmed; requests 29 → 19; source issues 20 confirmed and 1 added.

## Checked and left as it is

- **GF.2/cusp-lens.** It cites HV.0/normalized-lens, the disc version. After the unique-lift step the lens sits between two balls with known lifts, so the disc version suffices. HV.4/midpoint-lens is the quotient form and is not needed.
- **HV.2/finite-pushforward.** It is stated for smooth forms. GF.5/cusped-measure combines it with HV.2/cusp-pullback, and the singular cusp density is integrable, so monotone exhaustion gives the formula.
- **HV.4 and HV.5 statements.** The relative-diagonal and conjugate-diagonal statements match their uses: radius ranges r<ρ_X/2, cosh and sinh normalizations, compact X, curvature −1. The conjugate estimate is stated on X×X̄. The consuming nodes keep the conjugate structure explicit (GF.3/conjugate-hecke).
- **CongruenceSpectralGap:CSG.5/congruence-bound.** It gives λ′₁≥21/100 for every congruence subgroup, with area πD/3.

## Reader document (not a file of this job)

`research/blueprint/readmes/GeometricFreyMazur.md` is not among this review's deliverables, and promotion copies it beside the packet. It must be re-rendered from the corrected packet:

- every node's Source line;
- the Acceptance lines of the 30 nodes in correction 5;
- the Checks kinds;
- the Prerequisites lines of the 30 nodes in correction 3;
- the full sections for GF.0/projective-frames, GF.0/quotient-branch-locus, GF.0/hecke-loci and the GF.9 nodes geometric-prime-to-p-isogeny, actual-linear-descent, characteristic-zero-spread, the new characteristic-zero-monodromy and geometric-frey-mazur;
- the "Actual linear monodromy and isogeny descent" argument, which still routes descent through full image;
- the supplier-contract section;
- the source-corrections section, which needs E22.

The reader's other detailed arguments (systolic witness, compact lower bound, signed reconstruction, multiplicity scales, the Proposition 27 shell argument, the point-ball derivation) were read and found sound; the computations behind the witness and the point-ball derivation were redone here.

## Questions for the orchestrator

1. **Reader re-render.** Queue a re-render of the reader from the accepted packet, or allow a follow-up that touches `readmes/GeometricFreyMazur.md`.
2. **Title.** The title "Modular curves, following Katz–Mazur, Part II: …" came from the paper route, but ModularCurvesPartII (TauCetiRoadmap #913) already carries "Part II". A DESIGN-ModularCurvesPartIII job is also pending. The maintainer may prefer a distinct numbering.
3. **HyperbolicCurveVolumesAndGonality.** Its revision should take the three requests addressed to it: the HV.0 trigonometry, the HV.4 point-ball comparison and the HV.6 domination lemma. It should keep the node ids cited here (HV.0–HV.7) stable, or record renames.
4. **Surface-contraction Part II.** The proposed Scheme and stack foundations Part II for surface contractions (restructure entry; brief route in PAPER-BAKKER-TSIMERMAN-16) has no design job yet. SF.4 and SF.5 upstream do not plan cyclic-quotient resolution or Castelnuovo contraction.
5. **New finding E22.** It is a new mistake in the published erratum; it is in the packet's `sourceIssues` with its verdict.
