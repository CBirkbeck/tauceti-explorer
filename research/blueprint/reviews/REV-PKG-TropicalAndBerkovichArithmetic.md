# Independent package review: TropicalAndBerkovichArithmetic

**Verdict: accepted with the corrections below.** Issue #10910; reviewer
`independent-review-REV-PKG-TropicalAndBerkovichArithmetic`; Codex,
session `codex-lYNq4v`; 2026-10-20. The package author was the separate
session `codex-Ey3gzr`. This review changes the package README and adds the
verdict, report and handoff. The accepted packet, Lean file and metadata are
unchanged.

The README retains all 103 accepted targets, all original API and check names,
all 41 definition/construction interfaces and all six worked examples. It has
an opening summary, ownership boundaries, conventions, exact supplier
contracts, ordered layers, examples, dependencies and versioned references.
Its mathematics is organized by construction order and written in original
prose. No source passage or source-ordered summary has been added.

## Corrections

1. The uniform Gelfand transform lands in the **bounded** product of residue
   fields with its finite supremum norm. The full product has no such norm.
2. Radius-zero Gauss points are valid, but the Tate-algebra disc formula needs
   positive radius. The zero-radius point is a closed analytic subspace, not
   an affinoid domain of the line.
3. Universal Tate evaluation now names a complete nonarchimedean normed
   target with contractive scalar map. A bound on coordinates alone does not
   specify those necessary norm hypotheses.
4. Huber (1994), Proposition 4.5(iv), p. 543 is the rigid/adic categorical
   equivalence. It is not the properness comparison. The latter now has its
   separate Zavyalov locator, and a strict closed-subdisc counterexample
   prevents conflating quasi-étale and étale maps.
5. Multiplicity one selects a canonical positive-relative-multiplicity Shilov
   lift even at an isolated tropical vertex. Unrestricted uniqueness of an
   isometric embedded lift needs no isolated vertices. The two singleton
   lifts of `{0}` in G_m explicitly disprove the old formulation. Corrected
   BPR theorem, remark and corollary labels and the worked-example gcd page.
6. The Schottky definition now gives the actual group and proper-action
   hypotheses rather than defining the group by the existence of its desired
   figure. Translation on P¹ supplies a free cyclic non-example. The
   limit-hull skeleton formula is restricted to positive genus; the trivial
   group has empty hull, not a canonical point skeleton.
7. Node genus is geometric **stable** genus, not raw residue genus over a
   nonsplit field. Nodes of a chosen skeleton and intrinsic canonical nodes
   are distinguished. The compact minimal-node triangulation requires a
   nonempty node set. A Tate circle is the counterexample to assuming a
   nonempty skeleton suffices. General triangulation existence over complete
   fields is stated separately, with its exact Ducros locator, so the ℂ_p
   integration input does not rely on a local-field-only assertion.
8. The harmonic residue cochain uses the characteristic-zero wide-open
   Cauchy theorem. Reducing a differential can only give the reduced residue
   identity: `p·dt/t` has analytic residue p despite reduced residue zero.
   Added Coleman Proposition 4.3 and the oriented de Shalit application.
9. Replaced weak topology tests by computed projection switches, a continuous
   integer-seminorm path and a pointwise but nonuniform sequence. Strengthened
   the unpunctured vertex-set, model-measure weight and hybrid monomial tests.
10. Topologically ordered all local prerequisites. Moved analytic connectedness
    from old §0.31 to §1.4, after paths, and Tate measure calibration from old
    §6.8 to §7.2, after its analytic quotient. Reordered targets within layers
    and updated every local heading link. The reduced-divisor construction
    now precedes finite testing and Riemann–Roch; its continuity statement
    specifies the graph-part map and its nonnegative-rank domain.
11. General analytification owns properness, separation and coherent GAGA
    before they are used. The later strict adic equivalence is compatibility,
    not a proof of the general or trivially valued case. General preadic real
    quotients use the Tate-gauge and rank-one inputs rather than relying on
    the finite-type strict equivalence.
12. Corrected the Néron supplier description: its R11.3 already includes
    analytic uniformization over complete DVRs as well as the formal
    comparison, and R11.4 has the DVR graph pairing. Those are imported. The
    requested extension includes arbitrary complete rank-one bases, descent,
    valuation kernel and lattice; the owned comparison adds real-length
    skeleta and the analytic Abel–Jacobi square. Removed stale research-status
    wording from the mathematical exposition.

## Source audit

Read the relevant original statements, not search snippets. The 15 sampled
subsections were selected with seed 10910 before correction. This table uses
both old and final section numbers so the sample can be reproduced against
the submitted input. Locators below describe the statements checked; this is
not a summary of the papers.

