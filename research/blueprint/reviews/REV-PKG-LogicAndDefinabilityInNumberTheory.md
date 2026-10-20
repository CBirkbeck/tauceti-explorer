# Independent package review: LogicAndDefinabilityInNumberTheory

Issue: #10904. Reviewer: Codex (GPT-6), session `codex-klmxL1`. Date: 2026-10-20.

**Verdict: needs_changes.** This review is complete. The package is not ready for the
TauCetiRoadmap draft PR: the proposed all-width rough-curve repair and its Hodge
consumer comparison are not established; the marked-endpoint step in the abelian
group-action application remains unsupported; several essential geometric and
arithmetic suppliers have no matching registered stages. These are mathematical
and dependency gaps, rather than Lean elaboration failures. The existing explicit
gap statements have been retained. Corrections that can be justified from the
sources and current libraries have been made directly in the README.

## Input, independence and scope

Reviewed the package introduced by PR #11486, commit
`bd5a32fbe0247ab616097dbcd6b4ee40a096f90f`, by another worker, against the accepted
127-node packet. I did not author that package or its plan. No packet, consumer,
supplier package or upstream file was edited. The package README is the only
existing deliverable changed; Suggested.lean and metadata.toml already satisfy
their respective form checks.

Read WORKERS.md, PACKAGE_REVIEW.md, UPSTREAM_GUIDE.md, PROTOCOL §§5, 13, 15 and 20,
and the expansion source-fidelity rules. Compared the upstream EffectiveBounds
and RealAlgebraicGeometry README/Suggested pairs, the atlas AdicSpaces README,
and the relevant DifferentialGeometry and GlobalQuadraticForms material. The
README retains its Summary, boundaries, conventions, supplier contracts, seven
ordered layers, per-definition API/Checks, examples and local source locators.
There are no source excerpts or section-by-section source summaries in the changes.

## Fidelity and shape

- All 127 target anchors remain: 73 theorem, 24 construction, 17 definition,
  eight comparison and five lemma nodes in the input. No target was omitted to
  shorten the package.
- All 165 input API names and 154 named Checks remain. The 41 definition or
  construction nodes each retain at least three discriminating Checks.
- Direct comparison of the input statements and README found 113 normalized
  matches and 14 existing precision changes. The latter preserve the target
  while making such conditions as finiteness, support, chosen parameters or
  supplier scope explicit. They are not weakened replacement milestones.
- Suggested.lean has 180 lines, three real-bodied light definitions, ten theorem
  targets and six proved examples. It develops no auxiliary theory, introduces
  no admitted carrier, and lists the heavier README objects in its closing
  comment. No example is admitted; there are two per retained definition.
- `metadata.toml` is the single fitting category line `topic = "math.NT"`.

## Corrections made

1. **Current real algebraic geometry boundary.** The current upstream elimination
   statement is over ℝ, not all real closed fields. Scoped the import accordingly.
   The current Tau Ceti semialgebraic QE modules still require a projection-closure
   hypothesis; they cannot be used to silently discharge it.
2. **Valuation patch dictionary, §1.12.** Identified current spectrum constructors
   and patch-clopen declarations. Specified the map from a native valuation
   subring, its valuation-equivalence inverse, and the pullback of a basic open:
   membership of a/b when b is nonzero, empty when b is zero. Membership of zero
   is the whole space. This adds the field dictionary rather than constructing
   another valuation spectrum or patch topology.
3. **Simple henselian generator, §1.13.** Read Kuhlmann–Novacoski's original
   Theorem 1.2 and its proof, including Definition 3.1 and Lemmas 3.2–3.3. Added
   that source, the distinguished-prime CRT/primitivity argument and the
   reduction X^(n−1)(X−1). The trivial residue extension permits residue generator
   1. No rank-one hypothesis is introduced. The separate arbitrary-rank
   henselization construction source remains unresolved.
4. **Split quadratic root field, §1.20.** Removed an unnecessary characteristic
   restriction from the quotient-algebra Check: X²−X has distinct roots 0 and 1
   in characteristic two as well, with derivative 1. Its chosen root field is
   still the original field, whereas the quotient algebra is a product.
5. **Pas original proof, §§1.3 and 2.2.** Read the page images of the original
   preparation and relative-QE proofs. Added the degree induction, derivative
   preparation, least Taylor-term partition, henselian recentering and strongly
   definable-centre steps. Correct locators are §2.4 p.140; Theorem 3.2
   pp.142–143, proof §§3.6–3.8 pp.144–155; Theorem 4.1/proof pp.155–157;
   Lemmas 3.5 and 3.7 pp.143–144 and 151–154. Kept the explicit conversion from
   Pas's infinity-at-zero convention to guarded integer-valued atoms.
