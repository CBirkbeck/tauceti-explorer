# H.7 — Definable period maps and algebraicity of Hodge loci

This part continues the existing pure, mixed and polarized Hodge theory toward tame period maps of **pure polarized integral variations**. Its base is a smooth connected quasi-projective complex variety. Its period target is a connected general Mumford–Tate Hodge manifold, with compatible arithmetic level and component choices. The target need not be Hermitian symmetric or algebraic. The two conclusions are definability of the period map in the real structure ℝ_an,exp and algebraicity of the exceptional Hodge locus as a countable union of proper closed irreducible algebraic subvarieties. There is no mixed-variation or real Noether–Lefschetz assertion.

The plan contains 31 declaration-sized nodes: five definitions, three constructions, twenty theorems and three promoted API lemmas. Each definition or construction has an API and three discriminating tests. All 60 items in the reviewed BKT source route are accounted for below and in the packet's `sourceRouteAccounting`; items owned by H.3, H.6 or another roadmap are consumed through precise supplier contracts. H.7 is **planned**, rather than closed: its target chains reach eleven pinned declarations, existing supplier nodes, sixteen requests and seven explicit gaps. A complete target-level planning pass does not assert closure of the external proofs or implementation of the declarations.

## Conventions and ownership

A pure Hodge structure, its pieces, polarization, Weil operator and Tate structures are the existing Tau Ceti objects. The general variation is imported from `ShimuraData:D3/polarized-integral-variation`, not defined again here. H.3 owns the general period domain, compact dual, connected Hodge datum, arithmetic Hodge manifold, period map, faithful represented group and generic Mumford–Tate geometry. H.6 owns monodromy, nilpotent orbits, simultaneous splittings, norm asymptotics and the horizontal negative-Lie correction. The basepoint's canonical Hodge Cartan involution fixes a maximal compact K_t. All rational Siegel sets in a given comparison use **this same compact**. Changes of coordinates transport that compact through the same canonical symmetric-space projection; they do not manufacture a second reduction convention.

The period domain is the represented Mumford–Tate orbit D=G/M in the full polarized ambient domain, with a specified component. It is not identified with every polarized filtration having the same Hodge numbers. A proper Mumford–Tate group can give a smaller orbit, even a singleton for a constant CM structure. The full ambient point object does not supply the manifold, quotient or generic tensor theory of that orbit. Likewise the adjoint group is not silently made to act faithfully on the original Hodge representation. H.3 must supply a faithful derived-group or finite central-cover representation and its quotient transport before H.7 uses reduction in SL(V).

The native polarization Hodge form is conjugate-linear in its first argument. BKT uses the opposite convention. We set h(z,u,v) to the conjugate of the native form, hence h(z,u,v)=Q_C(C_z u, conjugate(v)); it is linear in u and conjugate-linear in v. Its diagonal agrees with the native positive diagonal. On the real local system this gives a real positive definite symmetric form b_z. The indefinite pairing B(u,v)=Q_C(u,conjugate(v)) is Hermitian in even weight and skew-Hermitian in odd weight; i^k B is Hermitian in weight k. The Gram calculation carries the Weil phases explicitly. Reduction uses b_z, not the skew polarization itself.

For logarithmic coordinates z_i=x_i+i y_i, q_i=exp(2πi z_i) and |q_i|=exp(−2πy_i). A positive height η produces a closed q-buffer of radius exp(−2πη) strictly inside the extension neighbourhood. Constants can depend on the chosen real width R, height, analytic buffer and compact nondegenerating parameters. Half-open angular strips include their seams. The holomorphic extension on the open unit polydisc by itself supplies no restricted-analytic bound at its outer circle.

The ordered deep region y₁≥⋯≥yₙ≥Y is only the starting asymptotic region. The source's conclusion for every positive height η requires a second argument through finitely many buffered charts along **all partial boundary strata**. The region with yₙ bounded and y₁ unbounded is not compact in logarithmic coordinates. Finite basis permutations also remain essential: reducedness for every fixed ordering of every rational basis is false.

In the tensor algebra, an untwisted rational Hodge tensor has type (0,0). A class of type (p,p) is tested as type (0,0) only after the Tate twist (p), with its character action. A pure tensor construction of nonzero weight has no nonzero type-(0,0) piece, even when its filtration index zero piece is nonzero. The zero tensor lies in every fixed tensor locus. The **exceptional** Hodge locus removes tensors already generically of type (0,0). It therefore excludes the identity special subdatum. A constant Tate or CM variation has empty exceptional locus in its own generic datum; allowing identity images would incorrectly give the whole base.

Adelic reduction, rational Siegel sets and their corrected inverse-containment results remain in `AdelicAlgebraicGroups:AA.3`. Generic tame quotient structures for M⊂K_t belong to the already routed `ArithmeticQuotientDefinability` extension of `ArithmeticLocallySymmetricSpaces`. That extension has no roadmap/stage in this clone; gap G1 records the missing owner, rather than pretending that the symmetric case M=K solves it. `LogicAndDefinabilityInNumberTheory:LD.6` supplies o-minimal geometry, rough-function algebra, finite atlas calculus and definable analytic Chow. `ComplexComparisonPartII:C0` supplies analytic zero loci and inverse images. General proper analytic images require an extension of that Part II's analytic boundary, recorded with C4; projective Chow and proper algebraic GAGA alone do not state Remmert's theorem. `AlgebraicModuliForArithmeticGeometry:R09.7d` supplies the SNC compactification and buffered analytic chart cover.

## Sources and proof route

The mathematical route follows Bakker–Klingler–Tsimerman §§4–5, with their complete 2023 erratum. The local lift is restricted analytic after separating the polynomial nilpotent exponential from the holomorphic q-dependent term. Splitting-independent multigraded norms and exterior powers control indefinite Gram denominators and hence rough polynomial entries. A determinant bound and one-variable curve tests give uniform reducedness up to finitely many orderings. Correct inverse Siegel containment transfers metric reduction back to the domain. Buffered partial-boundary charts extend deep containment to each positive height. The generic fixed-K quotient then turns the lifted graph into the period graph, and finite chart gluing proves the global theorem.

For a special Hodge image, definability and closed analyticity are separate inputs. The erratum's Cartan compatibility gives definability. Kernel/image factorization, a proper arithmetic immersion and proper holomorphic image give closed analyticity; the original source map can have a noncompact kernel and need not be proper. Pulling back one special image gives one definable closed analytic subset of the algebraic base, so definable analytic Chow gives a reduced closed algebraic subset. Rational countability and finite Noetherian irreducible decomposition then produce the exceptional countable union. No step treats that infinite union as definable.

The compact-target special case is also included: cocompact arithmetic lattices have no nontrivial unipotents; after compatible neat level and quasi-unipotence, boundary monodromy is trivial. The H.6 finite-monodromy extension makes the period map holomorphic across the SNC compactification, so compact analytic chart graphs are ℝ_an-definable. Its stronger language conclusion retains the variation and extension hypotheses.

Public versions and read boundaries are recorded with hashes in the packet. They are:

- **BKT20**: Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://par.nsf.gov/servlets/purl/10200187); JAMS 33 (2020), 917–939; published PDF. Read 7 October 2026. Full mathematical body §§1–5 and Appendix A read using the author version, with published pp.928–934 collated for every H.7 statement and proof. §4.1 normal-crossings reduction; §4.2 local lift; §4.3 rough-function curve lemma; complete §§4.4–4.5 norm/reduction argument; §5 algebraicity. The cited Schmid, CKS and general reduction-theory proofs are supplied externally, not freshly verified here.
- **BKT-author**: Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, [Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArith.pdf); Author-hosted version, 23 PDF pages; pagination differs from publication. Read 7 October 2026. Complete mathematical body §§1–5 and Appendix A; bibliography used only for locating suppliers.
- **BKT23**: Benjamin Bakker, Bruno Klingler and Jacob Tsimerman, [Erratum: Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://benjamin-bakker.github.io/DefArithErr.pdf); Author-hosted erratum, JAMS 36 (2023), DOI 10.1090/jams/1025. Read 7 October 2026. Complete §§1.1–1.6 and examples; Theorem 1.2, Corollary 1.3 and corrected inverse-Siegel citation.
- **Ka85**: Masaki Kashiwara, [The asymptotic behavior of a variation of polarized Hodge structure](https://www.jstage.jst.go.jp/article/kyotoms1969/21/4/21_4_853/_pdf); Publications of RIMS 21 (1985), 853–875. Read 7 October 2026. Selected §2.3–2.4: Lemma 2.4.1 and its full proof; §3.4 Theorems 3.4.1–3.4.2; §4.1–4.2 comparison proof through Proposition 4.1.1. Printed p.870 rendered to check the formulas against poor OCR. Not a new verification of the source’s complete §4.3 proof or earlier nilpotent-orbit inputs.
- **K17**: Bruno Klingler, [Hodge loci and atypical intersections: conjectures](https://arxiv.org/pdf/1711.09387v1); arXiv:1711.09387v1 (2017). Read 7 October 2026. Selected §§2.4–2.6 pp.8–9: tensor characterization, generic Mumford–Tate group and exceptional locus; §§3.3–3.5 pp.11–13: arithmetic quotients, holomorphic Hodge morphisms and special images. The cited André/Pink results are supplier obligations, not newly proved or verified here. Mixed/admissible conclusions are outside H.7.
- **PS09**: Ya’acov Peterzil and Sergei Starchenko, [Complex analytic geometry and analytic-geometric categories](https://math.haifa.ac.il/kobi/analytic.pdf); Author draft dated July 22, 2005; published J. reine angew. Math. 626 (2009), 39–74; locators use draft pagination. Read 7 October 2026. Complete statements and proofs of Theorem 4.4 and Corollary 4.5, draft p.12; Theorem 6.1 and remarks, draft p.16. Earlier analytic-geometric closure results, projective Chow, and the full Theorem 6.1 proof are external supplier obligations.

The Kashiwara material is the 1985 asymptotic paper, not his 1986 mixed-variation paper. The selected distributivity/splitting proof and norm-comparison reduction were read, and p.870 was rendered to check the formulas. This pass does not reverify the complete §4.3 proof, Schmid Corollary 5.29, André/Pink generic-data inputs, the earlier Peterzil–Starchenko closure/projective-Chow machinery or the full original arithmetic properness literature. These belong to the named supplier gaps. Borel's theorem that holomorphic maps into arithmetic varieties are algebraic, including its period-map reconstruction step, belongs to `ShimuraVarieties:V3` and is not an extra H.7 theorem.

## Declaration plan

Every declaration below has implementation status unchecked. Proposed declarations use namespace `TauCeti.Hodge.Tame` in the proposed module `TauCeti/Geometry/Hodge/Tame/PeriodMap`. The mathematical statements are definitive; the suggested file's unavailable supplier conditions and conclusions are inventoried separately.

<a id="bounded-sector"></a>

### 1. Bounded-width positive-height sectors

**Definition:** `TauCeti.Hodge.Tame.boundedSector`.

For n≥0, R≥0 and η>0, boundedSector(n,R,η) is {z∈C^n : |Re z_i|≤R and Im z_i≥η for every i}. Closed horizontal and height inequalities are intentional. The width is R and the height is η; constants in theorems may depend on both. Interior and translated half-open angular strips are used when selecting logarithms.

**Hypotheses and input data.** n is finite; R≥0; η>0.

**Construction/proof.**

1. Take coordinatewise intersections of closed inequalities in the real coordinates of C^n.
2. Use the identity map for n=0; no coordinate condition remains.

**Direct prerequisites:** finite coordinate sets and real inequalities; no new supplier theory.

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §1, Theorem 1.5; §4.2, pp.920–921,929. The two sector parameters are separated; the source’s C in the width inequality is corrected to R.

**Uses that determine the API.** BKT Theorem 1.5 and §4.2: Provides the domain for restricted exponential and finite Siegel containment. HodgeStructuresPartII:H.7/positive-height-siegel-cover: Allows every strictly positive height, rather than only deep cuspidal regions.

**API.**

- `TauCeti.Hodge.Tame.boundedSector.mem_iff` (characterisation): Membership is exactly the conjunction of the two coordinate inequalities.
- `TauCeti.Hodge.Tame.boundedSector.mono` (relation): If R≤R′ and η′≤η, boundedSector(n,R,η) is contained in boundedSector(n,R′,η′).
- `TauCeti.Hodge.Tame.boundedSector.reindex` (functoriality): Reindexing the coordinates by a permutation preserves the sector.

**Unit tests.**

- `TauCeti.Hodge.Tame.boundedSector_test_point` (computation): The point z_0=2i belongs to boundedSector(1,1,1).
- `TauCeti.Hodge.Tame.boundedSector_test_empty_coordinates` (degenerate): boundedSector(0,R,η) is the whole singleton C^0.
- `TauCeti.Hodge.Tame.boundedSector_test_width` (non-example): The point z_0=2+2i does not belong to boundedSector(1,1,1).

**Acceptance:** In dimension one 0+2i lies in the width-one height-one sector, while 2+2i does not. Positive height is essential for an analytic buffer inside the unit disc.

<a id="ordered-sector"></a>

### 2. Ordered deep sectors

**Definition:** `TauCeti.Hodge.Tame.orderedSector`.

orderedSector(n,R,Y) is boundedSector(n,R,Y) intersected with the inequalities Im z_i≥Im z_j whenever i≤j in the fixed coordinate ordering. Each bounded sector is covered by its finitely many permuted ordered sectors. The asymptotic arguments choose Y≥Y₀>0; they do not assert estimates at all positive heights.

**Hypotheses and input data.** Finite ordered index set {0,…,n−1}; R≥0; Y>0.

**Construction/proof.**

1. Add the finite weak ordering inequalities to boundedSector.
2. Sort the finite list of imaginary parts; ties may choose any permutation.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/bounded-sector](#bounded-sector)

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.3 Definition 4.4, p.929; §4.5 opening, p.932. This is the source Σ region with an explicit deep-height parameter.

**Uses that determine the API.** BKT §4.4 Theorem 4.8: The ratio monomials use the ordering y₁≥⋯≥yₙ. BKT §4.5: Permuting the degeneration coordinates yields a finite cover of the full sector.

**API.**

- `TauCeti.Hodge.Tame.orderedSector.mem_iff` (characterisation): Membership means membership in boundedSector together with the weak descending-height inequalities.
- `TauCeti.Hodge.Tame.orderedSector.subset_boundedSector` (coercion): Every ordered-sector point is in the corresponding bounded sector.
- `TauCeti.Hodge.Tame.orderedSector.permutation_cover` (relation): Every bounded-sector point can be reindexed into orderedSector by a coordinate permutation.

**Unit tests.**

- `TauCeti.Hodge.Tame.orderedSector_test_order` (computation): The two coordinates (3i,2i) lie in orderedSector(2,1,1).
- `TauCeti.Hodge.Tame.orderedSector_test_ties` (degenerate): The two coordinates (2i,2i) lie in orderedSector(2,1,1).
- `TauCeti.Hodge.Tame.orderedSector_test_reverse` (non-example): The two coordinates (2i,3i) do not lie in orderedSector(2,1,1).

**Acceptance:** Tied heights belong to every compatible ordering; a finite cover need not be disjoint.

<a id="sector-uniformization"></a>

### 3. Punctured-polydisc sector uniformization

**Construction:** `TauCeti.Hodge.Tame.sectorUniformization`.

sectorUniformization(z)_i=exp(2πi z_i). On boundedSector(n,R,η) its image has 0<|q_i|≤exp(−2πη)<1. On the angular selection 0≤Re z_i<1 and Im z_i>η it surjects onto 0<|q_i|<exp(−2πη), coordinatewise. Integer shifts leave q unchanged. The half-open strip includes the angular seam.

**Hypotheses and input data.** η>0; finitely many coordinates.

**Construction/proof.**

1. Evaluate the native complex exponential coordinatewise.
2. Apply Complex.norm_exp to 2πiz to obtain the radius bound.
3. Choose arguments in [0,2π) for surjectivity. Restricted sine/cosine in the bounded real coordinate and real exponential supply definability through LD.6.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/bounded-sector](#bounded-sector), `mathlib:Complex.norm_exp`, `LogicAndDefinabilityInNumberTheory:LD.6`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.2 uniformizing diagram and Lemma 4.2, p.929. The image is a buffered punctured polydisc, not the full unit polydisc.

**Uses that determine the API.** BKT Lemma 4.2: Pulls the holomorphic nilpotent-orbit extension into a restricted-analytic coefficient ring. BKT §4.2 quotient diagram: The image of the lifted graph is the graph of the period map on the smaller punctured polydisc.

**API.**

- `TauCeti.Hodge.Tame.sectorUniformization.apply` (simp): The i-th coordinate is exp(2πi z_i).
- `TauCeti.Hodge.Tame.sectorUniformization.norm` (compatibility): Its i-th coordinate has norm exp(−2π Im z_i), by Complex.norm_exp.
- `TauCeti.Hodge.Tame.sectorUniformization.integer_shift` (relation): Adding any vector of integers to z does not change sectorUniformization.
- `TauCeti.Hodge.Tame.sectorUniformization.halfOpen_surjective` (characterisation): Every point in the smaller open punctured polydisc has a lift with real parts in [0,1) and imaginary parts greater than η.

**Unit tests.**

- `TauCeti.Hodge.Tame.sectorUniformization_test_height` (computation): In one coordinate q(i)=exp(−2π), a positive real number.
- `TauCeti.Hodge.Tame.sectorUniformization_test_period` (characterisation): q(z+1)=q(z) in one coordinate.
- `TauCeti.Hodge.Tame.sectorUniformization_test_outer_radius` (non-example): A coordinate of norm exp(−π) is not in the image of boundedSector(1,1,1).

**Acceptance:** The real angular coordinate zero must be represented. A height-one strip only covers radii at most exp(−2π).

<a id="sector-lift-definable"></a>

### 4. Definability of the lifted period map

**Theorem:** `TauCeti.Hodge.Tame.sectorLift_definable`.

For an integral polarized pure VHS with unipotent coordinate monodromies on a polydisc neighbourhood, let Φ̃(z)=exp(Σz_iN_i)Ψ(q(z)) be its H.6 nilpotent-orbit lift into its H.3 semialgebraic period domain D. For every fixed R≥0 and η>0 for which the closed q-polydisc of radius exp(−2πη) is contained in the extension neighbourhood, Φ̃ restricted to boundedSector(n,R,η) is R_an,exp-definable. The neighbourhood condition cannot be replaced by holomorphy on the open unit polydisc alone.

**Hypotheses and input data.** H.2 integral polarized pure VHS; H.6 unipotent commuting N_i and holomorphic extension Ψ. H.3 algebraic compact dual, algebraic group action, and semialgebraic D. A compact q-buffer lies inside the extension domain.

**Construction/proof.**

1. Use sector-uniformization and the LD.6 bounded-strip exponential theorem.
2. Cover the compact q-buffer by finitely many algebraic compact-dual charts; Ψ is restricted analytic in these charts.
3. Commuting nilpotent logarithms have polynomial exponential, and the group action is algebraic; compose definable maps.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/sector-uniformization](#sector-uniformization), `ShimuraData:D3/polarized-integral-variation`, `HodgeStructuresPartII:H.3`, `HodgeStructuresPartII:H.6`, `LogicAndDefinabilityInNumberTheory:LD.6`, `mathlib:Set.Definable`, [HodgeStructuresPartII:H.3/polarized-compact-dual](HodgeStructuresPartII--H.3.md), [HodgeStructuresPartII:H.3/represented-complex-orbit](HodgeStructuresPartII--H.3.md), [HodgeStructuresPartII:H.3/mt-orbit-open](HodgeStructuresPartII--H.3.md)

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.2 Lemma 4.2 and complete proof, p.929. Uses its compact analytic buffer, polynomial nilpotent exponential and algebraic action.


**Acceptance:** For N_i=0 and constant Ψ, the lifted map is constant and semialgebraic. The theorem does not make arbitrary holomorphic functions on an unbuffered open disc definable.

<a id="hodge-form-function"></a>

### 5. The varying Hodge form

**Construction:** `TauCeti.Hodge.Tame.hodgeFormFunction`.

On a fixed complexification V_C of a free integral local system, with a family of pure Hodge structures hs_z and polarizations P_z supplied by H.2/H.3, hodgeFormFunction(P,z,u,v) is the conjugate of P_z.hodgeForm(u,v). Equivalently it is Q_C(C_z u,conjugate v), the BKT convention, linear in u and conjugate-linear in v. Its diagonal equals the native diagonal and is positive for u≠0. On real vectors it induces a real positive definite symmetric form b_z; this real restriction is what reduction theory uses.

**Hypotheses and input data.** Fixed lattice-induced conjugation and fixed weight k. Polarization Q is flat in the chosen local trivialization.

**Construction/proof.**

1. Use the existing fibrewise Polarization.hodgeForm, not a new polarization definition.
2. Conjugate its value and apply hodgeForm_eq_conj.
3. Restrict to real points; conjugation fixes those vectors and Hermitian symmetry becomes real symmetry.

**Direct prerequisites:** `tauceti:TauCeti.Hodge.Polarization.hodgeForm`, `tauceti:TauCeti.Hodge.Polarization.hodgeForm_eq_conj`, `tauceti:TauCeti.Hodge.Polarization.hodgeForm_self_pos`, `ShimuraData:D3/polarized-integral-variation`, `HodgeStructuresPartII:H.3`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.4 first paragraph, p.930; formulas (4.2)–(4.5), pp.931–932. The printed first formula omits conjugation in its second argument; the proof uses the corrected Hermitian form.

**Uses that determine the API.** BKT Proposition 4.6 and Lemma 4.7: Its entries and positive diagonal are compared to multigrading monomials. BKT §4.5: Its real restriction maps the period domain to positive definite symmetric forms.

**API.**

- `TauCeti.Hodge.Tame.hodgeFormFunction.apply` (compatibility): h(z,u,v)=Q_C(C_z u,conjugate v)=conjugate(P_z.hodgeForm u v).
- `TauCeti.Hodge.Tame.hodgeFormFunction.diagonal` (compatibility): h(z,u,u)=P_z.hodgeForm u u.
- `TauCeti.Hodge.Tame.hodgeFormFunction.hermitian` (relation): h(z,u,v)=conjugate(h(z,v,u)).
- `TauCeti.Hodge.Tame.hodgeFormFunction.smul_left` (simp): h(z,a u,v)=a h(z,u,v).

- `TauCeti.Hodge.Tame.hodgeFormFunction.add_left` (compatibility): h(s,u+u′,v)=h(s,u,v)+h(s,u′,v).
- `TauCeti.Hodge.Tame.hodgeFormFunction.add_right` (compatibility): h(s,u,v+v′)=h(s,u,v)+h(s,u,v′).
- `TauCeti.Hodge.Tame.hodgeFormFunction.smul_right` (compatibility): h(s,u,a·v)=conjugate(a)·h(s,u,v).

**Unit tests.**

- `TauCeti.Hodge.Tame.hodgeFormFunction_test_tate` (computation): On the polarized Tate line h(i,1)=i.
- `TauCeti.Hodge.Tame.hodgeFormFunction_test_zero` (degenerate): h(z,0,v)=0 for every z,v.
- `TauCeti.Hodge.Tame.hodgeFormFunction_test_native_diagonal` (compatibility): The varying diagonal agrees with the native positive Hermitian diagonal, for every weight and every vector.

**Acceptance:** For the Tate line h(i,1)=i while the native conjugate-first form gives −i. No Gram reduction theorem is applied directly to a complex bilinear polarization in odd weight.

<a id="hodge-adapted-flag"></a>

### 6. A Hodge-adapted full flag

**Construction:** `TauCeti.Hodge.Tame.hodgeAdaptedFlag`.

From the H.6 simultaneous complex splitting I^{p,q₁,…,qₙ} of the limiting filtration and partial-sum monodromy weight filtrations, choose a complex basis w₁,…,w_m of homogeneous vectors with the p indices nonincreasing. hodgeAdaptedFlag(w)_j is span(w₁,…,w_j), 0≤j≤m. This is a full flag refining F: F^a is the step indexed by #{i:p_i≥a}. It is not asserted rational, and is distinct from a rational basis adapted to the weight-only splitting J.

**Hypotheses and input data.** Finite dimensional V_C; H.6 distributive simultaneous splitting; choose homogeneous bases in each summand.

**Construction/proof.**

1. Choose bases in the finitely many nonzero splitting summands and order them by decreasing p.
2. Take native spans of the initial segments. Linear independence gives dimension j.
3. The splitting’s filtration identity gives the refinement of F.

**Direct prerequisites:** `HodgeStructuresPartII:H.6`, `tauceti:TauCeti.Hodge.HodgeStructureOn`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.4 proof of Lemma 4.7, p.931. Constructs the flag used for the indefinite Gram calculation; the splitting is imported from H.6.

**Uses that determine the API.** BKT equations (4.2)–(4.5): Its determinant vectors give nonvanishing pivot denominators and rational expressions for Hodge entries. BKT Lemma 4.7 proof: The sorted p labels determine the Weil-operator phases in the Gram calculation.

**API.**

- `TauCeti.Hodge.Tame.hodgeAdaptedFlag.zero` (simp): The first step is the zero submodule.
- `TauCeti.Hodge.Tame.hodgeAdaptedFlag.top` (simp): The final step is the whole complex module.
- `TauCeti.Hodge.Tame.hodgeAdaptedFlag.finrank` (characterisation): For an independent basis, the j-th step has complex dimension j.
- `TauCeti.Hodge.Tame.hodgeAdaptedFlag.filtration` (compatibility): For a basis homogeneous for the simultaneous splitting and sorted by p, its indicated step equals the supplied F^a.

**Unit tests.**

- `TauCeti.Hodge.Tame.hodgeAdaptedFlag_test_line` (computation): For a one-dimensional basis, step one is the whole line.
- `TauCeti.Hodge.Tame.hodgeAdaptedFlag_test_rank_zero` (degenerate): For the zero-dimensional basis every step is zero.
- `TauCeti.Hodge.Tame.hodgeAdaptedFlag_test_first_vector` (characterisation): For the standard basis of C² the first step is exactly the first coordinate axis, not the second.

**Acceptance:** A weight-only rational basis does not generally refine F; these two bases cannot be identified.

<a id="gram-determinant-formulas"></a>

### 7. Indefinite Gram determinants and Hodge entries

**Theorem:** `TauCeti.Hodge.Tame.gramDeterminant_formulas`.

Let w be hodge-adapted-flag at F=Ψ(0), γ(z)=exp(Σz_iN_i)exp(v(q(z))) the H.6 negative-Lie-chart lift, and B(u,v)=Q_C(u,conjugate v). Put W_j=w₁∧⋯∧w_j, Δ_j=B(γW_j,γW_j), Δ₀=1. Each Δ_j is nonzero wherever γF is pure. B-Gram–Schmidt vectors w̃_j satisfy B(w̃_j,w̃_j)=Δ_j/Δ_{j−1}; the j-th Hodge-entry contribution is i^{2p_j−k} B(γW_{j−1}∧u,γW_j) B(γW_j,γW_{j−1}∧v)/(Δ_{j−1}Δ_j). Summing gives h_z(u,v). For γu replace u by γu inside these exterior expressions. In odd weight B is skew-Hermitian; i^k B is Hermitian. The unit phases cancel correctly, and no positivity of B itself is asserted.

**Hypotheses and input data.** Polarization has weight parity Q(v,u)=(−1)^kQ(u,v). The full flag refines the pure Hodge filtration after applying γ; nonvanishing uses its definite successive Hodge blocks.

**Construction/proof.**

1. Use the flag’s sorted p indices to identify orthogonal Hodge blocks and show that their leading Gram minors cannot vanish.
2. Apply Gram determinant identities to the Hermitian form i^kB and then undo the phase.
3. Use h=i^{2p_j−k}B on each pure component and sum the orthogonal contributions.
4. The nilpotent exponential is polynomial and the holomorphic big-cell correction is restricted analytic on a buffer, so the displayed numerators and minors lie in the coefficient Laurent-polynomial algebra.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/hodge-adapted-flag](#hodge-adapted-flag), [HodgeStructuresPartII:H.7/hodge-form-function](#hodge-form-function), `HodgeStructuresPartII:H.3`, `HodgeStructuresPartII:H.6`, `LogicAndDefinabilityInNumberTheory:LD.6`, [HodgeStructuresPartII:H.7/hodge-adapted-flag-refines-filtration](#hodge-adapted-flag-refines-filtration)

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.4 equations (4.2)–(4.5), pp.931–932. Notation Δ is introduced here for the source’s exterior B-values; phases and complex conjugation are retained.


**Acceptance:** For a single pure Tate line, Δ₁=Q(w,conjugate w) and the phase produces its positive Hodge norm. An arbitrary full flag, unrelated to the Hodge filtration, can have an isotropic first vector; no nonvanishing theorem is given for it.

<a id="flat-norm-rough-monomial"></a>

### 8. Rough monomiality of flat multigraded Hodge norms

**Theorem:** `TauCeti.Hodge.Tame.flatNorm_roughMonomial`.

For every nonzero vector u in one summand of either the H.6 simultaneous complex splitting I or any compatible rational weight splitting J, its flat squared norm h_z(u,u) belongs to the LD.6 rough-monomial class on a sufficiently deep orderedSector(n,R,Y). For weight labels σ=(σ₁,…,σₙ) the comparison monomial is m_σ(y)=(y₁/y₂)^{σ₁}⋯(y_{n−1}/yₙ)^{σ_{n−1}}yₙ^{σₙ}. Constants and Y depend on the fixed data, R and u; the two-sided estimate is not asserted for u=0. The same assertion holds in every exterior power with its induced polarized Hodge structure.

**Hypotheses and input data.** H.6 splitting-independent estimates for every compatible splitting, not just a chosen rational J. LD.6 rough-monomial class means a rational coefficient-algebra function bounded above and below by positive multiples of a Laurent monomial.

**Construction/proof.**

1. Invoke H.6’s Kashiwara estimates to get the two-sided comparison with m_σ, including for complex I and determinant vectors.
2. Use gram-determinant-formulas to express the flat diagonal in the fraction algebra.
3. Combine fraction-algebra membership with the imported estimates; this node supplies rough-function membership, not a second proof of Kashiwara’s theorem.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/gram-determinant-formulas](#gram-determinant-formulas), [HodgeStructuresPartII:H.7/ordered-sector](#ordered-sector), `HodgeStructuresPartII:H.6`, `LogicAndDefinabilityInNumberTheory:LD.6`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.4 Lemma 4.7(1), Theorem 4.8, p.931. Separates fraction-algebra membership from the H.6 norm estimate. [Ka85](https://www.jstage.jst.go.jp/article/kyotoms1969/21/4/21_4_853/_pdf), Theorems 3.4.1–3.4.2, p.870; Lemma 2.4.1, pp.863–864. The source estimates use compatible splittings and not a canonical rational-to-complex identification.


**Acceptance:** For a constant Tate line, all centered weight labels are zero and the diagonal is constant. The zero diagonal is not roughly monomial.

<a id="moving-norm-rough-monomial"></a>

### 9. Rough monomiality of moving Hodge norms

**Theorem:** `TauCeti.Hodge.Tame.movingNorm_roughMonomial`.

For nonzero homogeneous u in the simultaneous complex splitting and γ=exp(Σz_iN_i)exp(v(q)), h_z(γu,γu) is roughly monomial on a sufficiently deep ordered sector, including every exterior power. Its monomial is the one from the H.6 moving-section estimate for exp(Σz_iN_i)u. In particular h_z(γW_j,γW_j)=|Δ_j| is roughly monomial. This uses uniform near-identity comparison only after the least height is sufficiently large.

**Hypotheses and input data.** H.6 splitting-independent moving estimates and horizontal correction comparison. The negative-Lie-chart correction is defined and analytic on the closed q-buffer.

**Construction/proof.**

1. Use H.6’s comparison between γu and exp(Σz_iN_i)u, with its depth and transverse-coordinate hypotheses.
2. Use gram-determinant-formulas to show fraction-algebra membership for the moving diagonal.
3. For determinant vectors the adapted flag identifies the absolute B determinant with the positive Hodge determinant.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/gram-determinant-formulas](#gram-determinant-formulas), [HodgeStructuresPartII:H.7/flat-norm-rough-monomial](#flat-norm-rough-monomial), `HodgeStructuresPartII:H.6`, `LogicAndDefinabilityInNumberTheory:LD.6`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.4 Lemma 4.7(2), Lemma 4.10 and final paragraph, pp.931–932. Keeps the deep-height hypothesis used by the exponential-decay comparison.


**Acceptance:** The estimate is stable under compatible changes of splitting because the H.6 supplier states that independence explicitly. The set where yₙ is bounded while y₁ grows is not compact; it is handled by the positive-height theorem below.

<a id="hodge-entry-rough-polynomial"></a>

### 10. Rough polynomiality of Hodge-form entries

**Theorem:** `TauCeti.Hodge.Tame.hodgeEntry_roughPolynomial`.

For all fixed u,v in V_C the function z↦h_z(u,v) is roughly polynomial on a sufficiently deep ordered sector. Here roughly polynomial means g/d with g in the restricted-analytic coefficient Laurent-polynomial algebra and d in that algebra, nowhere zero and roughly monomial, using the repaired LD.6 localization convention. No nonzero hypothesis on u,v is needed. Finite sums, real/imaginary parts and conjugation are allowed by the imported algebra.

**Hypotheses and input data.** Use the repaired denominator convention, not the overly broad printed fraction-field condition. Apply all needed norm comparisons after a common finite maximum of their depth thresholds.

**Construction/proof.**

1. For homogeneous vectors use the Gram formula; its numerator is a coefficient Laurent polynomial.
2. By moving-norm-rough-monomial, Δ_{j−1}Δ_j is a coefficient polynomial roughly monomial in absolute value.
3. Sum over the finite Gram contributions and then over the homogeneous decompositions of u,v using the LD.6 ring laws.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/gram-determinant-formulas](#gram-determinant-formulas), [HodgeStructuresPartII:H.7/moving-norm-rough-monomial](#moving-norm-rough-monomial), `LogicAndDefinabilityInNumberTheory:LD.6`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.4 Proposition 4.6, Lemma 4.7(3) and proof, pp.930–932. The source proof actually yields polynomial denominators with monomial size; this stronger representation makes the claimed ring laws valid.


**Acceptance:** The zero entry belongs to the rough-polynomial ring. In a constant Tate family the entry h(u,v)=u conjugate(v) is a constant coefficient.

**Atlas planet:** Rough polynomiality of Hodge forms.

<a id="determinant-weight-bound"></a>

### 11. The determinant bound for a weight-adapted rational basis

**Theorem:** `TauCeti.Hodge.Tame.determinantWeight_bound`.

Choose any rational basis e_i homogeneous for the H.6 simultaneous weight splitting J of V_Q. For b_z, the real symmetric restriction of h_z, there are C>1 and Y such that ∏_i b_z(e_i,e_i)<C det(b_z in e) on orderedSector(n,R,Y). Each centered monodromy weight filtration has total weight zero, so the product of all comparison monomials is one. The determinant is a fixed positive multiple of |det Q in e| and is constant along the period domain. The basis need not be integral and no fixed ordering of its diagonal norms is asserted.

**Hypotheses and input data.** Fixed finite rank polarized pure variation, rational splitting J and fixed ordered rational basis. H.3 faithful derived representation has determinant one; pure Hodge numbers are fixed.

**Construction/proof.**

1. Use flat-norm-rough-monomial for each of the finitely many basis vectors.
2. The centered weight multiset is symmetric by monodromy polarization, hence its total is zero at every partial filtration.
3. The Weil operator has fixed determinant on the component; thus det b is fixed and nonzero. Take C strictly larger than the product bound divided by this determinant.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/flat-norm-rough-monomial](#flat-norm-rough-monomial), [HodgeStructuresPartII:H.7/hodge-form-function](#hodge-form-function), `HodgeStructuresPartII:H.3`, `HodgeStructuresPartII:H.6`, `AdelicAlgebraicGroups:AA.3/reduced-form`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.5 paragraph following the Claim, p.933. The determinant condition is independent of diagonal ordering and survives rational, rather than integral, basis choices.


**Acceptance:** In rank two with weights +1 and −1, the diagonal comparison product is constant. The same two diagonal entries can exchange order in more than one variable.

<a id="curvewise-reducedness"></a>

### 12. Reducedness along rational degeneration curves

**Theorem:** `TauCeti.Hodge.Tame.curvewiseReducedness`.

On every source curve used in the corrected LD.6 curve lemma—positive rational slopes among any initial block of degeneration coordinates, real intercepts, and the other coordinates fixed—the real Hodge form satisfies |b_z(e_i,e_j)|≤C_τ b_z(e_i,e_i) for the fixed rational weight-adapted basis e. A finite reordering of e is permitted for full reducedness. The constant C_τ depends on the curve; there is no uniformity in all curves at this step.

**Hypotheses and input data.** Schmid’s one-variable finite Siegel theorem is supplied by H.6, including finite algebraic covers clearing rational slopes. The rational curve extends to a one-variable polarized variation after that cover.

**Construction/proof.**

1. Apply the one-variable H.6 theorem to the pullback period map.
2. Use AA.3/orbit-map-siegel-image and reduction-siegel-dictionary to obtain reducedness in some rational basis e′ along each of finitely many Siegel pieces.
3. Transfer the off-diagonal estimates to e using determinant-weight-bound and AA.3/basis-change-reducedness. Sorting e changes only the order condition, not the off-diagonal inequalities.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/determinant-weight-bound](#determinant-weight-bound), `HodgeStructuresPartII:H.6`, `AdelicAlgebraicGroups:AA.3/orbit-map-siegel-image`, `AdelicAlgebraicGroups:AA.3/reduction-siegel-dictionary`, `AdelicAlgebraicGroups:AA.3/basis-change-reducedness`, `LogicAndDefinabilityInNumberTheory:LD.6`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.5 final paragraph of the proof, p.933. This is the one-variable input to the curve lemma; constants may depend on τ.


**Acceptance:** A fixed one-dimensional nilpotent orbit gives one-variable Siegel containment directly. Only rational positive slopes enter the curve lemma; arbitrary analytic curves are not being classified.

<a id="uniform-reducedness"></a>

### 13. Uniform reducedness with finitely many basis orderings

**Theorem:** `TauCeti.Hodge.Tame.uniformReducedness`.

There are a rational weight-adapted basis e, Y>0 and C>1 such that on orderedSector(n,R,Y) every b_z is (σe,C)-reduced for at least one permutation σ of its m basis vectors. The off-diagonal inequalities and determinant-product bound hold uniformly in the original basis; σ orders its diagonal norms. Thus the image lies in the union of at most m! AA.3 reduced-form sets. There need not be a single fixed ordering valid everywhere.

**Hypotheses and input data.** Use LD.6’s repaired curve lemma on every bounded real width, with constants allowed to depend on that width. Use the repaired roughly-polynomial class from hodge-entry-rough-polynomial.

**Construction/proof.**

1. Apply LD.6 curve transfer to each numerator b(e_i,e_j), using its roughly-polynomial representation, and denominator b(e_i,e_i), using flat-norm-rough-monomial.
2. The curvewise bounds supply each test-curve hypothesis. Take the maximum of the finitely many global constants and combine with determinant-weight-bound.
3. At each z sort the finitely many positive diagonal norms. Taking C>1 gives the strict reducedness inequalities even for ties.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/curvewise-reducedness](#curvewise-reducedness), [HodgeStructuresPartII:H.7/hodge-entry-rough-polynomial](#hodge-entry-rough-polynomial), [HodgeStructuresPartII:H.7/flat-norm-rough-monomial](#flat-norm-rough-monomial), [HodgeStructuresPartII:H.7/determinant-weight-bound](#determinant-weight-bound), `LogicAndDefinabilityInNumberTheory:LD.6`, `AdelicAlgebraicGroups:AA.3/reduced-form-set`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.5 Claim and last paragraph, p.933. Corrects the source’s fixed-ordering assertion while preserving the finite-union conclusion.


**Acceptance:** For diag(y₁/y₂²,y₂²/y₁) with y₁≥y₂≥1, either diagonal can be smaller; the two basis permutations suffice. A varying permutation is allowed; the claim is a finite cover, not a continuous basis choice.

<a id="deep-siegel-containment"></a>

### 14. Finite Siegel containment on deep sectors

**Theorem:** `TauCeti.Hodge.Tame.deepSiegelContainment`.

For the lifted period map Φ̃ into its general Mumford–Tate domain D=G/M, the image of orderedSector(n,R,Y) for some Y is contained in finitely many rational Siegel sets of D associated with its one fixed canonical maximal compact K_t⊃M. Use a faithful rational representation of the derived Hodge group (or a faithful central cover) on V; the adjoint quotient is not assumed to act on V. The metric map D→G/K_t→X sends Φ̃ to b_z.

**Hypotheses and input data.** H.3 supplies faithful rational representation, compact metric stabilizer, Weil/Cartan compatibility, and quotient transport across a finite central cover. All source and target Siegel conventions fix their compacts.

**Construction/proof.**

1. Uniform-reducedness and AA.3/reduction-siegel-dictionary put b_z in finitely many Siegel sets of X.
2. Apply AA.3/orbit-map-siegel-preimage; its Cartan and forward-containment hypotheses are checked by H.3’s canonical Hodge metric.
3. Lift the resulting Siegel sets from G/K_t to G/M: the compact fibre K_t/M is already included in the Siegel compact factor. Transport finite central quotients using the H.3 supplier.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/uniform-reducedness](#uniform-reducedness), `HodgeStructuresPartII:H.3`, `AdelicAlgebraicGroups:AA.3/reduction-siegel-dictionary`, `AdelicAlgebraicGroups:AA.3/orbit-map-siegel-preimage`, `AdelicAlgebraicGroups:AA.3/real-siegel-set`, [HodgeStructuresPartII:H.7/ordered-sector-permutation-cover](#ordered-sector-permutation-cover)

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.5 first two paragraphs, pp.932–933. Uses the corrected inverse-image result, not the printed Borel–Harish-Chandra citation. [BKT23](https://benjamin-bakker.github.io/DefArithErr.pdf), §1.5, p.3. The erratum identifies the rational inverse-Siegel supplier.


**Acceptance:** Every Siegel set in this conclusion uses the same K_t. Replacing the faithful derived representation by an adjoint action on V would be an invalid step.

<a id="positive-height-siegel-cover"></a>

### 15. Finite Siegel containment at every positive height

**Theorem:** `TauCeti.Hodge.Tame.positiveHeightSiegelCover`.

For every R≥0 and η>0 whose closed q-buffer lies in the extension domain, Φ̃(boundedSector(n,R,η)) lies in finitely many Siegel sets of D for the same canonical K_t. The theorem includes mixed regions with some heights bounded and others arbitrarily large. A compactness argument on {yₙ≤Y} is invalid. The proof uses finitely many buffered normal-crossings charts on the compact closed q-polydisc and uniform estimates with the nondegenerating coordinates retained as compact parameters.

**Hypotheses and input data.** H.6 nilpotent-orbit and norm theorems with compact analytic parameters in partly degenerating charts. H.3 canonical symmetric-space projection and basepoint/compact-coordinate transport.

**Construction/proof.**

1. Cover the compact closed q-buffer, including every incident partial boundary stratum, by finitely many smaller analytic charts with closed buffers inside larger charts.
2. At each chart make only its vanishing coordinates deep; retain all nonzero coordinates as compact parameters. Apply deep-siegel-containment uniformly in these parameters and use the finite coordinate orderings.
3. For local boundary equations differing by nonvanishing analytic units, choose bounded logarithms on the buffer; the new real widths remain finite. Bounded-width lift choices differ by finitely many integral monodromy translates.
4. Transport each local compact choice back through the same canonical metric projection; AA.3/real-siegel-translation handles the corresponding right-coordinate change and rational left monodromy translations. Union the finite families.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/deep-siegel-containment](#deep-siegel-containment), [HodgeStructuresPartII:H.7/bounded-sector](#bounded-sector), [HodgeStructuresPartII:H.7/sector-uniformization](#sector-uniformization), `HodgeStructuresPartII:H.3`, `HodgeStructuresPartII:H.6`, `AdelicAlgebraicGroups:AA.3/real-siegel-translation`, [HodgeStructuresPartII:H.7/ordered-sector-permutation-cover](#ordered-sector-permutation-cover)

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), Theorem 1.5, p.921; §4.5, pp.932–933. The positive-height statement needs this partial-boundary continuation in addition to the printed deep-sector proof.


**Acceptance:** The sequence (y₁,y₂)=(t,2) is covered by a one-boundary chart, not a compact region in the logarithmic coordinates. A chart with no vanishing coordinates contributes a compact analytic image and finitely many Siegel pieces.

**Atlas planet:** Finite Siegel containment.

<a id="local-period-definability"></a>

### 16. Definability on buffered normal-crossings charts

**Theorem:** `TauCeti.Hodge.Tame.localPeriod_definable`.

Let a polarized integral pure VHS be defined on a neighbourhood of the closure of a normal-crossings chart U=(Δ_ρ^*)^r×Δ_ρ^{d−r}, 0<ρ<1, with coordinate radii strictly smaller than that neighbourhood. Its period map into the arithmetic Hodge manifold with the canonical fixed-K definable structure is R_an,exp-definable on U. Quasi-unipotent monodromy is made unipotent by a finite coordinate power cover; trivial-monodromy interior coordinates are retained and angular seams are included.

**Hypotheses and input data.** H.2 integral polarized VHS and H.6 quasi-unipotence. The fixed-K arithmetic definable quotient supplier is missing from the current atlas and is recorded as gap G1. The complex algebraic base charts use their canonical R_alg structure; analytic coordinate changes on compact buffers are R_an-definable.

**Construction/proof.**

1. Take finite coordinate power covers to obtain unipotent monodromy, with buffered radii in the covering chart.
2. Use sector-lift-definable, positive-height-siegel-cover and the fixed-K quotient supplier: quotient restriction is definable on each of finitely many Siegel sets.
3. Choose half-open angular strips; the definable image of (q,πΦ̃) is exactly the local period graph. Finite union and graph-image calculus are supplied by LD.6.
4. Descend the graph through the finite definable coordinate cover. Mixed interior coordinates are handled directly as analytic parameters; treating an interior disc as punctured alone would omit its centre.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/sector-lift-definable](#sector-lift-definable), [HodgeStructuresPartII:H.7/positive-height-siegel-cover](#positive-height-siegel-cover), `ShimuraData:D3/polarized-integral-variation`, `HodgeStructuresPartII:H.3`, `HodgeStructuresPartII:H.6`, `LogicAndDefinabilityInNumberTheory:LD.6`, `mathlib:Set.Definable`, [HodgeStructuresPartII:H.3/monodromy-descent](HodgeStructuresPartII--H.3.md), [HodgeStructuresPartII:H.7/sector-uniformization-half-open-surjective](#sector-uniformization-half-open-surjective)

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §4.1–4.2 Theorem 4.1, Lemma 4.2 and proof, pp.928–929. This is the buffered form of the local statement, with the outer-boundary gap and angular seam repaired.


**Acceptance:** A constant Tate variation is definable on a full smaller disc including its centre. The original open-polydisc statement without a buffer is not asserted.

<a id="global-period-definability"></a>

### 17. Definability of the period map

**Theorem:** `TauCeti.Hodge.Tame.globalPeriod_definable`.

Let S be a smooth connected quasi-projective complex algebraic variety and V a polarized integral variation of pure Hodge structure on S. Its period map to the connected arithmetic Hodge manifold Hod⁰(S,V), constructed from the generic Mumford–Tate datum and endowed with its canonical fixed-K R_alg/R_an structure, is R_an,exp-definable. It is not asserted R_an-definable, and the target need not be Hermitian symmetric or an algebraic variety.

**Hypotheses and input data.** Torsion is removed from the integral local system; rational polarization may be scaled to an integral one. Use a torsion-free arithmetic level after a finite cover; finite-quotient descent is part of the H.3 quotient contract.

**Construction/proof.**

1. Import the smooth projective compactification with strict normal-crossings boundary from R09.7d.
2. Choose finitely many buffered analytic charts whose smaller members still cover the compactification; coordinate changes are restricted analytic.
3. Apply local-period-definability on each mixed chart.
4. Use LD.6 finite-atlas graph gluing and finite-cover descent to recover the original level and S.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/local-period-definability](#local-period-definability), `ShimuraData:D3/polarized-integral-variation`, `HodgeStructuresPartII:H.3`, `LogicAndDefinabilityInNumberTheory:LD.6`, `AlgebraicModuliForArithmeticGeometry:R09.7d`, [HodgeStructuresPartII:H.3/monodromy-descent](HodgeStructuresPartII--H.3.md)

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), Theorem 1.3, p.920; §4.1 complete reduction, p.928. Global definability follows from the finite buffered SNC cover, not from arbitrary analytic atlases.


**Acceptance:** The nodal elliptic degeneration requires exp in its cusp coordinate; the conclusion is R_an,exp. The conclusion applies to non-Hermitian Mumford–Tate domains.

**Atlas planet:** Definability of period maps.

<a id="special-hodge-image"></a>

### 18. Special subvarieties of a Hodge manifold

**Definition:** `TauCeti.Hodge.Tame.specialHodgeImage`.

Given a rational morphism f of connected pure Hodge manifolds at compatible arithmetic levels, specialHodgeImage(f) is its set-theoretic image. The morphism and its holomorphic quotient carrier are imported from H.3. This definition includes the identity image; an exceptional Hodge-locus index subsequently restricts to proper Mumford–Tate subdata of the fixed generic datum. It does not call every analytic subvariety special and does not assert that the target is algebraic.

**Hypotheses and input data.** Rational pure Hodge-data morphism, compatible levels and component choices as in H.3. Use canonical compacts; Hodge compatibility implies the Cartan conditions of the erratum.

**Construction/proof.**

1. Take the range of the supplied map.
2. Use H.3 to identify kernel/image factorizations and the image of the corresponding rational subdatum.

**Direct prerequisites:** `HodgeStructuresPartII:H.3`, `ShimuraData:D1/mumford-tate-group`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §5 first two paragraphs, pp.933–934. Defines the image, with analytic and definable properties proved in separate nodes. [K17](https://arxiv.org/pdf/1711.09387v1), §3.4 Definition 3.12, p.12. Imports the Hodge morphism rather than constructing it again.

**Uses that determine the API.** BKT §5: Each individual special image has an algebraic pullback. Klingler §3.4; BKT Hodge-locus argument: Proper rational subdata index the exceptional locus after the generic identity image is excluded.

**API.**

- `TauCeti.Hodge.Tame.specialHodgeImage.mem_iff` (characterisation): A point belongs to the image exactly when it has a preimage under the Hodge morphism.
- `TauCeti.Hodge.Tame.specialHodgeImage.id` (simp): The identity morphism has the whole target as its image.
- `TauCeti.Hodge.Tame.specialHodgeImage.comp` (functoriality): The special image of g composed with f is g applied to the special image of f.

**Unit tests.**

- `TauCeti.Hodge.Tame.specialHodgeImage_test_identity` (degenerate): The identity image is the whole Hodge manifold.
- `TauCeti.Hodge.Tame.specialHodgeImage_test_point` (computation): The image of a point Hodge datum is the singleton containing its Hodge point.
- `TauCeti.Hodge.Tame.specialHodgeImage_test_empty` (degenerate): A range whose underlying domain is empty is empty; the set operation does not manufacture a special point.

**Acceptance:** An identity morphism has the entire target as its special image, so properness is a separate restriction.

<a id="special-image-definable"></a>

### 19. Definability of special Hodge images

**Theorem:** `TauCeti.Hodge.Tame.specialImage_definable`.

Every specialHodgeImage(f) is R_alg-definable in the canonical R_alg structures of the pure Hodge manifolds, hence R_an,exp-definable. Hodge compatibility of f makes its induced Lie-algebra map a Hodge map, so it carries the canonical compact into the conjugated target compact and the target Weil/Cartan involution preserves its image. The analogous statement for an arbitrary rational quotient map without Cartan compatibility is false.

**Hypotheses and input data.** H.3 rational pure Hodge morphism and its induced adjoint Hodge map. Fixed-K arithmetic-quotient definability and corrected functoriality: gap G1.

**Construction/proof.**

1. Invoke H.3’s canonical compact/Cartan compatibility for the Hodge morphism.
2. Apply the generic fixed-K functoriality supplier, exactly as BKT23 Corollary 1.3 does.
3. Take the definable image using LD.6 projection calculus.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/special-hodge-image](#special-hodge-image), `HodgeStructuresPartII:H.3`, `LogicAndDefinabilityInNumberTheory:LD.6`, `AdelicAlgebraicGroups:AA.3/orr-schnell-containment`

**Source:** [BKT23](https://benjamin-bakker.github.io/DefArithErr.pdf), §1.4 Corollary 1.3 and proof, p.3. Replaces the nonexistent Theorem 1.1(3) cited in the original §5.


**Acceptance:** The identity special image is definable. The erratum’s Cartan-incompatible arithmetic maps are excluded.

<a id="special-image-closed-analytic"></a>

### 20. Closed analyticity of special Hodge images

**Theorem:** `TauCeti.Hodge.Tame.specialImage_closedAnalytic`.

For a rational Hodge morphism f at compatible arithmetic levels, specialHodgeImage(f) is a closed complex analytic subset of the target. Factor out its group kernel first: the original source map need not be proper when its kernel is noncompact. On the image datum, use a compatible finite-index arithmetic level and the proper arithmetic immersion of the rational reductive subdomain, then the proper holomorphic image theorem. Closedness and analyticity are independent of definability and must not be inferred from it alone.

**Hypotheses and input data.** H.3 kernel/image Hodge-data factorization and holomorphic quotient maps. AA.3 proper arithmetic subdomain immersion supplier requested below. ComplexComparisonPartII:C4 proper analytic image extension requested below.

**Construction/proof.**

1. Factor the rational group morphism through its represented reductive image, preserving connected domain and level data.
2. The image-domain stabilizer is the intersection with the ambient compact stabilizer. Use the requested proper arithmetic immersion theorem at the intersection level; a finite-index source level changes it by a finite cover.
3. Use proper holomorphic image to obtain a closed analytic subset; this is the unstated input behind the last paragraph of BKT §5.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/special-hodge-image](#special-hodge-image), `HodgeStructuresPartII:H.3`, `AdelicAlgebraicGroups:AA.3`, `ComplexComparisonPartII:C4`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §5 final paragraph, p.934. The paper assumes this input; its proof is an explicit supplier gap rather than a claim obtained from definability. [PS09](https://math.haifa.ac.il/kobi/analytic.pdf), §6.1 Theorem 6.1 and remarks, draft p.16. A stronger alternative image theorem also needs closedness and tame local geometry.


**Acceptance:** A positive-dimensional noncompact group kernel must be removed before claiming properness. Closedness in the noncompact arithmetic target is required, not only analyticity in local domain charts.

<a id="tensor-hodge-locus"></a>

### 21. The type-(0,0) locus of one rational flat tensor

**Definition:** `TauCeti.Hodge.Tame.tensorHodgeLocus`.

On a simply connected flat trivialization U of a tensor construction T_Q of the variation, with embedding r:T_Q→T_C, define tensorHodgeLocus(t)={u : r(t) has type (0,0) at u}. For pure weight n, its type-(0,0) subspace is hs_u.piece(0) when n=0 and the zero subspace when n≠0. Tensor constructions here are finite sums of V^{⊗a}⊗(V^∨)^{⊗b}, with an explicitly recorded Tate twist when a (p,p) class is to be tested: T(p) shifts it to type (0,0). This is not a test for untwisted (p,p) invariance under the full Mumford–Tate group.

**Hypotheses and input data.** Finite tensor construction with native fibrewise tensor/dual/Tate operations supplied by H.2/H.3; rational flat vector in a trivialization. Real rational vectors are fixed by the lattice conjugation.

**Construction/proof.**

1. Use the native HodgeStructureOn.piece and the weight guard to form the relevant type-zero subspace.
2. Take the inverse image under the rational embedding of that subspace, pointwise on U.
3. Tate shifts use the native convention Z(m) of weight −2m; no new Tate structure is defined.

**Direct prerequisites:** `tauceti:TauCeti.Hodge.HodgeStructureOn.piece`, `tauceti:TauCeti.Hodge.tate_piece`, `HodgeStructuresPartII:H.3`, `ShimuraData:D3/polarized-integral-variation`, [HodgeStructuresPartII:H.3/orbit-hodge-tensors](HodgeStructuresPartII--H.3.md)

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §1.4 definition of Hodge locus, pp.921–922. Uses exceptional type-zero tensors, with the native Tate convention pinned. [K17](https://arxiv.org/pdf/1711.09387v1), §2.4 tensor characterization and Lemma 2.5(a), p.8. The rational full-torus invariant convention, rather than the restricted norm-one torus.

**Uses that determine the API.** Klingler Lemma 2.5 and §2.6: Detects rational tensors gained when the Mumford–Tate group drops. HodgeStructuresPartII:H.7/exceptional-hodge-locus: Provides each summand of the exceptional tensor union.

**API.**

- `TauCeti.Hodge.Tame.tensorHodgeLocus.mem_iff` (characterisation): Membership is membership of r(t) in the weight-guarded native piece-zero submodule.
- `TauCeti.Hodge.Tame.tensorHodgeLocus.zero` (simp): The zero tensor has the whole base as its locus.
- `TauCeti.Hodge.Tame.tensorHodgeLocus.constant` (compatibility): For a constant pure structure the locus is the whole base or empty according to its native type-zero membership.
- `TauCeti.Hodge.Tame.tensorHodgeLocus.pullback` (functoriality): Replacing hs_u by hs_{g(u)} pulls the locus back along g.

**Unit tests.**

- `TauCeti.Hodge.Tame.tensorHodgeLocus_test_tate_zero` (computation): The rational generator of the constant weight-zero Tate line has the whole base as its locus.
- `TauCeti.Hodge.Tame.tensorHodgeLocus_test_zero` (degenerate): For every pure weight, the zero tensor has the whole base as its locus.
- `TauCeti.Hodge.Tame.tensorHodgeLocus_test_untwisted_tate` (non-example): The rational generator of constant Z(−1), weight two, has empty untwisted type-zero locus; it is not a generic-Mumford–Tate invariant.

**Acceptance:** The zero tensor is type (0,0) everywhere but is never exceptional. The nonzero generator of constant Z(−1) is untwisted type (1,1), hence has empty type-zero locus; after twist (1) it is type zero everywhere.

<a id="exceptional-hodge-locus"></a>

### 22. The exceptional Hodge locus

**Definition:** `TauCeti.Hodge.Tame.exceptionalHodgeLocus`.

Fix the generic Mumford–Tate datum of V and a universal-cover flat trivialization π:U→S. Index all rational vectors t in all permitted finite tensor constructions (including explicitly specified Tate twists). Let G be the set of these tensors that are type (0,0) for the generic datum. Define exceptionalHodgeLocus(V)=π({u : some t∉G belongs to tensorHodgeLocus(t) at u}). Monodromy acts on both the tensor index and G, so this set is independent of lift/trivialization. Generic tensors, including zero, are excluded. The index is countable, but neither the union nor its image is asserted definable.

**Hypotheses and input data.** H.3 generic Mumford–Tate group, tensor-invariant characterization and monodromy-stable generic tensor subspaces. Smooth connected base, supplied universal cover and flat trivialization.

**Construction/proof.**

1. For each tensor construction take all rational vectors outside its generic invariant subspace.
2. Take the union of the corresponding tensor loci on the cover and its image under π.
3. Transport tensors under monodromy to prove saturation and independence of the chosen lift; generic invariants are stable.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/tensor-hodge-locus](#tensor-hodge-locus), `HodgeStructuresPartII:H.3`, `ShimuraData:D1/mumford-tate-group`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §1.4 definition of HL(S,V), pp.921–922. Excludes generically Hodge tensors. [K17](https://arxiv.org/pdf/1711.09387v1), §2.6 first paragraph, p.9. The intended exceptional locus records strict drops from the generic group.

**Uses that determine the API.** BKT Theorem 1.6 and §5: This is the exceptional union whose algebraicity is proved component by component. HodgeStructuresPartII:H.8: Distinguishes ordinary (p,p) classes used by Noether–Lefschetz interfaces from exceptional type-zero tensors.

**API.**

- `TauCeti.Hodge.Tame.exceptionalHodgeLocus.mem_iff` (characterisation): s is in the locus exactly when it has a lift u and a nongeneric rational tensor that is type zero at u.
- `TauCeti.Hodge.Tame.exceptionalHodgeLocus.generic_all` (simp): If every indexed tensor is generic, the exceptional locus is empty.
- `TauCeti.Hodge.Tame.exceptionalHodgeLocus.preimage_eq` (compatibility): When the nongeneric-tensor union is monodromy-saturated, its pullback under the covering projection is exactly that union.
- `TauCeti.Hodge.Tame.exceptionalHodgeLocus.empty_of_generic` (characterisation): If every tensor with a nonempty type-zero locus is generic, the exceptional locus is empty.

**Unit tests.**

- `TauCeti.Hodge.Tame.exceptionalHodgeLocus_test_generic` (degenerate): If G is the full tensor index, the locus is empty even if every tensor locus is the entire base.
- `TauCeti.Hodge.Tame.exceptionalHodgeLocus_test_constant` (non-example): If all tensors that occur as Hodge tensors anywhere are generic, the exceptional locus is empty; this includes constant Tate and CM variations.
- `TauCeti.Hodge.Tame.exceptionalHodgeLocus_test_single_gain` (computation): On a two-point trivial cover, one nongeneric tensor with locus {0} and all other tensors generic gives exceptional locus exactly {0}, not the entire base.

**Acceptance:** A constant Tate variation has empty exceptional locus even though it has many ordinary Hodge classes after twists. A constant CM weight-one variation has empty exceptional locus in its own generic datum; embedding it in a larger ambient domain does not change this definition.

**Atlas planet:** Hodge locus.

<a id="local-tensor-locus-analytic"></a>

### 23. Analyticity of a fixed rational tensor locus

**Theorem:** `TauCeti.Hodge.Tame.localTensorLocus_analytic`.

On a simply connected complex chart with flat rational t, tensorHodgeLocus(t) is closed complex analytic. In weight zero, reality of t makes type-(0,0) equivalent to t∈F^0; it is the zero locus of the holomorphic section of the quotient bundle T_C/F^0. In nonzero weight the locus is the whole chart for t=0 and empty for t≠0. This local assertion does not by itself prove closedness of arbitrary projected monodromy orbits on S.

**Hypotheses and input data.** H.3/H.2 holomorphic subbundle filtration and flat tensor section. ComplexComparisonPartII:C0 analytic ideal/subspace and zero-locus calculus.

**Construction/proof.**

1. Use native opposedness and rational conjugation to identify the real weight-zero intersection with F^0.
2. Pass to the holomorphic quotient bundle and its section; finite local holomorphic equations cut out the zero set.
3. For other weights apply the weight-zero guard and injectivity of rational complexification.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/tensor-hodge-locus](#tensor-hodge-locus), `HodgeStructuresPartII:H.3`, `ComplexComparisonPartII:C0`, [HodgeStructuresPartII:H.3/polarized-compact-dual](HodgeStructuresPartII--H.3.md), [HodgeStructuresPartII:H.3/mt-orbit-open](HodgeStructuresPartII--H.3.md)

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §1.4 analytic locus sentence, p.921. This local proof supplies the fixed-tensor assertion without presupposing algebraicity. [K17](https://arxiv.org/pdf/1711.09387v1), §2.4 Hodge classes; §2.6, pp.8–9. For a real pure weight-zero tensor, membership in F⁰ implies membership in its conjugate.


**Acceptance:** A flat nonzero Tate weight-two tensor has the empty type-zero locus. One cannot infer the global exceptional union is closed analytic from this local statement.

<a id="exceptional-special-preimage"></a>

### 24. Hodge locus as strict special pullbacks

**Theorem:** `TauCeti.Hodge.Tame.exceptionalSpecial_preimage`.

With the generic datum fixed as in exceptional-hodge-locus, HL(S,V) is the union of Φ_S^{-1}(Y) over strict rational Mumford–Tate special images Y in that connected Hodge manifold. These are the images of subdata enforcing at least one nongeneric type-(0,0) rational tensor; the generic identity image is excluded. The equality is independent of monodromy lift and finite-level cover. No assertion is made about the exceptional locus of an arbitrary larger ambient period domain.

**Hypotheses and input data.** H.3 tensor/subdatum correspondence for pure polarizable rational structures, represented full-torus conventions and generic datum. Compatible arithmetic image/level factorization of Hodge subdata.

**Construction/proof.**

1. A nongeneric rational tensor at a point gives its rational stabilizer subgroup and the connected Mumford–Tate subdatum containing that point. The H.3 tensor/subdatum supplier produces a strict special image.
2. Conversely a point in such an image has a proper Mumford–Tate subgroup of the generic group; the tensor-invariant characterization supplies an extra rational type-zero tensor.
3. Use monodromy saturation and finite-level transport to identify their unions on S.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/exceptional-hodge-locus](#exceptional-hodge-locus), [HodgeStructuresPartII:H.7/special-hodge-image](#special-hodge-image), `HodgeStructuresPartII:H.3`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §5 second paragraph, p.934. Uses the corrected strict-special interpretation of the source’s preimage formula. [K17](https://arxiv.org/pdf/1711.09387v1), Lemma 2.5(a), §2.6 and Definition 3.13, pp.8–9,13. The printed Definition 3.13 must exclude the identity when used for the exceptional locus.


**Acceptance:** For a constant CM variation the generic domain is a point and has no strict exceptional subdatum. Including the identity image would make the union all of S and is therefore excluded.

<a id="rational-special-countability"></a>

### 25. Countability of the relevant rational special images

**Theorem:** `TauCeti.Hodge.Tame.rationalSpecial_countability`.

The strict rational special images of a fixed pure generic datum needed in exceptional-special-preimage have a countable indexing set. Rational tensor constructions have countably many rational vectors; each stabilizer/subdatum construction has finitely or countably many connected component and arithmetic-level choices. Taking the finite irreducible-component lists of the resulting algebraic pullbacks retains countability. This is set-theoretic countability, not a definable parameter family.

**Hypotheses and input data.** Finite dimensional rational spaces; countably many tensor constructions and Tate indices. H.3 tensor-to-rational-subdatum correspondence and countably many connected-component/level choices. Finite algebraic components use the native Noetherian theorem.

**Construction/proof.**

1. Use a finite rational basis to identify each rational tensor space with Q^m.
2. Take a countable union over tensor arities, twists and finite lists of rational tensors; rational algebraic subgroups also have finite rational polynomial presentations.
3. Use the H.3 connected-component/level contract and Noetherian finite-component theorem for each eventual algebraic pullback.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/exceptional-special-preimage](#exceptional-special-preimage), `HodgeStructuresPartII:H.3`, `mathlib:TopologicalSpace.NoetherianSpace.finite_irreducibleComponents`, `mathlib:AlgebraicGeometry.finite_irreducibleComponents_of_isNoetherian`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §5 second paragraph, p.934. The countable union is not a finite definable union.


**Acceptance:** A countable union of singletons in an elliptic/modular family can be infinite; o-minimality forbids treating its index as a definable discrete set.

<a id="special-pullback-algebraic"></a>

### 26. Algebraicity of each special pullback

**Theorem:** `TauCeti.Hodge.Tame.specialPullback_algebraic`.

For S smooth quasi-projective complex algebraic, V polarized integral pure and Y any specialHodgeImage in its canonical arithmetic Hodge target, W=Φ_S^{-1}(Y) is a closed algebraic subset of S. It has finitely many irreducible algebraic components. If Y is strict relative to the generic datum and meets the period image, W is a proper subset. Algebraicity here concerns the reduced closed subset, not automatic algebraization of an analytic ideal with nilpotents.

**Hypotheses and input data.** Global-period-definability and the two independent properties of Y: closed analytic and definable. LD.6 definable analytic Chow for a closed complex analytic subset of a smooth algebraic variety in an o-minimal expansion of R_an. Finite-type algebraic Noetherian/irreducible-component supplier.

**Construction/proof.**

1. Use the definable period graph and definable Y to take its definable inverse image.
2. Use holomorphy and closed analyticity of Y for the analytic inverse image.
3. Apply the LD.6 Peterzil–Starchenko theorem in the canonical algebraic definable atlas of S; take the reduced algebraic subset.
4. Use Noetherian finite irreducible decomposition. Genericity excludes W=S for strict subdata.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/global-period-definability](#global-period-definability), [HodgeStructuresPartII:H.7/special-image-definable](#special-image-definable), [HodgeStructuresPartII:H.7/special-image-closed-analytic](#special-image-closed-analytic), `LogicAndDefinabilityInNumberTheory:LD.6`, `ComplexComparisonPartII:C0`, `HodgeStructuresPartII:H.3`, `mathlib:TopologicalSpace.NoetherianSpace.finite_irreducibleComponents`, `mathlib:AlgebraicGeometry.finite_irreducibleComponents_of_isNoetherian`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), §5 final paragraph, p.934; §4.6 Theorem 4.13, p.933. The proof uses analytic and definable inputs separately. [PS09](https://math.haifa.ac.il/kobi/analytic.pdf), Theorem 4.4 and Corollary 4.5, draft p.12. The generic o-minimal Chow theorem is imported from LD.6.


**Acceptance:** Y equal to the whole target gives W=S, which is algebraic; properness requires a strict datum. A merely definable real arc in S is not complex analytic and does not meet the theorem’s hypotheses.

**Atlas planet:** Algebraicity of special pullbacks.

<a id="hodge-locus-algebraicity"></a>

### 27. Algebraicity of Hodge loci

**Theorem:** `TauCeti.Hodge.Tame.hodgeLocus_algebraicity`.

For a polarized integral variation of pure Hodge structure on a smooth connected quasi-projective complex variety S, its exceptional Hodge locus is a countable union of proper closed irreducible algebraic subvarieties of S. Enumerate the strict rational special images, take their algebraic pullbacks, and then their finite irreducible decompositions. The entire countable union need not be closed, algebraic or definable. No mixed/admissible or real Noether–Lefschetz theorem is claimed here.

**Hypotheses and input data.** All hypotheses of global-period-definability; the generic datum used by exceptional-hodge-locus.

**Construction/proof.**

1. Identify the exceptional set by exceptional-special-preimage.
2. Apply special-pullback-algebraic individually, without taking an infinite definable union.
3. Use rational-special-countability and each pullback’s finite irreducible decomposition to enumerate the closed irreducible algebraic subvarieties.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/exceptional-special-preimage](#exceptional-special-preimage), [HodgeStructuresPartII:H.7/rational-special-countability](#rational-special-countability), [HodgeStructuresPartII:H.7/special-pullback-algebraic](#special-pullback-algebraic)

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), Theorem 1.6, p.922; §5 complete proof, pp.933–934. This is the BKT proof of the pure Hodge-locus theorem with corrected generic and definability conventions.


**Acceptance:** Constant Tate and constant CM variations have empty exceptional locus in their own generic datum. Infinitely many CM points in a nonconstant elliptic variation illustrate why the final union is not asserted definable.

**Atlas planet:** Algebraicity of Hodge loci.

<a id="compact-target-period-definability"></a>

### 28. Restricted-analytic definability for compact Hodge targets

**Theorem:** `TauCeti.Hodge.Tame.compactTargetPeriod_definable`.

Under the hypotheses of global-period-definability, if the arithmetic Hodge target is compact, the period map is R_an-definable. After a compatible neat congruence level, local monodromy is unipotent by H.6 quasi-unipotence and contains no nontrivial unipotent by the cocompact arithmetic theorem. Hence local monodromy is trivial and the period map extends holomorphically across a smooth SNC compactification. Compact analytic chart graphs are restricted analytic; finite atlas gluing and level descent prove the claim.

**Hypotheses and input data.** Smooth quasi-projective base and polarized integral pure VHS as in the global theorem. Compact target, canonical compact stabilizer, and compatible neat congruence-level cover. H.6 finite-monodromy extension into the period domain, not merely into the compact dual.

**Construction/proof.**

1. Compactness of Γ\G/M with M compact implies compactness of Γ\G. Apply AA.3/cocompact-no-unipotents at the compatible congruence level.
2. At the compatible neat level, quasi-unipotence implies unipotence because the multiplicative group generated by eigenvalues contains no nontrivial root of unity. Cocompact-no-unipotents then forces boundary monodromy to be the identity. Apply the finite-monodromy extension case of H.6.
3. Cover the compactification and compact target by finitely many buffered analytic charts, compare with the canonical atlases, and descend from the finite level using LD.6.

**Direct prerequisites:** `ShimuraData:D3/polarized-integral-variation`, `HodgeStructuresPartII:H.3`, `HodgeStructuresPartII:H.6`, `AdelicAlgebraicGroups:AA.3/cocompact-no-unipotents`, `LogicAndDefinabilityInNumberTheory:LD.6`, `AlgebraicModuliForArithmeticGeometry:R09.7d`

**Source:** [BKT20](https://par.nsf.gov/servlets/purl/10200187), Remarks 1.4(1), p.921. The stronger R_an special case; its extension input remains an H.6 request.


**Acceptance:** This statement uses R_an, not merely the expansion R_an,exp. A compact target does not allow arbitrary holomorphic maps with essential boundary singularities; the VHS monodromy and extension hypotheses remain essential.

<a id="ordered-sector-permutation-cover"></a>

### 29. Finite permutation cover by ordered sectors

**Lemma:** `TauCeti.Hodge.Tame.orderedSector.permutation_cover`. Added by `REV-HodgeStructuresPartII--H.7` from the consumed API.

For every z in boundedSector(n,R,Y), a permutation σ of the finite coordinates satisfies z∘σ in orderedSector(n,R,Y). The resulting finite union covers the entire sector, including tied heights.

**Hypotheses:** n is finite; R≥0; Y>0; z belongs to boundedSector(n,R,Y).

**Proof outline:**

1. Sort the finite multiset of imaginary parts in descending order, retaining original indices.
2. Use the resulting permutation; the absolute real-part and height inequalities are invariant under reindexing.
3. Equal heights satisfy the weak ordering, so no genericity or strict-order assumption is needed.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/bounded-sector](#bounded-sector), [HodgeStructuresPartII:H.7/ordered-sector](#ordered-sector)

**Source:** `BKT20`, §4.3 Definition 4.4, p.929; §4.5 opening, p.932.

**Acceptance:** The corresponding API signature and discriminating object tests remain in the suggested file; the boundary and zero-dimensional cases are included.

<a id="sector-uniformization-half-open-surjective"></a>

### 30. Logarithms covering angular seams

**Lemma:** `TauCeti.Hodge.Tame.sectorUniformization.halfOpen_surjective`. Added by `REV-HodgeStructuresPartII--H.7` from the consumed API.

If η>0 and every q_i satisfies 0<|q_i|<exp(−2πη), there is z with 0≤Re z_i<1 and Im z_i>η such that sectorUniformization(z)=q. This covers positive real q as well as other arguments.

**Hypotheses:** n is finite; η>0; every coordinate q_i is nonzero with |q_i|<exp(−2πη).

**Proof outline:**

1. Choose an argument of each nonzero coordinate in [0,2π), assigning argument zero to positive real coordinates.
2. Put Re z_i=arg(q_i)/(2π) and Im z_i=−log|q_i|/(2π).
3. The radius inequality implies Im z_i>η; the exponential identity recovers q_i coordinatewise.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/sector-uniformization](#sector-uniformization)

**Source:** `BKT20`, §4.2 uniformizing diagram and Lemma 4.2, p.929.

**Acceptance:** The corresponding API signature and discriminating object tests remain in the suggested file; the boundary and zero-dimensional cases are included.

<a id="hodge-adapted-flag-refines-filtration"></a>

### 31. Initial basis spans recover the Hodge filtration

**Lemma:** `TauCeti.Hodge.Tame.hodgeAdaptedFlag.filtration`. Added by `REV-HodgeStructuresPartII--H.7` from the consumed API.

For a basis b_i with antitone integer labels p_i and F^a=span{b_i:p_i≥a}, let j be the number of labels at least a. Then hodgeAdaptedFlag(b,j)=F^a. This identifies the H.6 homogeneous-basis flag with the limiting Hodge filtration used in the Gram proof.

**Hypotheses:** b is a finite complex basis; p is antitone; the specified span equation for F holds; j counts labels at least a.

**Proof outline:**

1. Antitonicity makes the indices with p_i≥a an initial segment.
2. Its cardinality j identifies that segment with the indices i<j.
3. Substitute the equal generating sets into the span definitions. The homogeneous-basis and label assumptions are supplied by H.6.

**Direct prerequisites:** [HodgeStructuresPartII:H.7/hodge-adapted-flag](#hodge-adapted-flag)

**Source:** `BKT20`, §4.4 proof of Lemma 4.7, p.931.

**Acceptance:** The corresponding API signature and discriminating object tests remain in the suggested file; the boundary and zero-dimensional cases are included.

## Pinned baseline and exact import boundary

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit has no HodgeStructuresPartII:H.7 entry. Its upstream pure/mixed Hodge evidence and two upstream reader documents were read before introducing the present declarations. Exact pinned sources were searched for period definability, exceptional Hodge loci, o-minimality, rough polynomiality and Siegel sets, and the following actual statements were read, rather than inferred from declaration names.

| Declaration | What is already supplied |
| --- | --- |
| `mathlib:Set.Definable` | A subset of a finite Cartesian power of a first-order structure is given by a formula with parameters from A. This is a coordinate-level baseline, not an o-minimality or finite-atlas theorem. |
| `mathlib:Complex.norm_exp` | For z complex, the norm of exp(z) is exp(Re z). Applied to 2πiz this bounds the punctured-disc coordinate away from its outer circle. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn` | A decreasing exhaustive opposed filtration on a complex module with specified conjugation, of integral weight n; separatedness is derived. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.piece` | The submodule H^{p,n-p}=F^p intersect conjugate F^{n-p}. A type-(0,0) subspace in nonzero weight is zero, not simply the p=0 piece. |
| `tauceti:TauCeti.Hodge.Polarization.hodgeForm` | Native conjugate-first Hermitian form h_N(u,v)=Q(C(conjugate u),v), on an abstract integral complexification. H.7 reuses it fibrewise. |
| `tauceti:TauCeti.Hodge.Polarization.hodgeForm_eq_conj` | h_N(u,v)=conjugate(Q(Cu,conjugate v)); supplies the BKT conjugate-second convention exactly. |
| `tauceti:TauCeti.Hodge.Polarization.hodgeForm_self_pos` | A polarization has strictly positive Hodge-form diagonal on every nonzero complex vector. Zero must be excluded from two-sided monomial estimates. |
| `tauceti:TauCeti.Hodge.tate_piece` | The only nonzero piece of Z(m), weight -2m, has first index -m and is the whole complex line. |
| `tauceti:TauCeti.Hodge.tate_hodgeForm_apply` | The native Hodge form of the polarized Tate line evaluates to conjugate x times y. |
| `mathlib:TopologicalSpace.NoetherianSpace.finite_irreducibleComponents` | Every Noetherian topological space has finitely many irreducible components; apply to a closed algebraic subset with its Zariski topology, not its ordinary complex topology. |
| `mathlib:AlgebraicGeometry.finite_irreducibleComponents_of_isNoetherian` | A native Noetherian scheme has finitely many irreducible components. The complex-point/analytification comparison is still supplied externally. |

`Set.Definable` gives a first-order coordinate predicate with parameters on a finite Cartesian power. It does not supply an o-minimal structure, ℝ_an,exp or definable manifold atlases. Noetherian irreducible decomposition concerns the Zariski topology, not the usual complex topology. These distinctions prevent library names from silently substituting for the missing analytic and algebraic comparisons.

## Supplier contracts

The existing AA.3 real Siegel, reduction/metric dictionary, finite-permutation basis-change and orbit-map inverse-containment nodes are direct prerequisites where their actual statements suffice. They remain plans with their own review/implementation status. All other imported requirements are the following precise requests. Replacing each stage by an exact supplied node is part of closure, not a reason to duplicate the supplier theory inside H.7.

### Request 1: `HodgeStructuresPartII:H.3`

Complete the existing H.3 compact-dual/orbit, holomorphic descent and tensor-transport plans with finite real algebraic charts, rational local trivializations, tensor/dual/Tate family transport and local holomorphic quotient-bundle equations. The availableInputs give the existing partial contracts; their implementation and source closure are not asserted. Preserve connected components and the distinction between the full polarized ambient domain and a proper Mumford–Tate orbit.

Available partial plans: `HodgeStructuresPartII:H.3/polarized-compact-dual`, `HodgeStructuresPartII:H.3/represented-complex-orbit`, `HodgeStructuresPartII:H.3/mt-orbit-open`, `HodgeStructuresPartII:H.3/monodromy-descent`, `HodgeStructuresPartII:H.3/orbit-hodge-tensors`.

**Needed by:** `HodgeStructuresPartII:H.7/sector-lift-definable`, `HodgeStructuresPartII:H.7/hodge-form-function`, `HodgeStructuresPartII:H.7/gram-determinant-formulas`, `HodgeStructuresPartII:H.7/local-period-definability`, `HodgeStructuresPartII:H.7/global-period-definability`, `HodgeStructuresPartII:H.7/tensor-hodge-locus`, `HodgeStructuresPartII:H.7/local-tensor-locus-analytic`, `HodgeStructuresPartII:H.7/compact-target-period-definability`.

### Request 2: `HodgeStructuresPartII:H.3`

Faithful rational derived-group (or faithful finite central-cover) realization inside SL(V_Q), with the Hodge metric map D=G/M→G/K_t→X, M⊂K_t and target Cartan involution preserving the represented Lie algebra. Supply compact-fibre Siegel lifting, finite central/level quotient transport and basepoint changes transporting compacts through the same canonical symmetric-space projection. Do not let the adjoint quotient act on V without this adapter.

Consumed by: [HodgeStructuresPartII:H.7/determinant-weight-bound](#determinant-weight-bound), [HodgeStructuresPartII:H.7/deep-siegel-containment](#deep-siegel-containment), [HodgeStructuresPartII:H.7/positive-height-siegel-cover](#positive-height-siegel-cover), [HodgeStructuresPartII:H.7/global-period-definability](#global-period-definability), [HodgeStructuresPartII:H.7/compact-target-period-definability](#compact-target-period-definability).

### Request 3: `HodgeStructuresPartII:H.3`

Pure rational Hodge-data morphisms and their holomorphic arithmetic quotient maps; image/kernel factorization including compatible arithmetic image and finite-index intersection levels. Prove induced Lie maps preserve Hodge structures and hence canonical Weil/Cartan involutions. Export special subdatum stabilizer M_H=H(R)∩M. This requests Hodge specialization only; the generic fixed-K definable quotient remains gap G1 with its routed owner.

Consumed by: [HodgeStructuresPartII:H.7/special-hodge-image](#special-hodge-image), [HodgeStructuresPartII:H.7/special-image-definable](#special-image-definable), [HodgeStructuresPartII:H.7/special-image-closed-analytic](#special-image-closed-analytic).

### Request 4: `HodgeStructuresPartII:H.3`

Generic Mumford–Tate datum and strict-drop tensor/subdatum correspondence for pure polarizable rational variations, using the full Deligne torus. Generic type-(0,0) tensor subspaces are monodromy-stable; local tensor loci saturate after ranging over all rational tensors. Every strict drop admits a nongeneric rational tensor and a strict rational Hodge subdatum; converse holds. Export countability of the choices and independence from finite level and trivialization, without using the H.7 algebraicity theorem to prove these inputs.

Consumed by: [HodgeStructuresPartII:H.7/exceptional-hodge-locus](#exceptional-hodge-locus), [HodgeStructuresPartII:H.7/exceptional-special-preimage](#exceptional-special-preimage), [HodgeStructuresPartII:H.7/rational-special-countability](#rational-special-countability), [HodgeStructuresPartII:H.7/special-pullback-algebraic](#special-pullback-algebraic).

### Request 5: `HodgeStructuresPartII:H.6`

Quasi-unipotent monodromy, finite coordinate power-cover normalization, commuting rational nilpotent logarithms N_i=log T_i, holomorphic untwisted extension Ψ and Φ̃=exp(Σz_iN_i)Ψ(q). Export the negative-Lie big-cell lift γ=exp(zN)exp(v(q)), with shrinking/compact-buffer hypotheses and the correct transversality factor 2πi. Include nondegenerating analytic coordinates as compact parameters and the finite-monodromy case extending the period map into D across the SNC boundary.

Consumed by: [HodgeStructuresPartII:H.7/sector-lift-definable](#sector-lift-definable), [HodgeStructuresPartII:H.7/gram-determinant-formulas](#gram-determinant-formulas), [HodgeStructuresPartII:H.7/local-period-definability](#local-period-definability), [HodgeStructuresPartII:H.7/positive-height-siegel-cover](#positive-height-siegel-cover), [HodgeStructuresPartII:H.7/compact-target-period-definability](#compact-target-period-definability).

### Request 6: `HodgeStructuresPartII:H.6`

Centered partial-sum monodromy weight filtrations, cone-independence, distributivity with the limiting F, a simultaneous complex splitting I and a separate rational weight splitting J. For every compatible splitting and induced exterior power, provide the flat and moving squared-Hodge-norm estimate Σ m_σ(y)|u_σ|² with positive constants, uniform on bounded real widths and compact nondegenerating parameters. Nonzero homogeneous vectors have two-sided monomial estimates. This is Kashiwara §§1.9,2.4,3.4, not merely BKT’s narrower J-only restatement.

Consumed by: [HodgeStructuresPartII:H.7/hodge-adapted-flag](#hodge-adapted-flag), [HodgeStructuresPartII:H.7/flat-norm-rough-monomial](#flat-norm-rough-monomial), [HodgeStructuresPartII:H.7/moving-norm-rough-monomial](#moving-norm-rough-monomial), [HodgeStructuresPartII:H.7/determinant-weight-bound](#determinant-weight-bound), [HodgeStructuresPartII:H.7/positive-height-siegel-cover](#positive-height-siegel-cover).

### Request 7: `HodgeStructuresPartII:H.6`

Uniform deep-height comparison h_z(γu)≍h_z(exp(zN)u), including exterior powers, derived from horizontal negative-Lie correction and exponential decay. Give a depth threshold after which the lower bound holds, uniform on each fixed bounded real width and compact parameter set; do not use compactness of a mixed logarithmic-height remainder.

Consumed by: [HodgeStructuresPartII:H.7/moving-norm-rough-monomial](#moving-norm-rough-monomial), [HodgeStructuresPartII:H.7/positive-height-siegel-cover](#positive-height-siegel-cover).

### Request 8: `HodgeStructuresPartII:H.6`

Schmid’s one-variable finite Siegel containment for a polarized integral nilpotent-orbit lift, with the fixed canonical compact, every bounded real width and positive height after a buffer, and finite covers clearing the rational slopes in the LD.6 curve test. Verify the source proof and its uniformity rather than importing the desired multivariable H.7 theorem.

Consumed by: [HodgeStructuresPartII:H.7/curvewise-reducedness](#curvewise-reducedness).

### Request 9: `LogicAndDefinabilityInNumberTheory:LD.6`

Finite definable atlases and graph calculus extending native Set.Definable: the real structures R_alg⊂R_an⊂R_an,exp and their o-minimality, coordinate restriction/reindexing, finite gluing, products, definable images/inverse images, finite-cover graph descent, continuous graph-closure extension, and finiteness of connected components. Canonical algebraic definable atlases and restricted-analytic charts on compact buffers must be compared explicitly.

Consumed by: [HodgeStructuresPartII:H.7/sector-lift-definable](#sector-lift-definable), [HodgeStructuresPartII:H.7/local-period-definability](#local-period-definability), [HodgeStructuresPartII:H.7/global-period-definability](#global-period-definability), [HodgeStructuresPartII:H.7/special-image-definable](#special-image-definable), [HodgeStructuresPartII:H.7/special-pullback-algebraic](#special-pullback-algebraic), [HodgeStructuresPartII:H.7/compact-target-period-definability](#compact-target-period-definability).

### Request 10: `LogicAndDefinabilityInNumberTheory:LD.6`

Restricted complex exponential exp(2πiz) is R_an,exp-definable on every fixed bounded real strip; restricted analytic coefficient pullbacks from a compact q-buffer, conjugation and algebraic actions preserve definability. Finite half-open angular strips cover the seams and identify the graph image on a smaller punctured polydisc.

Consumed by: [HodgeStructuresPartII:H.7/sector-uniformization](#sector-uniformization), [HodgeStructuresPartII:H.7/sector-lift-definable](#sector-lift-definable), [HodgeStructuresPartII:H.7/local-period-definability](#local-period-definability).

### Request 11: `LogicAndDefinabilityInNumberTheory:LD.6`

The repaired rough-function algebra: A=O_C[x,y,y^{-1}] with O from holomorphic functions on a neighbourhood of a fixed closed q-buffer and their conjugates; roughly monomial denominators d must belong to A and satisfy |d|≍a positive Laurent monomial. Roughly polynomial functions are g/d, g∈A. Prove localization ring laws, conjugation/real parts and rational-curve bound transfer on every bounded real width, with constants depending on width; include exponential domination and the finite-difference/Vandermonde proof after substitutions z₁=mz₂+c enlarge the strip.

Consumed by: [HodgeStructuresPartII:H.7/gram-determinant-formulas](#gram-determinant-formulas), [HodgeStructuresPartII:H.7/flat-norm-rough-monomial](#flat-norm-rough-monomial), [HodgeStructuresPartII:H.7/moving-norm-rough-monomial](#moving-norm-rough-monomial), [HodgeStructuresPartII:H.7/hodge-entry-rough-polynomial](#hodge-entry-rough-polynomial), [HodgeStructuresPartII:H.7/curvewise-reducedness](#curvewise-reducedness), [HodgeStructuresPartII:H.7/uniform-reducedness](#uniform-reducedness).

### Request 12: `LogicAndDefinabilityInNumberTheory:LD.6`

Peterzil–Starchenko definable analytic Chow: every closed complex analytic subset of a smooth complex algebraic variety, definable in an o-minimal expansion of R_an in its canonical algebraic atlas, is a reduced closed algebraic subset. Supply the quasi-projective version via closure/affine algebraic charts and native finite-type/Noetherian component comparison. No generic real definable subset, analytic nilpotent ideal, or countably infinite definable union is included.

Consumed by: [HodgeStructuresPartII:H.7/special-pullback-algebraic](#special-pullback-algebraic).

### Request 13: `AdelicAlgebraicGroups:AA.3`

At compatible arithmetic levels, the rational reductive, Cartan-compatible subdomain H(R)^+/M_H→G(R)^+/M with M_H=H(R)∩M induces a proper map (Γ∩H)\H(R)^+/M_H→Γ\G(R)^+/M. Include the finite-index level-cover variant, group/component hypotheses and the compact-fibre reduction to H/K_H→G/K_G. Derive this from finite overlap/inverse Siegel containment. The existing AA.3 orbit-map-siegel-preimage node supplies metric inverse containment, but does not yet state this arithmetic properness theorem.

Consumed by: [HodgeStructuresPartII:H.7/special-image-closed-analytic](#special-image-closed-analytic).

### Request 14: `ComplexComparisonPartII:C0`

Closed reduced analytic subsets and holomorphic inverse images/zero loci in smooth algebraic analytifications; holomorphic vector-bundle quotient sections have closed analytic zero sets. Export the complex-point comparison needed by the native reduced algebraic/Noetherian component carrier.

Consumed by: [HodgeStructuresPartII:H.7/local-tensor-locus-analytic](#local-tensor-locus-analytic), [HodgeStructuresPartII:H.7/special-pullback-algebraic](#special-pullback-algebraic).

### Request 15: `ComplexComparisonPartII:C4`

Extend the analytic-image boundary of this Part II to Remmert’s proper holomorphic image theorem for possibly noncompact analytic source/target manifolds: the image of a closed analytic subset under a proper holomorphic map is closed analytic. This is an additional analytic supplier, not projective Chow or proper algebraic GAGA. The current C4 description does not yet explicitly cover it; gap G5 and the rescope proposal record the extension.

Consumed by: [HodgeStructuresPartII:H.7/special-image-closed-analytic](#special-image-closed-analytic).

### Request 16: `AlgebraicModuliForArithmeticGeometry:R09.7d`

For smooth quasi-projective S over C, export a smooth projective compactification preserving S with strict normal-crossings boundary, together with a finite smaller/larger analytic polydisc chart system whose smaller buffered charts still cover the compactification. Analytic charts use the canonical algebraic real-definable structure on compact buffers.

Consumed by: [HodgeStructuresPartII:H.7/global-period-definability](#global-period-definability), [HodgeStructuresPartII:H.7/compact-target-period-definability](#compact-target-period-definability).

## Source corrections and version discipline

The packet's 33 source-issue records describe the source assertions in our own words, with precise locators, corrected statements, mathematical reasons and known-correction searches. Independent review on 8 October 2026 confirms every record with its own reason; no source passage is transcribed. These are the existing independently confirmed programme findings collated against this pass's source versions, not claims of new discoveries. `catalogueFinding` retains each original identifier. Published-versus-author-copy pagination is separated. The complete official erratum governs fixed compacts, Cartan-compatible functoriality and the corrected inverse-Siegel citation. The other records have no additional published correction established in the versions read; no new exhaustive arXiv/Crossref correction search is claimed.

The corrections most directly affecting the proof are:

- The local period theorem holds on smaller buffered polydiscs. Arbitrary holomorphic behaviour approaching the outer unit circle cannot be made restricted analytic by the printed reduction.
- The sector width is R, distinct from the positive height η; the source's stray C does not define another parameter.
- Siegel sets fix the canonical compact. A rational subgroup inclusion alone does not satisfy the erratum's Cartan condition.
- The rough-function ring uses denominators that are themselves coefficient Laurent polynomials with monomial size. Permitting arbitrary functions of monomial size as denominators destroys the printed ring argument.
- Kashiwara's norm estimate is splitting-independent and applies to the simultaneous complex splitting and exterior powers. A restatement only for a rational weight splitting does not justify the Gram argument.
- The horizontal moving-norm lower estimate needs a depth threshold and the correct 2πi transversality normalization. It does not apply on every positive-height region without a boundary-chart argument.
- The metric claim yields finitely many basis orderings, rather than reducedness in every fixed rational basis. The widened-strip curve substitution has width-dependent constants.
- The adjoint group needs a faithful represented-group adapter before acting on V. The BKT Hodge form needs conjugation in the second argument and odd-weight phases in Gram identities.
- An arbitrary Hodge-data morphism can have noncompact kernel. Closed analytic image requires factorization and properness of the image-domain immersion.
- The tensor convention is untwisted type (0,0), with generic invariant subspaces removed. Identity special images cannot index the exceptional union, and that union is not itself asserted definable.

Each corrected passage is used in the matching declaration's statement, proof steps, acceptance checks or supplier contract. The records' `affects` fields retain their original source-route consumers so a supplier pass can locate the same correction.

## Suggested signatures: exact omissions and validation

The suggested file imports individual native modules, reuses the existing Hodge forms and Tate structures, and gives all eight local objects, twenty named theorems, thirty-two API lemmas and twenty-four labelled examples. It uses coordinate graphs, native submodules, bases, real matrices, complex determinants and native finite/countable set data. Received sets, subrings and maps are data boundaries for the actual suppliers; they do not define missing theories by arbitrary propositions.

| Suggested declaration family | Conditions or conclusions still unexpressed |
| --- | --- |
| Sector lift and local/global/compact-target graph theorems | Integral VHS and true period maps; algebraic compact dual/domain charts; nilpotent-orbit extension and buffered finite analytic atlases; the specified real language and its o-minimality; fixed-K quotient and finite-level descent. The compact case also needs actual compact arithmetic target and finite-monodromy extension. |
| Varying Hodge form | Flat integral trivialization and family continuity/holomorphy are supplied conditions. The fibrewise form itself is native and the conjugation/diagonal comparison is typed exactly. |
| Hodge-adapted flag and Gram formula | H.6 homogeneous simultaneous complex basis, sorted Hodge labels, negative-Lie transport and pure filtration adaptation. The flag API expresses its native filtration-refinement equation; the source's nonvanishing cross-Gram pivots and phases are typed. |
| Rough-norm and rough-entry theorems | Identification of the supplied rough-monomial sets and localization subring with LD.6's actual classes; H.6 nonzero homogeneous/exterior norm estimates, width bounds, compact buffers and deep thresholds. |
| Determinant and reducedness theorems | Positive definite real Hodge matrix, rational weight-adapted basis, determinant-one faithful representation, rational positive-slope test curves and repaired wider-strip bound transfer. Finite permutations and the three reducedness inequalities are typed. |
| Deep and positive-height Siegel containment | D is the H.3 domain and the family is the AA.3 rational Siegel family for one canonical K_t; represented-group compatibility and inverse containment; partial-boundary chart uniformity. The family index is unrestricted and the chosen cover is a finite subset, rather than assuming the entire Siegel family finite. |
| Special-image definition and definability | The map must be a genuine compatible rational Hodge-data morphism. Its range, identity and composition API are native; strictness is a restriction on the exceptional indexing family, not on all ranges. |
| Special-image closed analyticity | Kernel/image and arithmetic properness hypotheses are omitted. Only the closed-set conclusion is typed; the analytic-subset conclusion itself is absent until the C0/C4 carrier arrives. |
| Fixed tensor locus and local analyticity | Rational flat embedding, actual tensor construction and holomorphic filtration/quotient bundle are supplied conditions. The weight-zero guard is typed. Local analyticity currently types only closedness; its analytic conclusion is also absent. |
| Exceptional locus and strict-preimage/countability theorems | Universal-cover local-system trivialization, generic Mumford–Tate tensor family, lift saturation and strict rational subdata/level comparison. The image-union and countable-family forms are typed without an infinite definable-union claim. |
| Special-pullback algebraicity and final Hodge-locus theorem | Analytic/algebraic complex-point comparison, definable Chow, native reduced algebraic-subvariety carrier and its transport are missing. The suggested conclusions give Zariski closed sets, and in the final theorem countably many proper irreducible such sets; the reduced algebraic structures are conclusion omissions. |

These omitted conclusions are explicit incompleteness of the suggested signatures, not replacements of analyticity by closedness or algebraicity by ordinary topological closedness. The full mathematical statements in the packet and this reader retain all those conclusions. Gap G7 requires restoring them with the actual supplier carriers.

The packet checker passes with zero errors and zero warnings. The **full suggested file did not compile**: the shared build lacks compiled objects for the pinned Tau Ceti Hodge imports, and its Tau Ceti checkout is newer than the requested pin. No dependency build, cache download or language server was started. A Mathlib-only extracted slice, excluding all Hodge-dependent definitions and theorems, elaborated at the exact Mathlib pin with only the expected proof-placeholder warnings. That slice checks native sector, flag, graph, reducedness, finite-cover and countability forms; it does not validate the missing Hodge imports or any mathematical proof. Full pinned elaboration remains a named completion check.

## Coverage, gaps and atlas structure

### G1: Routed tame arithmetic quotient owner is not yet defined

The reviewed BKT extraction routes fixed-K structures on general Γ\G/M and corrected Cartan-compatible functoriality to ArithmeticQuotientDefinability, an extension of ArithmeticLocallySymmetricSpaces. No roadmap/stage/packet with that id exists in this clone. Required input: Γ torsion-free arithmetic, connected semisimple Q-group, connected compact M⊂K; finite definable Siegel chart refinement, π restricted to every same-K rational Siegel set R_alg-definable, and corrected functoriality (φ,g) with level, M, K and Cartan inclusions. Also finite central and level quotient descent. General M≠K cannot be silently supplied by ALS.2. The consuming H.7 nodes are conditional on this gap; no unknown supplier id is used as a fake resolved prerequisite.

### G2: Remaining H.3 tame-domain, metric and generic-tensor contracts

The current H.3 part packet has exact compact-dual, represented-orbit, holomorphic-descent and orbit-tensor nodes; H.7 now names the applicable inputs. Those plans do not yet export the finite real algebraic atlas, canonical metric/Cartan and compact-fibre Siegel adapters, arithmetic Hodge-morphism image factorization, or generic strict-drop tensor/subdatum classification needed here. The four requests retain only this unclosed interface boundary. Fibrewise Hodge, polarization and Tate structures remain native. K17 cites André/Pink for some remaining statements; their proofs are not independently verified by this review.

### G3: H.6 degeneration estimates and parameter uniformity need exact suppliers

The four H.6 requests are not yet nodes. Kashiwara’s selected statements, splitting proof and norm-comparison reduction were read, including the rendered formulas; the whole §4.3 and Schmid’s Corollary 5.29 proof were not read in this pass. Supplier work must verify centered weights, splitting-independent flat/moving/exterior estimates, bounded-width uniformity, compact nondegenerating parameters and depth thresholds. The finite partial-boundary chart proof of positive-height-siegel-cover is stated explicitly but is not declared source-closed until those parameter/transport contracts are supplied.

### G4: LD.6 rough algebra, finite atlases and definable Chow need exact nodes

LD.6 has no finer blueprint nodes in this clone. Its four requests carry the exact repaired generic statements. Set.Definable is only a first-order coordinate predicate and proves none of o-minimality, R_an,exp, finite atlases, rough-polynomial ring/curve transfer or definable analytic Chow. PS09 Theorem 4.4/Corollary 4.5 and their proofs were read, but their earlier closure and projective-Chow inputs remain this supplier’s proof closure. The repaired wider-strip curve argument also needs the H.6 bounded-width source theorem.

### G5: Closed analytic special-image proof needs two supplier extensions

BKT §5 assumes closed analyticity without a proof or citation. The requested AA.3 proper rational arithmetic immersion and ComplexComparisonPartII:C4 proper analytic image theorem do not yet exist as exact nodes. C4’s published stage scope concerns projective Chow/proper GAGA, so its requested noncompact analytic image result is recorded as a rescope extension rather than claimed already covered. No claim that arbitrary Hodge morphisms are proper survives their potentially noncompact kernels.

### G6: Buffered SNC compactification supplier not yet decomposed

R09.7d’s stage expressly exports the required smooth SNC compactification, but there is no exact node for its finite buffered analytic chart form. The request must establish that shrinking charts still gives a cover, preserves interior-coordinate centres and compares their restricted-analytic maps with the canonical algebraic definable atlas.

### G7: Suggested-file supplier conditions cannot all be expressed at the baseline

The suggested file gives exact native signatures for the eight local definitions, all their API items and tests, and coordinate/metric forms of the named results. Conditions involving integral variations as sheaves, finite definable manifold atlases, rational Hodge morphisms/subdata, canonical K-Siegel sets, the repaired rough-function classes and analytic/algebraic subset comparison have no baseline carrier. They are omitted with declaration-specific comments and catalogued in the reader/handoff. Supplied subrings, sets and maps are data boundaries, not definitions of these missing theories or Prop-valued placeholders. The analytic conclusion of specialImage_closedAnalytic and localTensorLocus_analytic is also omitted, and specialPullback_algebraic and hodgeLocus_algebraicity omit the reduced algebraic structure and complex-point comparison, typing only the Zariski closed-set form. These are incomplete conclusion prototypes, not surrogates for the full mathematical statements. The full suggested file does not elaborate in the shared build: the pinned Hodge imports have no compiled objects there, and its TauCeti checkout is newer than the pin. A Mathlib-only slice elaborates with only expected proof-placeholder warnings. No library build was attempted.

The six planets are Rough polynomiality of Hodge forms, Finite Siegel containment, Definability of period maps, Hodge locus, Algebraicity of special pullbacks and Algebraicity of Hodge loci. They select the central mathematical objects and conclusions; none is a bookkeeping check. The packet proposes materializing the already routed tame-arithmetic-quotient Part II and extending the analytic image supplier in ComplexComparisonPartII. The current H.7 layer and its target scope remain unchanged.

Closure requires replacing provisional stage dependencies by exact supplier nodes, closing the seven gaps, restoring the suggested file's omitted hypotheses and conclusions, and elaborating at the full pinned baseline. This target-level pass leaves no H.7 target unaccounted for; it leaves those supplier refinements explicitly open. The roadmap's other stages, its upstream fibrewise theory and Borel's arithmetic-variety theorem are outside this packet's scope.

## Independent review, 8 October 2026

Accepted by `REV-HodgeStructuresPartII--H.7` as a completed conditional target-level plan. The [review report](../reviews/REV-HodgeStructuresPartII--H.7.md) records every node, baseline and source-issue verdict. This pass links the applicable current H.3 plans, promotes three consumed API facts to lemma nodes, completes addition and conjugate-right scalar APIs for the Hodge form, corrects the neat-level boundary-monodromy proof step, and replaces inherited source quotations by authored descriptions. The 31 nodes, 32 API entries, 24 examples and six planets leave seven explicit gaps. The four untyped analytic/algebraic conclusions and other omitted supplier hypotheses in the suggested file remain obligations.

All six public downloads matched their recorded hashes. The independent read boundaries below are separate from the historical author receipts above:

- **BKT20**: Independent review 2026-10-08: §§1.3–1.4, §§2.1–3.2 and complete §§4.1–5 at published pp.920–934; rendered pp.931–933 collated for formulas and symbols. All H.7 locators checked; cited Schmid/CKS/reduction proofs remain supplier work.
- **BKT-author**: Independent review 2026-10-08: bytes/hash verified and §§4–5 corresponding passages compared with publication; no claim to independently reread its entire Appendix A.
- **BKT23**: Independent review 2026-10-08: complete four-page erratum, §§1.1–1.6 and examples.
- **Ka85**: Independent review 2026-10-08: §§1.8–1.9 pp.859–861; Lemma 2.4.1 proof pp.863–864; Theorems 3.4.1–3.4.2 p.870 (rendered formulas), §4.1 and beginning §4.2 pp.870–873. Complete asymptotic proof not reverified.
- **K17**: Independent review 2026-10-08: §§2.4–2.6 pp.8–9 and §§3.3–3.5 pp.11–13, including Definitions 3.12–3.13. Cited André/Pink proofs remain supplier obligations.
- **PS09**: Independent review 2026-10-08: Theorem 4.4/Corollary 4.5 and their proofs, draft p.12; Theorem 6.1, remarks and proof, draft pp.16–18. Earlier analytic-geometric and projective Chow inputs not independently reverified.

All eleven baseline statements were inspected at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The default declaration TSV is absent, so the packet checker validates baseline reference form; the independent exact-pin statement inspection supplies the declaration audit. A fresh Mathlib-only slice excluding Forms, TensorLoci, GramFormula, RoughForms and localTensorLocus_analytic elaborates with only proof-placeholder warnings. Full `lean-check` stops at the missing `TauCeti.Geometry.Hodge.HodgeForm` compiled import in the shared build. No full-file elaboration or mathematical proof check is claimed.