| Old → final section | Original source and locator checked | Result |
| --- | --- | --- |
| 2.18 → 2.13 | BPR structure, arXiv:1404.0279v1, Theorem 4.11 pp. 13–15, Corollary 4.23 pp. 17–18, §5.3 p. 18; Poineau–Turchetti I.7/II.2 pp. 26–29, 40–43 | Model order and refinement checked; retain subdivision as a union and isometric-extension convention. |
| 2.14 → 2.23 | BPR published offprint, Corollary 4.23, printed p. 112 | Original published PDF obtained; χ<0 uniqueness confirmed. |
| 6.8 → 7.2 | Chambert–Loir, math/0304023v3, Definition 2.4 pp. 5–6 and Tate example pp. 17–18; Yuan Appendix A.5 pp. 117–118 | Model/canonical measure and graph normalization checked. |
| 5.3 → 5.1 | BPR tropicalization, arXiv:1104.0320v3, Theorem 1.4 p. 3; Theorems 5.24–5.25, Remarks 5.26–5.27, Corollary 5.28 pp. 27–28 | Corrected labels; inspected the proof's edge-containing assumption and separated isolated vertices. |
| 3.4 → 3.4 | Baker–Faber, arXiv:0905.1679, Theorems 3.4/4.1 pp. 16–17; Baker–Rabinoff, arXiv:1308.3864, §2.7/Proposition 2.8 p. 5 | Metric Jacobian and length pairing confirmed; complex/algebraic Jacobian is a different supplier. |
| 1.3 → 1.3 | Poineau–Turchetti, Proposition I.6.12 pp. 25–26 and I.8.1–I.8.9 pp. 29–31; Favre–Rivera-Letelier §§3–4 | Tree paths, hyperbolic metric and tangent directions checked. |
| 7.4 → 7.5 | Baker–Rabinoff §2.7/Theorem 2.9 p. 5, Corollary 6.6/Remark 6.7 p. 16; KRZB arXiv:1504.00694 §3.4.1 pp. 21–22 | Valuation periods and graph pairing checked; also read the Abel–Jacobi/homology proof route. |
| 0.27 → 0.23 | Boucksom–Jonsson arXiv:1605.05277, Definition 4.9 pp. 23–24, Proposition 4.12 pp. 25–26, Appendix A pp. 45–46; DKY arXiv:1901.09945v2 §4 pp. 18–22 | Central norm and parameter sign checked; topology does not supply dynamical potential convergence. |
| 0.28 → 0.24 | Scholze, Berkovich Motives, Definitions 2.19–2.20/Proposition 2.21 pp. 12–13; Berkovich (1990), Corollary 1.3.2 p. 16 | Uniform evaluation and spectral kernel checked; corrected the target product. Cleared book read in place. |
| 0.2 → 0.2 | Temkin, Definition 2.2.2.1(i), p. 6 | Bounded convention checked; domination follows from the cited native power trick. |
| 0.3 → 0.3 | Temkin, Definition 2.2.2.1(i), p. 6 | All algebra elements are evaluation coordinates; strengthened tests. |
| 2.3 → 2.3 | BPR published offprint, Lemma 3.2, printed pp. 101–102 | Boundary maps and equal images at loop ends confirmed. |
| 0.21 → 0.21 | Temkin, Definitions 4.1.1.1, 4.1.2.1 and 4.1.3.1, pp. 22–24 | Corrected range from pp. 21–24; atlas and morphism requirements checked. |
| 2.1 → 2.1 | BPR published offprint, Definition 3.1, printed p. 101 | Split marks in distinct open balls and finite annular complement confirmed. |
| 0.33 → 0.32 | Kedlaya–Liu I, arXiv v5, Lemmas 2.3.12/2.3.14 p. 36 and 2.4.17(c) p. 43 | Finite target, arbitrary source, faithful finite étale surjectivity and separate openness scope confirmed. Cleared source read in place. |

The author explicitly left two original-source checks incomplete. Both are
now resolved:

- The published BPR offprint was fetched successfully from Payne's author
  page. Its printed pp. 101–103 and 111–112 were read and collated with the
  arXiv numbering. The author's HTTP 403 limitation no longer applies.
- Huber (1994), *A generalization of formal schemes and rigid analytic
  varieties*, Proposition 4.5(iv), printed p. 543, was read in the original
  cleared scan. Huber (1996), Proposition 8.3.1/Remark 8.3.2 pp. 422–425 and
  Lemma 5.6.8(i) pp. 313–314 were also read in place. This resolved the
  category-equivalence/properness misattribution without copying the scan.

Additional original sources opened for corrections: Temkin Facts 5.1.2.1–2
p. 34; Ducros §§4.5.2, 5.1.12–14, 5.4.12 pp. 271, 292–295, 318–320;
Poineau–Turchetti Definition II.3.21/Remark II.3.22 p. 51 and Proposition
II.3.24/Theorem II.3.26 p. 52; Coleman Proposition 4.3 p. 226 with §III
p. 213 and Theorem 4.2 pp. 224–226; de Shalit §0.3 equations (0.11)–(0.13)
pp. 327–328; Amini–Baker Theorem 3.7 pp. 14–16, §§3.2–3.3 pp. 17–20 and
Appendix A pp. 40–43; Zavyalov Appendix A pp. 84–86. Source text stayed in
scratch or was read in place as required; no cleared source was copied.

## Every-target adversarial pass

Each row covers the named target, its API identities and conventions. All
section numbers here are the final README's. Existing safeguards are recorded
as retained; a successful elaboration is not evidence for these conclusions.