6. **Full integrability-locus contract, §2.4.** Added the original
   Cluckers–Gordon–Halupczok zero-locus and everywhere-integrable interpolation
   theorems. The full locus need not be definable. The new control is the
   constructible function ab−c, constant on the whole local field, with a,b,c in
   the integer sort. Its integrability locus is c=ab, which is not Presburger
   definable. Added the constructible zero certificate, replacement, rational
   coefficient denominator clearing, residual descent and Presburger summation
   steps. Specified an elementary exponential-polynomial zero bound for the
   fixed integer exponents so this step does not depend on later o-minimality.
   Original parametric rectilinearization and analytic chart inputs still need
   complete proof-source treatment.
7. **Normic-bundle supplier.** Corrected CTV Corollary 3.2 from pp.13–14 to p.10,
   with Proposition 3.4 pp.10–14. Recorded the cyclic prime-degree extension,
   separable product of two irreducible degree-p polynomials, and the effective
   symmetric-power degree 2p+1. A general zero-cycle pairing is insufficient.
8. **Trace-set locator, §4.21.** Koenigsmann Remark 8(a) starts on p.79; its proof
   continues to p.80. Corrected the claim that its statement is on p.80.
9. **Analytic-closure sources, §§6.17–6.18.** Added the Peterzil–Starchenko author
   copy: Theorem 4.4 and affine Chow Corollary 4.5, p.12. Its lower-dimensional
   ingredients and the singular/projective extensions remain separate tasks.
10. **Determinant estimate, §6.24.** Replaced the incorrect Duke 2004 citation by
    Pila, *Integer points on the dilation of a subanalytic surface*, Quarterly
    Journal of Mathematics 55 (2004), 207–223. Read Lemma 3.1 p.6,
    Proposition 4.2 p.8 and Remark 4.5 p.9 of the 18-page author copy. Added
    Taylor degree counts, denominator bounds for coordinatewise heights, the
    exponent tending to zero, and the finite-configuration convex-hull argument
    within an open parameter cube. The zero-dimensional image is treated
    separately. This original-proof acquisition gap is resolved.
11. **Counting/Galois bridge, §§6.30–6.31.** The ambient family must be definable;
    its finite Galois subsets need not be. Count in the full inverse image of
    V in the fundamental set. Use Galois-invariant avoidance and transport the
    special subvariety back from the selected conjugate lift. Do not assume the
    complement of an infinite union of special loci is definable.
12. **Other bibliography.** Corrected the van den Dries–Miller revised copy to
    41 pages and replaced nonexistent “Corrected Theorems 1.1–1.2” in the BKT
    erratum citation by §1.1 p.1 and Theorem 1.2/proof pp.2–3.

## Source audit

All source identities below refer to the package's linked author/publisher copies,
accessed 2026-10-20. Page numbers are printed author pages unless a published
range is given. Public PDFs were read only as source data. No restricted book
copy was obtained. In particular, the uncleared *Tame Topology* book was not used.

### Reproducible sample of 15

The sampling population is the 114 distinct sorted (sourceId, locator) pairs from
the input nodes, excluding sourceIds starting `mathlib` or `freer`. Used
`random.Random(10904).sample(pairs, 15)`. All selected passages were opened and
read, including their hypotheses and immediate use rather than only search hits.

| Source and selected locator | Result |
| --- | --- |
| Pila 2009, Definition 3.2/Proposition 3.4, author pp.5–6; Selecta pp.157–158 | Correct block/image-dimension scope. |
| GWZ mirror, Proposition 4.1, Claim 4.2, Lemma 4.3, pp.20–21; published pp.537–538 | Correct; all three begin on p.20. Relative-form and lifted-locus conditions retained. |
| Gao–Habegger, §5 Lemma 5.2/Proposition 5.3, pp.19–22 | Locator correct; confirmed the unresolved marked-endpoint use. |
| Koenigsmann, Corollary 15/Proposition 16, pp.84–86 | Correct, including positivity and dyadic guards. |
| BKT, §4.2 Lemma 4.2, pp.13–14 | Correct finite-width sector-cover scope. |
| Koenigsmann, §1 Corollaries 3/3′ pp.74–75; §3 p.91 | Correct conditional transfer; no H10(ℚ) conclusion. |
| Dittmann–Pop, Lemma 3.9(1), pp.11–12 | Correct; followed its generator reference to the original proof. |
| Koenigsmann, preservation criterion before Proposition 23 p.91; Remark 24 p.92 | Correct directions for universal/existential preservation. |
| Dittmann–Pop, §3C p.11 opening | Correct membership patch basis; current-library comparison added. |
| GWZ, Example 2.4 p.7, equations (8)–(9) | Correct count and fibre integral; the README already uses the required relative-form minus sign. |
| Tsimerman, §6.1–6.5 pp.387–388 | Correct location; an application outline, not a supplier for all its geometric/arithmetic inputs. |
| Koenigsmann, Proposition 6 pp.77–79; Remark 8(a) | Statement begins p.79, proof pp.79–80; fixed. |
| Koenigsmann, Proposition 23(a)–(d) pp.91–92; Remark 24 p.92 | Correct; relative algebraic closure is conditional, not H10(ℚ). |
| van den Dries–Miller, §2 pp.7–9; §4.1 p.12 | Correct revised-copy locations; corrected total copy length. |
| CL transfer, Theorem 9.2.4 p.46; §9.1 pp.40–43 | Correct uniform specialization and residue-field comparison scope. |