| Section and target | Instances tried | Conclusion or correction |
| --- | --- | --- |
| 0.1 Berkovich spectrum | Zero ring; zero function; max norm on ℝ×ℝ. | Normalization excludes the first two; the product norm is not a point. Native seminorm carrier retained. |
| 0.2 Bounded points are norm dominated | Bound C≠1; powers of an element; incomplete A. | Native power-trick adapter needs neither completeness nor a multiplicative ambient norm. |
| 0.3 Topology of pointwise convergence | Rational/irrational projection switch; integer norm powers p_t; pointwise but nonuniform convergence. | Replaced constant-coordinate and generic continuity checks by computed tests excluding overly coarse, discrete and uniform topologies. |
| 0.4 The evaluation map is an embedding | Two projections at (2,3); empty spectrum. | Full evaluation is injective and inducing, including the empty case. |
| 0.5 Equations for the evaluation image | Zero function; product maximum norm; negative candidate values. | One, multiplication and nonnegativity equations are all retained. |
| 0.6 Closedness of the evaluation image | Kernel appearing in a limit; strict positivity on nonzero elements. | Non-strict inequalities are necessary for the closed-image proof. |
| 0.7 Compactness of the Berkovich spectrum | Zero ring; infinite coordinate product; incomplete ring. | Compactness is closedness inside ∏[0,‖a‖]; nonemptiness is a separate assertion. |
| 0.8 Hausdorffness of the Berkovich spectrum | Two product projections; empty space. | Coordinates separate points; nonemptiness and completeness are unnecessary. |
| 0.9 Pullback of Berkovich points | First/second projections; identity; two composable maps. | Values 2 and 3 at (2,3) fix contravariance and distinguish pullbacks; boundedness is required. |
| 0.10 The norm point of a valued field | 0, 2 and 2⁻¹ in ℝ; trivially valued field. | Values 0, 2 and 1/2 calibrate the specified norm; no completeness hypothesis. |
| 0.11 The spectrum of a normed field is a singleton | a=0; a and a⁻¹; \|·\|^α with 0<α<1 on ℝ. | Inverse domination forces equality; a smaller power fails near zero. |
| 0.12 Seminormed Banach rings | Seminorm-zero ideal; zero completion; two norms on ℤ. | Separate then complete; topology alone does not specify the spectral object. |
| 0.13 Existence of spectral points | Zero ring; archimedean field; trivially valued field. | Nonzero separated complete ring and unit normalization retained for existence. |
| 0.14 Units and spectral maximum | Zero ring unit test; nonzero nilpotent; product ring. | Unit test includes zero ring; maximizing point excludes it. Positive powers and nonmultiplicative spectral radius retained. |
| 0.15 Completed residue fields | Rational point; Gauss point; nonzero seminorm kernel. | Quotient before fraction field, then complete; H-field maps go from pulled-back point to original point. |
| 0.16 Spectra and contractive colimits | ℂ⊗̂_ℝℂ; initial ℤ; empty or singleton diagrams. | Pushout map only surjective; ℓ¹ norm and usual integer norm retained. Filtered comparison is a homeomorphism. |
| 0.17 Affinoid algebras over valued fields | Non-value-group radius; B=K; quotient by T. | Added completeness, nonarchimedean target norm and contractive scalars to universal evaluation; all radii remain positive. |
| 0.18 Valued base change of spectra | Purely inseparable extension; finite normal extension; trivial base valuation. | Isometric extension and completed tensor product retained; quotient group is the separable Galois group. |
| 0.19 Rational and affinoid domains | Closed subdisc; g=f_i=0; annulus with inverse coordinate. | Domain need not be open; unit-ideal guard prevents unwanted fibers. |
| 0.20 Affinoid structure sheaf and acyclicity | One-chart cover; Laurent cover; nonstrict radii and trivial K. | G-covers, faithful strictification to a nontrivial field and finite-module descent are explicit. |
| 0.21 Analytic atlases and morphisms | Doubled disc; nonopen domain inclusion; atlas refinement. | Locally Hausdorff does not mean Hausdorff; net conditions and G-topology retained. Corrected source pages. |
| 0.22 Berkovich analytification | Spec K; A¹ Gauss point; P¹ over trivial and nontrivial K. | Removed reliance on the later strict adic equivalence for general properness/GAGA; those comparisons are owned here. |
| 0.23 Hybrid analytic spaces | Constant P¹ family; t; c·t^m with m negative; series radius too small. | Added computed limit r^m with trivial central coefficient norm; ambient radius and central norm retain the correct sign. |
| 0.24 Uniform Gelfand representation | Zero ring; dual numbers; unbounded tuple (1,2,…) in real factors. | Corrected full product to bounded product with finite supremum norm. Isometry includes zero; maximum attainment does not. |
| 0.25 Idempotents and clopen subsets | Four idempotents of ℝ×ℝ; complementary subsets; zero ring. | Value-one convention retained; source route owns Laurent descent and Newton lifting. |
| 0.26 Archimedean Banach fields | ℝ and ℂ with norm power α; nonarchimedean field; α=0. | Archimedean guard \|2\|>1 and 0<α≤1 exclude the degenerate exponent. |
| 0.27 Uniform units and trivial spectrum | Trivially valued field; irrationally scaled product; weighted characteristic-p Laurent field. | Uniform unit is stronger than a topologically nilpotent unit; bounded scalar converse retains integral-power norm control. |
| 0.28 Normalized rank-one adic quotient | Nontrivial analytic field; varying A⁺; nonuniform original norm. | Only the normalized maximal rank-one quotient is M(A); existing coarsening existence is imported. |
| 0.29 Rational traces and Hausdorff localization | Closed rational trace; neighborhood refinement; finite étale map. | Trace is not declared open; localization is the stated colimit and henselian construction. |
| 0.30 Strict Berkovich–adic equivalence | Strict subdisc inclusion; proper map; partially proper étale/smooth map. | Replaced a tautological check by a boundary counterexample. Corrected Huber 1994 attribution and retained quasi-étale/quasi-smooth distinctions. |
| 0.31 Real quotient of analytic preadic spaces | Doubled-origin disc; nonquasicompact partially proper open; non-finite-type analytic chart. | Tautness guards Hausdorffness. Replaced sole strict-comparison dependency by general gauge and rank-one quotient inputs. |
| 0.32 Surjectivity detected by residue fields | Zero map to finite A-module; one factor of A₁×A₂; zero ring. | Finite target/cokernel and faithful finite étale hypotheses retained; algebraic tensors and openness distinguished. |
| 1.1 Gauss points, discs and projective line | r=0; unit Gauss point; two centers in one disc. | Tate algebra formula now requires r>0. Radius zero is a closed analytic point, not an affinoid domain. |
| 1.2 Four types of points | Type IV over nonspherically complete K; type I over nonclosed K; constant i in Hahn model. | All four types retained; complex coefficients and rational exponents distinguished. |
| 1.3 Paths, tangent directions and hyperbolic metric | Concentric Gauss points; classical endpoints; type-III directions. | Logarithmic distance and infinite endpoint distance fixed; branch count is in the split algebraically closed range. |
| 1.4 Connected algebraic curves remain connected | Proper connected curve; removing finitely many classical points; unpunctured P¹. | Moved connectedness after line paths. General proper GAGA is already a Layer 0 input. |
| 1.5 Annular skeleton and deformation | Open versus closed ends; inverse coordinate a/T; degenerate annular modulus. | 0<r<R and a≠0 retained; reversing coefficient is a₋₁ and modulus is unchanged. |
| 1.6 Integral slopes of analytic units | T^n; T−a with zero on annulus; n negative. | Integral slopes require an analytic unit on the whole annulus; breakpoints cannot be suppressed. |
| 1.7 Virtual annuli and metric descent | Split annulus; m conjugate components; an end-swapping form. | Geometric length, descended modulus and folding data stay distinct. |
| 2.1 Semistable vertex set | P¹ with one Gauss vertex or none; two marks in one ball; loop annulus. | Strengthened the empty-mark test to a positive example and a failed vertex set. Loops and separated punctures retained. |
| 2.2 Skeleton of a semistable decomposition | No annuli; interior annular point; classical puncture. | Skeleton includes edge interiors and rays, while only its completion includes punctures. |
| 2.3 Limit boundaries of semistable components | Ball boundary; two-ended annulus; self-loop annulus. | Two abstract ends may have the same image; corrected collar/gluing conditions retained. |
| 2.4 Ball components off the skeleton | Residue ball attached inside an edge; vertex-attached ball. | Boundary is unique but need not lie in the original vertex set. |
| 2.5 Closure and punctures of the skeleton | Proper skeleton; puncture ray; its classical endpoint. | Topological completion and finite metric completion are not conflated. |
| 2.6 Disc characterization of the skeleton | Open ball avoiding V; neighborhood meeting V. | Disjointness from the vertex set is essential to the disc criterion. |
| 2.7 Retraction onto the skeleton | Vertex; edge interior; two points in the same ball. | Retraction fixes the full graph and collapses precisely the complementary balls. |
| 2.8 Continuity of skeletal retraction | Vertex with infinitely many residue directions; annular end. | Star neighborhoods must control all but finitely many ball branches; componentwise continuity alone is insufficient. |
| 2.9 Connectedness of the skeleton | Connected algebraic curve; completed puncture ends. | Connectedness follows from surjective retraction and does not acquire spurious components at ends. |
| 2.10 Rank-one semistable reduction | Dense value group; nonnoetherian valuation ring; nonsplit marked points. | Rank-one formal semistable theorem remains a genuine extension of the DVR case, with finite splitting/descent. |
| 2.11 Formal models and metric dual graphs | uv=π³; self-node; two different nodes between components. | Length is 3v(π); graph retains loops and multiple edges; model domination matches inclusion. |
| 2.12 Vertex genera and analytic genus | Good reduction of genus g; Tate loop; potentially good-reduction residue-genus drop. | Imports algebraic genus invariance in its valid range and owns rank-one comparison; stable genus used over nonsplit bases. |
| 2.13 Refinement and valued extension | Insert a point in an edge; attach a tree; ramified normalized valuation. | Old edge is the union of new subedges. Isometric extension preserves length; renormalizing valuation rescales it. |
| 2.14 Existence of a semistable vertex set | Two punctures in one residual ball; empty marks. | Use adapted refinement after semistable existence, not arbitrary vertex addition. |
| 2.15 Marked skeleta and puncture rays | P¹ minus 0,∞; one puncture; completed classical endpoint. | Marks give labeled infinite rays, not loops or finite-length endpoints. |
| 2.16 Locally finite triangulations and analytic nodes | Split annulus; good-reduction elliptic point; Tate circle; noncompact infinite triangulation; ℂ_p base. | Corrected stable genus, canonical versus chosen nodes and nonempty-node hypothesis. Added general prescribed-vertex existence separately from local-field minimality. |
| 2.17 Triangulated curves and formal automorphisms | Normal flat nonsplit model; nonsemistable model; semistable uv=a chart. | Component points alone are not always a triangulation; formal automorphism extension and converse reconstruction are distinguished. |
| 2.18 Strong deformation onto a skeleton | Infinitely many ball branches at a vertex; a loop. | Strong deformation fixes the graph at every time; continuity at vertices is a named proof obligation. |
| 2.19 Contractions of genus-zero vertices | Rational tail; bridge between two punctures; one-vertex self-loop; positive-genus vertex. | Puncture exclusions, two distinct incident edges and genus-zero guard prevent invalid contractions. |
| 2.20 Intrinsic minimal skeleton | P¹ with χ>0; G_m with χ=0; elliptic skeleton. | Intrinsic closed-ball criterion retains χ≤0 and minimal vertex-set hypotheses. |
| 2.21 Stable vertices of a hyperbolic curve | Positive-genus point of low valence; hyperbolic punctured P¹; Tate χ=0. | Valence≥3 or positive genus characterizes stable vertices only in χ<0 range. |
| 2.22 Uniqueness of the minimal skeleton | Tate circle with different singleton vertex sets. | Minimal skeleton is unique as a subset; a minimal vertex presentation need not be. |
| 2.23 Uniqueness of stable vertices | Hyperbolic curve; Tate curve χ=0. | Stable-vertex uniqueness keeps the strict Euler-characteristic guard. |
| 3.1 Metric graphs with loops and vertex genus | One loop; parallel edges; midpoint subdivision; one-point graph. | Half-edges, positive lengths and genus-zero subdivision preserve the right topology and genus. |
| 3.2 Divisors and rank on metric graphs | Interior-point divisor; tree; circle; loop canonical degree. | All-point rank differs from degree and from vertex-only rank. |
| 3.3 Graph Laplacians and potentials | f=t and f=t²/2 on [0,L]; constant function on loop. | Δt=δ_L−δ_0; quadratic interior density is negative and endpoint atoms restore total mass zero. |
| 3.4 Metric Jacobian and Abel–Jacobi map | Tree; circle of length L; attached bridge. | Jac(tree)=0 and Jac(circle)=ℝ/Lℤ; Abel–Jacobi can contract bridges and need not embed the graph. |
| 3.5 Riemann–Roch for metric graphs | Tree; genus-one circle; arbitrary irrational lengths. | Rank/degree examples agree with Riemann–Roch. Metric theorem retains all-point rank and the rational-approximation proof input. |
| 3.6 Specialization of algebraic divisors | Two points in one ball; interior retraction point; closed point of degree d. | Specialization preserves total degree and never rounds to the vertex set. |
| 3.7 Slope formula for rational functions | T on G_m, with directions to 0 and infinity; compact skeleton. | Slopes are +1 and −1 for −log\|T\|; principal specialization uses Δ with that sign. |
| 3.8 Metrized complexes and their divisors | No edges and positive-genus component; self-loop; nonzero outgoing slope. | Component divisor carrier and two distinct node markings are essential; slopes add marked-point chips. |
| 3.9 Finite rank-determining sets | Genus-zero components; loop needing subdivision; repeated versus distinct test points. | Moved reduced-divisor construction before finite testing and Riemann–Roch. Continuity now specifies the graph-part map and its nonnegative-rank domain. |
| 3.10 Riemann–Roch and rank determination on complexes | One residue curve without edges; all components P¹; divisor representatives within one class. | Recovers algebraic and graph Riemann–Roch; uniqueness is of component classes, not chosen effective representatives. |
| 3.11 Specialization inequality | Positive-genus good reduction; arbitrary rank-one valuation. | Direction is r_X≤r_C≤r_Γ; graph alone loses residue-curve information. |
| 4.1 Torus tropicalization | G_m over trivially valued K; χ^u=a; T↦T^n. | Analytic points give full ℝ even when classical valuations vanish; character pairing fixes map direction. |
| 4.2 Initial degenerations over valued fields | T=a; doubled point; weight outside original value group. | Retain nilpotent lengths and extension/translation choices; no unconditional valuation-ring finite-presentation claim. |
| 4.3 Fundamental theorem and polyhedrality | Trivial valuation; nonreduced scheme; nonpure dimension. | Support equality ignores nilpotents, while purity needs pure-dimensional X. |
| 4.4 Tropical weights and balancing | Doubled hypersurface; standard tropical line; nonprimitive ray vector. | Generic scheme length and primitive quotient-lattice direction are both necessary for balancing. |
| 4.5 Relative point and edge multiplicities | Non-Shilov point; n=−2,0,p; two annular branches. | Relative multiplicity is zero off Shilov boundary, degree includes inseparability, and contracted maps are excluded from finite-degree assertion. |
| 4.6 Tropical multiplicity formula for curves | Expansion factors 2 and 3 over one edge; contracted branches. | Total weight is 5; initial lengths and generic analytic degrees remain separate in the proof. |
| 4.7 Expansion factors from coordinate slopes | Slope tuple (−2,4); (0,0). | Expansion is respectively 2 and 0; lattice gcd is connected to analytic lengths by earlier comparison. |
| 4.8 Sturmfels–Tevelev pushforward | T↦T^−2; T↦T^p in characteristic p; contracted cell. | Use positive target/image lattice index; δ and index both equal \|n\|, including inseparability. |
| 5.1 Multiplicity-one isometry criterion | Doubled initial component; isolated vertex {0} for G_m; non-value-group point. | Canonical positive-relative-multiplicity Shilov lift retained; unrestricted uniqueness requires no isolated vertices. Corrected theorem/remark/corollary labels. |
| 5.2 Faithful tropicalization on a graph | T² coordinate; two overlapping primitive edges; long arc in a circle. | Faithfulness includes global injectivity and intrinsic graph metric, beyond gcd one. |
| 5.3 Functions separating edges and vertices | Slope vector (2,1); functions with zeros/poles; vertex collision. | Approximation and residue lifting are owned analytic inputs; closed graph in toric compactification separates points globally. |
| 5.4 Faithful tropicalization of a finite subgraph | Plane embedding contracting a Tate loop; finite point graph. | Existence requires new separating coordinates and a suitable toric target; arbitrary initial embeddings are not automatically faithful. |
| 5.5 Faithfulness under domination | Adjoining coordinates; equivariant dominating map; ambient shortcut. | Expansion indices multiply, so index one persists; use intrinsic image-subgraph lengths. |
| 5.6 Faithful tropicalization of marked rays | Two punctures with equal eventual slope; coprime pole orders; compact core. | Coprime orders and separate coordinates control infinite tails; compact faithfulness alone does not. |
| 6.1 Formal and model metrics | Trivial model; model of L²; integral unit change of frame. | Root rule and nontrivial base norm retained; frame of L^e is not a chosen frame of L. |
| 6.2 Chambert–Loir model measures | Good reduction; trivial line; degree 6 for L²; multiplicity 2 with degree 3. | Strengthened weight check to computed values 3 and 6. Tensor exponents, residue degrees and special-fiber multiplicities retained. |
| 6.3 Semipositive and integrable metrics | Component degree −1 with positive total degree; constant metric scaling; difference of positive metrics. | Semipositivity is componentwise; integrable curvature may be signed. Uniform distance is on one fixed bundle. |
| 6.4 Limits and local intersection heights | Positive approximants; arbitrary oscillating signed potentials; properly intersecting sections. | Positivity/mass control and logarithmic integrability guard weak limits and height recursion. |
| 6.5 Hsia kernels and positive energy | ρ=δ_x−δ_y; −ρ; nonclassical and classical diagonal atoms. | E(ρ,ρ)=d(x,y)>0 but E(ρ,−ρ)<0. Retain nonclassical diagonal and the continuous-potential scope. |
| 6.6 Admissible Green functions and measures | Point graph of genus g>0; circle; bridge; loop; genus zero; three parallel edges. | 1/g requires positive genus; deleted bridge resistance is ∞, loop resistance 0; mass is one. Arbitrary lengths need network proof. |
| 6.7 Model potentials and Laplacian approximation | Affine potential; oscillations n⁻¹sin(n²t); inserted subdivision vertex. | Uniform convergence does not control Laplacians; derivative convergence and total variation bounds are explicit. |
| 6.8 Metric–Laplacian and admissible corrections | F=t on interval; s=c·t, F=c·f; thickness n. | Curvature change is δ_0−δ_L. Natural-log conversion adds no second c factor to curvature mass. |
| 7.1 Tate analytic quotient and skeletal circle | q=1 excluded; z↦qz; q↦q^n with n≥1. | Circle length is −log\|q\|>0; quotient coordinate and differential dz/z descend. |
| 7.2 Good-reduction and Tate calibration | Good reduction; Tate degree-one circle; constant change of metric. | Moved after Tate quotient. Canonical measure is ds/L; L/12 fixes mean zero while rigidification fixes the metric constant. |
| 7.3 Schottky groups and fundamental domains | diag(q,1); determinant/trace equality; unipotent translation; trivial group. | Replaced circular definition by the source group/action hypotheses and explicit non-Schottky free cyclic example. |
| 7.4 Schottky–Mumford uniformization | Rank 0; rank 1; potential versus split degeneration. | Hull-skeleton formula now restricted to g≥1. Trivial group has empty limit hull; a P¹ point skeleton requires a choice. |
| 7.5 Analytic Jacobian periods | Tate period q; good-reduction toric rank zero; general real edge lengths. | Imports existing DVR analytic uniformization and graph pairing; extends uniformization and descent to rank-one bases and proves the analytic Abel–Jacobi comparison. |
| 7.6 Berkovich–Coleman path integration | Zero form/path; T^n dT including excluded n=−1; dT/T; Tate loop. | Log branch and path class are necessary; global primitive-sheaf existence remains a named construction, not just formal antiderivation. |
| 7.7 Annular integration and residue monodromy | p·dt/t; inversion t↦a/t; two ends of a loop; logarithm branch change. | Replaced invalid reduction-only harmonicity proof by exact ℂ_p wide-open residue theorem. Reduced residue zero does not imply analytic residue zero. |
| 7.8 BC–abelian tropical correction | Good reduction N=0; q-shift of a Tate lift; valence-two star; zero correction map. | Q-linear valuation correction uses v_p. Agreement bound is codimension ≤d−1, including full kernel for zero map. |

## Library, ownership and prerequisite audit

Read AnalyticToricGeometry and UniversalCovers as upstream form references,
together with UPSTREAM_GUIDE. Checked the current upstream roadmap checkout
at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched by the mathematical
objects, fields and hypotheses of every target, including all nine roadmaps
newer than the atlas snapshot and the Completed roadmaps. Read the relevant
statements rather than treating a name match as coverage. The reviewed
AUDIT-39 and its accepted review were also read.

| Targets covered | Existing objects examined and ownership decision |
| --- | --- |
| 0.1–0.16 | Pinned Mathlib's native multiplicative seminorm, bounded-map, power-trick, product/induced topology and compactness declarations are imported. The dominated spectrum and its adapters are the new interface. Current complex Banach-algebra Gelfand transforms do not supply the general Banach-ring residue-field product. |
| 0.17–0.32 | Current Spa, analytic rank-one coarsening and ring separation-quotient declarations were inspected. Rank-one coarsening existence is already imported; uniqueness, normalization and real Hausdorff comparison remain. Ring separation is not the point-space Hausdorff quotient. AdicSpaces supplies valuation classes/topology; AdicSpacesPartII supplies strict acyclicity and formal generic fibers. |
| 1.1–1.7 | Restricted Gauss multiplicativity is current Tau Ceti work; analytic line points, paths, annular homotopies and descent lengths are additional. UniversalCovers and PeripheralActions do not provide these analytic objects. |
| 2.1–2.23 | StableReduction supplies combinatorial nodal multigraphs, component genera, noetherian flat-family genus invariance and DVR semistable reduction. The retained comparisons add metric thickness, rank-one nonnoetherian bases and analytic triangulations. NumericalType's simple intersection graph loses self-nodes and repeated edges. |
| 3.1–3.11 | AlgebraicCurves and current Tau Ceti supply algebraic Riemann–Roch; JacobianChallenge supplies the algebraic Jacobian. IntegralLattices and the discrete weighted Picard cokernel do not supply the all-point real metric Jacobian, graph rank or metrized complex. HodgeStructures' complex tori are a different object. |
| 4.1–4.8 | Current IsConvexPolyhedron and AnalyticToricGeometry's cones, fans and toric gluing are imported. The existing toric scheme interface is complex based; general-K toric geometry is an explicit Part II supplier request. Valued initial degenerations, scheme lengths, balancing and tropical pushforward are retained here. |
| 5.1–5.6 | Algebraic prescribed-pole functions are imported; analytic residue lifting, annular approximation and globally separating functions are additional. No equivalent faithful-tropicalization target was found in current or Completed roadmaps. |
| 6.1–6.8 | SF.5 supplies intersection/Chern/projection interfaces, with the rank-one model specialization extension requested precisely. General measure theory and OperatorTheory's operator results do not provide Chambert–Loir curvature or the graph/line kernels. |
| 7.1–7.8 | EllipticCurves supplies algebraic Tate curves. Néron R11.3/R11.4 already plan DVR analytic uniformization and graph monodromy, now credited explicitly. ColemanIntegration owns local residues/primitives and ED.4 owns the abelian logarithm. The retained targets construct analytic quotients and global path/graph comparisons in the stated larger ranges. |