### Every flagged gap/source requirement

The input lists 21 gap categories. Each was revisited. “Read” below means the
specified passage was checked; it does not mean the theorem is formalized or
that all its cited prerequisites have been verified.

| Input category | Review result and exact remaining boundary |
| --- | --- |
| Same-ultrafilter standard-part adapter | Native finite-domain laws checked. The adapter is explicitly a construction target, not a supplied canonical identification. |
| Arbitrary-rank henselization | Dittmann–Pop use checked; original full existence/immediacy/initiality proof still not acquired. Rank-one completion is not a replacement. |
| Simple-reduction generator | Original Kuhlmann–Novacoski Theorem 1.2 p.2, §3 pp.9–11 and proof p.11 read; acquisition gap resolved and proof steps added. |
| Coarsening/patch adapters | Current coarsening and patch declarations read. Field patch pullback specified; arithmetic cut/localization remains the additional planned comparison. |
| Pas original preparation/QE | Original scan images pp.140–157, including complete preparation pp.144–155 and QE pp.155–157, read. Acquisition gap resolved; zero convention remains explicit. |
| Integrability/Presburger | CGH Theorems 2.1.3–2.1.6/proofs pp.1554–1558, uniform versions pp.1559–1560, Theorems 4.3.1–4.3.3 pp.1585–1586 and §4.5 proof pp.1593–1595, 1597 read. Full zero-locus/replacement supplied; original parametric rectilinearization proof still required. |
| Full motivic pushforward/globalization | CL axioms and stated reductions checked; complete §§11–14 verification and closed-embedding/overlap-descent replacement for §15.1 p.83 remain. |
| Davis/native computation | Davis §§4–8, especially partial minimization issue at p.260, compared with native Partrec. Explicit positive-integer/partial-trace/effective-code adapters remain planned, rather than baseline lemmas. |
| Nonpower zero-cycle input | CTV Corollary 3.2 p.10 and Proposition 3.4 pp.10–14 read. Their use of Theorem 3.1 pp.8–9 still imports the fibration result cited there; RP.2 has no matching effective criterion. |
| Existential-preservation/23(d) | Koenigsmann pp.91–92 read and native existential syntax/compactness checked. Diagram and monic-root/MRDP code constructions are explicit future targets. |
| Original analytic/exponential o-minimality | Survey statements and uses read; original analytic preparation, R_exp, R_an,exp and analytic-cell proofs not fully read. Publisher access attempts did not supply those proofs. |
| General cells/dimension/triangulation | Survey statements read; exact general proof sources remain required. Semialgebraic CAD does not supply this generality. |
| Proper definable quotient | BKT compact-group application read; exact locally closed-space theorem/category not verified from its original proof. |
| Rough curve/Hodge consumer | BKT Lemma 4.5 p.15 read; width-one substitution defect checked. Exact all-width induction and consumer compatibility are unresolved mathematical obligations. |
| Complex analytic closure/Chow | PS Theorem 4.4 and Corollary 4.5 p.12 read directly. Its Theorem 4.1/3.2 inputs, singular ambient extension and classical projective Chow still require treatment. |
| Determinant original estimate | Pila 2004 Lemma 3.1 p.6, Proposition 4.2 p.8, Remark 4.5 p.9 read; incorrect journal fixed and quantitative proof supplied. Acquisition gap resolved. |
| Marked endpoint | HP Theorem 7.1/Corollary 7.2 pp.23–25 and Gao–Habegger Lemma 5.2 pp.19–20 read. Preserving only the second projection after analytic rescaling does not give the full endpoint the application uses. |
| Part II/acyclic ownership | Source statements inspected; named contracts have no matching exact registered stages. Prefix/supplier/suffix order must be implemented before release. |
| Modular product/CM pairs | Application scope checked; A_g to A_1×A_1 comparison and modular special-curve classification still need the shared geometric owner. |
| Current upstream synchronization | Current RAG/DG targets and carriers checked directly; precise boundaries already present, with RAG generality corrected here. No invented stage identifiers added. |
| Nonarchimedean analytic measure | Source-scoped one-variable motivic substitution distinguished from general analytic inverse/substitution, null-locus and chart-gluing inputs. Those local-field proof sources remain insufficiently decomposed. |