All 22 Mathlib baseline statements were inspected at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, including their namespaces and
hypotheses. Current Tau Ceti statements read include `ValuationSpectrum.spa`,
`IsAnalyticPoint.exists_coarsenByUnits_mem_spaAnalytic`,
`spaSeparationQuotientHomeomorph`, `PowerSeries.gaussNorm_mul_of_isRestricted`,
`exists_isRiemannRochDivisor` and `IsConvexPolyhedron`.

No additional exact target duplicate requiring deletion was found. All 103
accepted target identifiers remain. The review corrected credit for existing
DVR uniformization and pairing rather than claiming those constructions here.
All nine newer roadmaps were included: AlgebraicVectorBundles,
DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory,
OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and
RealAlgebraicGeometry. Completed searches included ContourIntegration,
EffectiveBounds, OrthogonalL2Bases, RestrictedProducts, HodgeStructures,
IntegralLattices, Multiquadratic and UniversalCovers.

The roadmap is outside the Caraiani–Newton 94-roadmap tier list. No ordered
upward citation, `UPSTREAM:` identifier or FoundationsAndLibraryIntegration
pseudo-supplier remains. PerfectoidSpaces, DiamondsAndVStacks and
ArithmeticDynamics are consumers. External extensions are exact requests to
their owners, not assertions that the narrower supplier already proves them.
The mathematical reader distinguishes those contracts from owned proof inputs.