New original sources are linked at the consuming targets, not used as unsupported
global bibliography substitutions: [Kuhlmann–Novacoski](https://www.fvkuhlmann.de/Henselt.pdf),
[CGH](https://rcluckers.perso.math.cnrs.fr/prints/CGH.pdf),
[Pila 2004](https://people.maths.ox.ac.uk/pila/isurface.pdf), and
[Peterzil–Starchenko](https://math.haifa.ac.il/kobi/analytic.pdf).

## Dependencies and duplication against current upstream

Read the baseline statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The baseline audit covered 60 declaration
contexts, including the actual unprimed `MvPolynomial.induction_on`, general
`Nat.sum_four_squares` and general `Nat.chineseRemainder`, rather than similarly
named prime-specialized declarations. Checked valuation-subring value groups,
standard-part finiteness conditions, native existential syntax, computation and
Diophantine carriers. The library-coverage data was also read; it is not used as a
substitute for current declaration statements.

Current upstream comparison used TauCetiRoadmap checkout
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti library
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched all 127 targets by mathematical
objects and hypotheses across all nine newer roadmaps, their Suggested files and
the four Completed roadmaps named in WORKERS.md. Checked relevant exact matches
in their source context. No build was run in the read-only checkout.

| Existing owner | Reuse and retained additional contract |
| --- | --- |
| RAG Layers 3–6/current semialgebraic modules | Import real semialgebraic syntax/projection/QE. General o-minimal analytic/exponential geometry here adds different hypotheses and results. |
| DifferentialGeometry boundary/corners, Layer 5.5 | Import the abstract face-boundary carrier; retain finite-definable and analytic chart certificates only. |
| Current `Valuation/Coarsen.lean` | Reuse `TauCeti.coarsenMapOfValueGroup` and `Valuation.coarsenByUnits`; retain the Dittmann–Pop cut/localization comparison. |
| Current `GrothendieckRing.lean` | Reuse general commutative ring completion and universal maps; retain residue-definable scissors and their specific maps. No additive cancellation is required by that completion. |
| AdicSpaces/current valuation-spectrum modules | Reuse spectrum, equivalence quotient and patch-clopen basic opens; retain native field-membership dictionary, now made explicit. |
| QuadraticFormInvariants/GlobalQuadraticForms | Import quaternion and local-global theory; retain definable trace images, prime formulas and exact local computations. |
| DiophantineApproximationAndTranscendence DT.0/DT.5 | Import heights; its differential-exponential Ax statement does not supply geometric abelian, Shimura or Hodge Ax. |
| Other newer and Completed roadmaps | No exact additional target found that should replace one of the retained targets. AnalyticNumberTheory AN.8 is a consumer, not an integration prerequisite. |

**Removal inventory: zero.** The existing package already made these imported
objects boundaries. The retained comparison targets have additional contracts;
none was deleted simply because a related construction has a similar name.
There are no `FoundationsAndLibraryIntegration` or `UPSTREAM:` references to
resolve. No cross-roadmap ownership move was made.

The package is not listed as a tier in the 94-roadmap Caraiani–Newton order, so
that file does not certify its proposed new Part II suppliers as lower-tier or
same-bundle. Do not infer permission for an edge from a similar roadmap name.
`LogicAndDefinabilityPartII` and `PeriodMapsAndPeriodDomains, Part II` lack exact
registered stages here. The existing ShimuraVarietiesPartII concerns integral
models, not the mixed foundations and relative-orbit contracts needed here.
The independent A_g orbit/lift-height arithmetic owner is also unspecified.
Whole-layer citations would create a cycle: the general Layer 6 prefix must
precede geometric suppliers, which must precede the application suffix.

Other incomplete supplier matches are substantive:

- SF.1's chart contract must include closed embeddings, embedding independence
  and overlap descent for global motivic integration.
- R11.2 must supply the general dual prime-to-residue-characteristic isogeny
  contract, including identity-component étaleness, finite-field cohomology and
  rational component-group counts. A semistable special case is insufficient.
- MC.1/MC.4 need the specified residue-scissor realization and invertibility of
  every localized denominator, not an unexplained equality of coefficient rings.
- RP.2's pairing does not yield the effective CTV symmetric-power existence
  theorem or its Brauer calculation. Abstract Hilbert symbols likewise do not
  provide the required trace residue and dyadic computations.

## Adversarial mathematics pass

Walked every target, API, identity and convention in README order. The following
range table covers all 127 targets; grouped rows share the indicated checks.
Unchanged entries are checks of the existing precise statement, not claims of
formal proof. Open issues are also recorded in the source/dependency tables.

| Statements checked | Instances and conclusions |
| --- | --- |
| 0.1–0.6 | Equality must be quotient equality; total function graphs are single-valued modulo it. Fractions exclude zero denominators and guard characteristic two. Two composite definable comparisons are required for bi-interpretation. |
| 0.7–0.8 | Principal ultrafilter fails oversized-index test; nonprincipal [i] exceeds each numeral. Finite residue partitions work. Native stdPart(omega)=0 is not an infinitesimal approximation; finite-domain laws and same-U adapter are mandatory. |
| 1.1–1.5 | Sort tags reject ac(RF-variable); zero-order totalization cannot affect guarded truth. Characteristic (0,0) excludes ℚ_p. RF quantifiers remain, and large-p transfer is for fixed formulas, not a uniform all-prime claim. |
| 1.6–1.10 | Characteristic-zero Kronecker dimension includes the +1; trivial/nondiscrete valuations fail prime-divisor conditions. Finite/global-field and transcendence examples preserve the stated scopes. |
| 1.11–1.14 | Henselization is not completion; arbitrary rank remains. CRT simple generator handles degree one. Patch U_0 is whole, zero denominator open empty; current inverse comparison added. |
| 1.15–1.16 | Lexicographic rank-two groups test cut direction and infinitesimals. Coarsening enlarges the valuation ring; unit/nonunit and zero ideal cases match localization direction. |
| 1.17–1.20 | Residue representatives are quotient classes, no section is assumed. Root fields and quotient algebras differ in the split case; characteristic-two restriction removed. Every displayed coefficient denominator stays guarded. |
| 2.1–2.4 | Nonzero angular component is needed for a 1-cell. A residue ball has volume q^(−a−1); zero cells are Haar-null only in positive dimension. Nonzero constants on F diverge. New VG multiplication-graph control rules out definability of the full integrability locus. |
| 2.5–2.6 | x=πu fixes Jacobian factor q^(−1), not q. Zero polynomials and empty loci are separated. General analytic substitution is not inferred from a one-coordinate motivic theorem. |
| 2.7–2.8 | Tensor-power gauge density is |f|^(1/r), r>0; zero form gives zero. Null-locus assertion applies only to positive codimension in every relevant component. |
| 2.9 | Reduction fibre πO^d has volume q^(−d); Weil formula is #X(k)/q^d, including d=0. |
| 2.10 | Trivial group fixes normalization. Quotient integration applies to the lifted image; division by group order requires generic freeness/full-measure hypotheses, not triviality of all torsors. |
| 2.11 | General dual isogeny statement retains prime-to-p and exact Néron inputs; component pairing alone does not prove volume equality. |
| 2.12 | For xy=a, base-first convention gives relative form −dx/x. π*η∧θ=ω fixes the sign, which disappears only after absolute value. |
| 3.1–3.3 | Square-root subassignments are not functorial under all field extensions. Empty scissors=0, point=1. q=1 evaluation is forbidden by denominators. Existing general ring completion is reused. |
| 3.4–3.6 | Empty sums vanish; positive rays require convergence. Intrinsic point mass=1 but an ambient positive-dimensional point is null. Graph dimension is relative to its base. |
| 3.7–3.10 | Pushforward is additive, not a ring homomorphism. Signed integration needs integrability, not injectivity of a positive-to-signed map. Global affine-open shortcut is invalid and remains replaced by an uncompleted descent obligation. |
| 3.11 | Transfer compares fixed residue formulas and coefficient data; it does not match arbitrary VF-valued parameters across fields. |
| 4.1–4.6 | −3 and X₀−2X₁ at (1,3)=−5 detect truncating coefficients. Infinite input types are allowed; inverse syntax is classical, not an algorithm. |
| 4.7–4.10 | Compress only finite witness support; keep all input coordinates. Empty witness block and extension-by-zero work without finite input assumptions. |
| 4.11–4.16 | Encoding must expose coefficient signs and input/witness roles. Partial minimization requires all earlier computations defined; total positive-integer Davis theorem does not automatically give native Partrec. MRDP uses finite tuples. |
| 4.17–4.19 | Four squares handles integer variables. Sum-of-squares conjunction needs formal reality: i²+1=0 is the complex counterexample. Product disjunction needs a domain, and existential ℤ-in-ℚ remains a conditional input. |
| 4.20–4.21 | Ramified real quaternion trace range is [−4,4]; split trace range differs. Real ramification requires both parameters negative; local/dyadic hypotheses are retained. |
| 4.22–4.24 | Odd-prime classes do not cover p=2. The dyadic witness with (1,1,1) gives 69≡5 mod 8. Empty radical intersection is treated explicitly; positive parameter and square exclusions remain. |
| 4.25–4.26 | Universal and complement quantifier blocks remain distinct; no existential integer definition is asserted. |
| 4.27–4.28 | Square detection uses the stated union, not intersection; x=1/17 with parameter 17·41 tests the difference. Negative rationals are nonsquares, zero is square. Nonnorm sets exclude zero; a split norm represents all nonzero values. |
| 4.29–4.30 | The one-universal block is ∀x∃y in that order. Nonpowers for r=1 are empty and zero is not a nonpower. Roots-of-unity descent retains its separate input. |
| 4.31–4.32 | Universal formulas go down and existential formulas go up along substructures. Relative algebraic closure is conditional; compactness alone is not its code adapter. |
| 4.33 | Degree eight refers only to the inner variable; the displayed leading term contributes total degree twelve. No false total-degree bound. |
| 5.1–5.3 | q>1 and level n=0 fixed. Axes in a finite field have 2q−1 points; q=2 gives 3, whereas ZMod 4 gives 8 and defeats a nonprime Lean version. |
| 5.4–5.5 | xy=a fibre integral is (v(a)+1)(1−q^(−1)); integration gives 2q−1. Singular-fibre intrinsic measure is not the base almost-everywhere value. T Z=1+(T−1)A; zero polynomial has Z=0, A=1/(1−T). Finite enumeration cannot decide H10(ℚ). |
| 6.1–6.5 | ℤ violates o-minimality; restricted analytic functions are zero outside the closed cube and do not provide global sine. Finite C^p cells are not analytic cells. Frontier is cl(X) minus X, so a closed line has empty frontier. Choice is a right inverse in the stated direction. |
| 6.6–6.8 | Transition is ψ⁻¹φ on relative orthant domains. At a quadrant vertex the abstract boundary has two preimages; n=0 boundary is empty. Compactness supplies finite chart shrinking, not arbitrary infinite atlases. |
| 6.9 | Quotient contract retains closedness, properness and locally closed-space category; the exact original theorem is still a gap. |
| 6.10–6.14 | Bounded real coordinates and positive ordered imaginary coordinates matter. Rough monomials are not closed under cancellation. Localization denominators belong to the actual coefficient ring and are nonvanishing; arbitrary rough denominators are invalid. Exponential decay uses the stated tail ordering. |
| 6.15 | Substitution z₁=mz₂+c can leave width one; all-width hypothesis and Hodge consumer proof remain unresolved. No claim that the printed argument proves the repair. |
| 6.16–6.20 | Nodal varieties are definable spaces, not smooth manifolds. Analytic closure needs ambient hypotheses; relative closedness is essential for Chow. Dense extension requires existence in addition to Hausdorff uniqueness. Countable-union reduction uses analytic cells/Baire/identity, not arbitrary C^p cells or nondense rational sets. |
| 6.21–6.22 | Isolated point has empty algebraic part; exp graph has no positive-dimensional semialgebraic arc. Algebraic part need not be definable. Height of empty tuple is 1 and coordinatewise degree is not compositum degree. |
| 6.23–6.25 | Finite differentiability order is chosen after degree. Coordinate-height T gives projective height at most T^n; corrected determinant proof uses this power. Empty/zero-dimensional images handled separately; counting constants are not claimed computable. |
| 6.26–6.28 | Block image dimension is actual dimension; constant image is dimension zero. Degree-k coefficients have height at most 2^k T^k, so choose counting exponent below ε/k. |
| 6.29–6.31 | Distinct second projections drive semi-rational counting. A 3-dimensional box over a 2-dimensional base has fibre dimension 1. Analytic rescaling preserves only the marked second projection. Orbit exponents need δ>Aε; finite subsets need not be definable. Ambient/Galois proof corrected. |
| 6.32–6.35 | Countable special families alone do not imply finiteness; normal-factor geometry is required. A_g scope is retained. CM pairs need modular-product comparison. Hermitian comparison is R_an,exp, not R_an: flat cusp exp(−2π/t) is a control; fixed K erratum retained. |
| 6.36–6.38 | Abelian group application retains faithful/free/monodromy, irreducible closed invariant Z and both-generator/inverse height bounds, plus unresolved endpoint input. Hodge strict codimension uses positive-dimensional components; points are handled separately. Mixed conclusion needs the independent pure orbit bound and the stated pure-part restriction, not just pure André–Oort. |

## Definition/API/Checks audit

Each row below records the input's definition or construction and its preserved
number of API entries and named Checks. All Checks were read for an actual value,
degenerate case, comparison or non-example. The adversarial table records the
mathematical controls; the inventory makes the coverage reproducible. The only
existing Check edited was the unnecessarily restricted split quadratic test;
the integration multiplication-graph control is an additional Check in prose.

| Section and object | API entries | Checks | Named controls (first three) |
| --- | ---: | ---: | --- |
| 0.1 `interpretation` | 4 | 4 | `interpretation.identity`, `interpretation.fractions`, `interpretation.nonfunctional` |
| 0.3 `biinterpretation` | 4 | 4 | `biinterpretation.identity`, `biinterpretation.finite_obstruction`, `biinterpretation.parameter_transport` |
| 0.5 `fraction-interpretation` | 4 | 4 | `fraction_interpretation.Z_to_Q`, `fraction_interpretation.zero_denominator`, `fraction_interpretation.negative` |
| 0.7 `arithmetic-ultrapower` | 4 | 4 | `arithmetic_ultrapower.numeral`, `arithmetic_ultrapower.infinite`, `arithmetic_ultrapower.finite_partition` |
| 1.1 `denef-pas-language` | 4 | 4 | `denef_pas_language.mixed_sort`, `denef_pas_language.zero_order`, `denef_pas_language.congruence` |
| 1.2 `angular-component` | 4 | 4 | `angular_component.zero`, `angular_component.Laurent`, `angular_component.unit` |
| 1.6 `kronecker-dimension` | 4 | 3 | `kronecker_dimension.finite`, `kronecker_dimension.global`, `kronecker_dimension.offset` |
| 1.8 `prime-divisor` | 4 | 4 | `prime_divisor.t_adic`, `prime_divisor.p_adic`, `prime_divisor.trivial` |
| 1.11 `henselization` | 4 | 4 | `henselization.henselian_field`, `henselization.not_completion`, `henselization.immediate` |
| 1.15 `coarsening-prime` | 4 | 4 | `coarsening_prime.rank_two`, `coarsening_prime.direction`, `coarsening_prime.zero_lower_coefficient` |
| 1.17 `residue-interpretation` | 4 | 4 | `residue_interpretation.p_adic`, `residue_interpretation.unit`, `residue_interpretation.same_residue` |
| 1.20 `quadratic-root-fields` | 4 | 4 | `quadratic_root_fields.split`, `quadratic_root_fields.nonsplit`, `quadratic_root_fields.denominator` |
| 2.1 `cells` | 4 | 4 | `cells.one_ball`, `cells.zero_cell`, `cells.zero_ac` |
| 2.3 `local-constructible-functions` | 4 | 4 | `local_constructible_functions.ball`, `local_constructible_functions.unbounded`, `local_constructible_functions.geometric` |
| 2.7 `gauge-measure` | 4 | 4 | `gauge_measure.affine`, `gauge_measure.root_factor`, `gauge_measure.zero` |
| 3.1 `definable-subassignment` | 4 | 4 | `definable_subassignment.point`, `definable_subassignment.sqrt`, `definable_subassignment.graph` |
| 3.2 `residue-grothendieck` | 4 | 4 | `residue_grothendieck.empty`, `residue_grothendieck.line`, `residue_grothendieck.two_points` |
| 3.3 `motivic-coefficient-ring` | 4 | 4 | `motivic_coefficient_ring.geometric`, `motivic_coefficient_ring.q_one`, `motivic_coefficient_ring.not_positive` |
| 3.4 `presburger-functions` | 4 | 4 | `presburger_functions.empty_sum`, `presburger_functions.constant_ray`, `presburger_functions.weighted_ray` |
| 3.5 `constructible-motivic-functions` | 4 | 4 | `constructible_motivic_functions.indicator`, `constructible_motivic_functions.line`, `constructible_motivic_functions.two_points` |
| 3.6 `dimension-graded-functions` | 4 | 4 | `dimension_graded_functions.point`, `dimension_graded_functions.ambient_null`, `dimension_graded_functions.graph` |
| 4.1 `to-dioph-poly` | 7 | 4 | `constant_negative`, `two_coordinates`, `native_eval` |
| 4.5 `poly-mvpolynomial-equiv` | 9 | 4 | `empty_inverse`, `product_inverse`, `inverse_native_eval` |
| 4.11 `effective-polynomial-coding` | 3 | 4 | `effective_polynomial_coding.negative`, `effective_polynomial_coding.roles`, `effective_polynomial_coding.empty` |
| 4.18 `ring-diophantine-sets` | 4 | 4 | `ring_diophantine_sets.complex_system`, `ring_diophantine_sets.empty`, `ring_diophantine_sets.zero_divisors` |
| 4.20 `quaternion-trace-sets` | 4 | 3 | `quaternion_trace_sets.one`, `quaternion_trace_sets.real_ramified`, `quaternion_trace_sets.split` |
| 4.22 `prime-class-rings` | 3 | 3 | `prime_class_rings.square`, `prime_class_rings.class`, `prime_class_rings.dyadic` |
| 4.23 `diophantine-radicals` | 4 | 3 | `diophantine_radicals.singleton`, `diophantine_radicals.two_primes`, `diophantine_radicals.field` |
| 4.24 `prime-parameter-families` | 3 | 3 | `prime_parameter_families.three`, `prime_parameter_families.negative`, `prime_parameter_families.square` |
| 4.27 `square-detection-unions` | 3 | 3 | `square_detection_unions.square`, `square_detection_unions.prime`, `square_detection_unions.two_primes` |
| 4.31 `existential-model-interfaces` | 3 | 3 | `existential_model_interfaces.identity`, `existential_model_interfaces.rational_real`, `existential_model_interfaces.direction` |
| 5.1 `congruence-density-series` | 4 | 4 | `congruence_density_series.whole`, `congruence_density_series.one_ball`, `congruence_density_series.raw` |
| 6.1 `o-minimal-expansion` | 4 | 3 | `o_minimal_expansion.interval`, `o_minimal_expansion.integers`, `o_minimal_expansion.finite` |
| 6.2 `restricted-analytic-expansions` | 3 | 4 | `restricted_analytic_expansions.cube_boundary`, `restricted_analytic_expansions.outside`, `restricted_analytic_expansions.sine` |
| 6.6 `finite-definable-atlas` | 4 | 4 | `finite_definable_atlas.line`, `finite_definable_atlas.quadrant`, `finite_definable_atlas.infinite_atlas` |
| 6.11 `rough-coefficient-ring` | 3 | 3 | `rough_coefficient_ring.inverse_y`, `rough_coefficient_ring.coefficient`, `rough_coefficient_ring.pole` |
| 6.12 `rough-monomial` | 4 | 4 | `rough_monomial.monomial`, `rough_monomial.zero`, `rough_monomial.sum_cancellation` |
| 6.13 `rough-polynomial-localization` | 4 | 4 | `rough_polynomial_localization.laurent`, `rough_polynomial_localization.sum`, `rough_polynomial_localization.arbitrary_denominator` |
| 6.16 `algebraic-definable-structure` | 4 | 3 | `algebraic_definable_structure.line`, `algebraic_definable_structure.projective`, `algebraic_definable_structure.node` |
| 6.21 `algebraic-part` | 4 | 4 | `algebraic_part.interval`, `algebraic_part.isolated`, `algebraic_part.graph_exp` |
| 6.26 `definable-blocks` | 4 | 4 | `definable_blocks.point`, `definable_blocks.arc`, `definable_blocks.exponential_image` |

## Ten Lean signature comparisons

Every theorem target in the suggested file was compared with its README target:

| Lean declaration | Hypotheses/generality checked |
| --- | --- |
| `Diophantine.toDiophPoly_apply` | Signed integer evaluation; natural inputs cast coordinatewise; arbitrary input type. |
| `Diophantine.polynomial_comparison` | Ring equivalence, including infinite input types; no computable inverse claim. |
| `Diophantine.dioph_iff_exists_fin_mvPolynomial` | Finite witnesses only; input index type remains arbitrary, zero witnesses allowed. |
| `Diophantine.mrdp` | Native REPred and Dioph on Fin n tuples with existing encodings. |
| `universal_integers` | Integer coefficients, rational assignments, fixed finite universal block and nonzero equation. |
| `rational_nonintegers_diophantine` | Complement of the actual embedded integers, not a new integer predicate. |
| `rational_nonsquares_diophantine` | Includes negative rationals, excludes zero. |
| `one_universal_variable` | Exactly one universal rational variable followed by a fixed finite existential block. |
| `diophantine_integer_transfer` | Existential ℤ-in-ℚ appears as an explicit antecedent; no H10(ℚ) conclusion. |
| `product_zero_residue_count` | Prime q and ZMod q; this is a representative prime-field case. README retains the general finite-field target separately. |

No conclusion is smuggled into a hypothesis; no `True` or admitted data predicate
is used. The proved examples test the actual new definitions, including signed
evaluation, a genuine rational noninteger, the empty Diophantine set and inverse
witnesses for nonzero rationals. The layer comments and closing list account for
README definitions whose carriers are not presently available.

## Validation and release condition

`lean-check` exited 0 at the required pins with exactly ten “declaration uses
sorry” warnings and no other warning or error. Available memory was checked
before compilation. The successful result applies to the unchanged Suggested.lean;
it does not establish the truth of its admitted statements.

The blueprint validator exited 0 with zero errors/warnings; intake checked the
four changed deliverables with zero problems; `git diff --check` exited 0.
Before acceptance, supply or repair the two
specific mathematical arguments above and match every essential supplier to an
actual permitted stage (or plan the missing mathematics under its correct owner).
Finish the remaining exact proof-source requirements without weakening the general
targets. The present package is an explicit, useful plan with real open gaps;
successful elaboration does not make it ready for upstream submission.