The 22 inherited proof obligations were checked against their consuming
sections. They remain full construction targets, not omitted steps:

| Final section | Required construction or supplier interface |
| --- | --- |
| 0.20 | Faithful strictification, intersections after completed base change, Čech descent. |
| 0.30 | Affinoid overlap/morphism gluing, tautness and quotient topology. |
| 2.10 | Rank-one formal semistable reduction, finite-extension descent and algebraization. |
| 2.8, 2.18 | Star-neighborhood continuity including infinitely many ball branches and homotopy time. |
| 2.16 | General triangulation existence; locally finite converse formal gluing with nonsplit invariants. |
| 3.5 | Finite reduced-divisor theorem, discrete-to-metric comparison and rational approximation. |
| 3.4 | Finite-model Jacobian exactness, subdivision pairing and direct limit. |
| 3.9–3.10 | Reduced divisors with correct uniqueness, graph-part continuity and finite testing before Riemann–Roch. |
| 4.2 | Valued Gröbner control, dimension and extension for unrealized weights. |
| 4.4, 4.8 | Initial-of-initial cycle comparison, balancing and target/image lattice pushforward. |
| 6.2, 6.4 | Rank-one specialization/projection from SF.5 and Radon limit extension beyond countable descent. |
| 6.6–6.7 | Arbitrary real-length network proof and derivative/variation-controlled approximation. |
| 6.5 | Continuous-potential positivity, followed by general-field measure extension. |
| 7.3–7.4 | Schottky figure theorem and normalized-coordinate construction for the converse. |
| 7.5 | Rank-one analytic Raynaud supplier extension and owned Abel–Jacobi/homology comparison. |
| 7.6 | Global primitive sheaf, interval torsor, homotopy and concatenation. |
| 7.7–7.8 | Exact characteristic-zero residue theorem, harmonic cochain and valuation factorization. |
| 0.25 | Laurent equalizer/closed ideal and Newton idempotent lifting. |
| 0.23 | General Banach-base hybrid analytification and SNC inverse-limit construction. |
| 2.19 | Formal rank-one tail/bridge contractions with puncture and loop exclusions. |
| 4.5 | Canonical reduction degree versus initial length, including inseparability. |
| 5.3 | Residue lifting, regular meromorphic approximation and rational sublevel domains. |

## Definition/API and Lean checks

All 41 definition/construction targets have at least three named
checks. I read them for discrimination, not just count: the table above gives
positive cases, computed values and failed alternatives. All original API
names and check names remain; stable-genus and general-triangulation APIs and
additional boundary controls strengthen them. Every heavy definition appears
in the Lean closing comment rather than through an admitted carrier.

`Suggested.lean` is unchanged at 130 lines. It imports Mathlib, has one module
docstring and the intended namespace, uses real-bodied light definitions,
states seven milestones and proves four examples. No admitted data, admitted
example, auxiliary theory chain or weakened later-layer encoding occurs.
Twelve representative signatures were read against the README:

| Lean declaration | README match checked |
| --- | --- |
| Spectrum | Native MulRingSeminorm with bound for every a; normed commutative ring, not necessarily complete or a field. |
| toSeminorm / eval | Forget only the bound and evaluate on any ring element. |
| ofSeminorm | Exact native point and its pointwise domination proof; no invented construction. |
| topology | Induced from the full product ℝ^A. |
| normPoint | Every normed field, including incomplete and trivially valued fields. |
| compactSpace | Every normed commutative ring, including empty spectrum. |
| t2Space | Same carrier/topology; no nonemptiness assertion. |
| nonempty | Complete, nontrivial, norm-one ring. |
| isUnit_iff | Completeness and ‖1‖≤1, including the zero ring; positivity rather than vanishing detects units. |
| spectral_maximum | Nontrivial complete norm-one ring; positive powers n+1 avoid division by zero and realize the root-norm limit. |
| exists_comap | Bounded unital ring homomorphism; continuous pullback with all evaluations prescribed, no completeness assumption. |
| eq_normPoint | Every normed field; inverse bounds, not algebraic closure or completeness. |

The four proved examples cover the zero-ring contradiction, exact recovery of
the native point, coordinatewise continuity and reciprocal norm evaluation.
`lean-check` exited 0 in the shared pinned environment, with exactly seven
`declaration uses sorry` warnings and no others. Available memory exceeded
20 GB before compilation. No language server, private Lake project or build
was started; no commands were run in the read-only upstream environments.

## Validation and remaining work

The submission checks and their results are recorded in the handoff. The
accepted packet was checked but never changed. The final Markdown link and
prerequisite audit finds 103 targets, no missing local target dependency, no
forward local prerequisite and no broken local heading link.

There is no unresolved package-review defect. Formalizing the targets and
fulfilling the named supplier extensions remain future mathematical work;
acceptance does not claim those proofs have been written. The maintainer
controls any upstream port. No second issue was claimed and no suspicious
instruction was encountered in the untrusted source material.
