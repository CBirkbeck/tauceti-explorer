# Geometry of numbers, quadratic forms and homogeneous arithmetic — Layer GN.4, continued: lattice-point estimates, the space of lattices and arithmetic packets

This document continues Layer GN.4 (lattice points and homogeneous dynamics) of the roadmap *Geometry of numbers, quadratic forms and homogeneous arithmetic*. The first part of the layer is planned in the base plan: Henk's lattice-point bounds from successive minima, Davenport's estimate for semialgebraic multisets, the Howe–Moore, Dani–Margulis and Ratner theorems, Margulis's theorem on values of quadratic forms, Duke's spherical equidistribution, packing and covering radii, transference, star bodies and critical lattices, Mahler's compactness criterion, Siegel's mean value theorem, the lattice Gaussian sums and the Construction A comparison. The GN.1 continuation adds four covering nodes (`gaussian-directional-tail`, `gaussian-coordinate-tails`, `l1-covering-transference`, `smith-cofactor-adjustment`) to this layer. This part plans what those leave open and what the papers routed to the layer and its consumers ask of it.

What this part adds:

- **Davenport's principle and semialgebraic regions** (§4.6): `coordinate-projection-volumes`, `davenport-principle`, `semialgebraic-complexity`, `semialgebraic-uniform-components`, `semialgebraic-interval-condition`, `unipotent-davenport-transfer`.
- **Counting by successive minima** (§4.7): `ball-count-successive-minima`, `ball-count-intermediate-minimum`, `bounded-domain-count`, `quadratic-norm-count-by-minima`, `small-vector-count`, `adapted-basis-coordinates`, `widmer-lipschitz-count`, `semialgebraic-family-lattice-count`, `hyperplane-orthant-count`.
- **Primitive lattices, angular bands and weighted sums** (§4.8): `angular-band-region`, `band-count`, `primitive-lattices-with-prescribed-minima`, `schmidt-primitive-extension-count`, `primitive-lattice-minima-count`, `band-section-volumes`, `band-section-volume-asymptotics`, `weighted-lattice-sums`, `primitive-ball-count`.
- **Singular symmetric matrices in skewed balls** (§4.9): `symmetric-row-lattices`, `eskin-katznelson-basis`, `eskin-katznelson-nonvanishing`, `row-lattice-matrix-count`, `skew-row-lattice-count`, `skew-singular-symmetric-count`.
- **Planar domains with curvature** (§4.10): `curvature-lattice-class`, `van-der-corput-planar-count`, `huxley-planar-count`, `admissible-ellipse-exponents`.
- **Explicit counts in applications** (§4.11): `markoff-fibre-count`, `markoff-fundamental-set-count`, `blomer-granville-representation-bound`.
- **Transference, covering and Construction A** (§4.12): `transference-minkowski-constant`, `max-norm-covering`, `construction-a-minimum`.
- **The space of lattices, its measure and its flows** (§4.13): `space-of-unimodular-lattices`, `lattice-space-invariant-probability`, `mahler-compactness-sup-norm`, `mahler-bounded-basis`, `diagonal-and-unipotent-flows`, `mautner-phenomenon`, `homogeneous-mixing`, `time-one-mixing-sl2`.
- **Quantitative nondivergence** (§4.14): `good-functions`, `quantitative-nondivergence`, `unipotent-quantitative-recurrence`.
- **Borel density and the Oppenheim auxiliaries** (§4.15): `borel-density`, `so21-intermediate-subgroups`, `closed-orbit-rational-form`, `oppenheim-ternary-reduction`.
- **Siegel's mean value theorem** (§4.16): `siegel-transform`, `primitive-siegel-unfolding`, `invariant-measures-punctured-space`, `primitive-siegel-mean-value`.
- **Arithmetic packets for equidistribution** (§4.17): `cm-point-packet`, `oriented-closed-geodesic`, `closed-geodesic-length`, `geodesic-orientation-reversal`, `harmonic-weyl-sum`, `spherical-weyl-criterion`.

## Scope and boundaries

This part owns the targets above. It builds on the base plan's GN.4 nodes and does not restate them: Henk's bounds (`henk-sublattice-count`, `first-minimum-count`, `henk-successive-minima-count`), the semialgebraic Davenport estimate, the dynamics theorems, transference, covering, critical lattices and the Gaussian chain are cited by id. It imports from Layer GN.1 the successive minima and Minkowski's theorems, the basis-from-minima and Hermite theorems and the partial products of minima; from Layer GN.0 the covolume of the dual, of projections and Hadamard's inequality; from Layer GN.3 the Pell automorphs, reduction cycles and theta series of definite lattices. Outside the roadmap it rests on Mathlib's `ZLattice`, `Matrix.SpecialLinearGroup` as a topological group, Haar and quotient measures and the upper half-plane; on AdelicAlgebraicGroups Layers AA.2–AA.3 for Haar measure on SL_n(ℝ) and the lattice property of SL_n(ℤ); on TauCetiRoadmap GlobalNumberFields Layer 3 for Lipschitz parametrisable sets; on TauCetiRoadmap RepresentationTheory/LieGroups Layer 2 for closed subgroups and Lie algebras; and on cylindrical algebraic decomposition, which Tau Ceti's main branch and TauCetiRoadmap RealAlgebraicGeometry Layer 6 provide but the pinned Tau Ceti does not (recorded under Open inputs).

It does not own: equidistribution of CM points and closed geodesics on the modular surface and its genus refinements, which need Maass-form spectral theory, half-integral weight forms, Siegel's class-number bound and Nielsen cores of higher-tier roadmaps (proposed for the toral-packets Part II, which imports the carriers of §4.17); the S-arithmetic measure classification asked for by Heegner-point Euler systems (same Part II); Bhargava's geometric sieve (ArithmeticStatistics ST.2); the identification of Markoff fundamental-set counts with class numbers (ClassicalArithmeticCompletion CA.4); binary quadratic forms, their class numbers and the ideal–form dictionary (TauCetiRoadmap IntegralLattices, binary forms).

## Conventions

**Lattices.** A lattice of rank R in a real inner-product space is a discrete subgroup spanning an R-dimensional subspace; its covolume `det Λ` and successive minima `λ_1 ≤ ⋯ ≤ λ_R` are taken in that span for the closed unit ball. In this document minima are indexed from 1, as in the sources; the GN.1 nodes index them from 0. A full lattice of ℝⁿ is a `ZLattice`. The polar or dual lattice is `Λ* = {y : ⟨y, x⟩ ∈ ℤ for all x ∈ Λ}`.

**Projection volumes.** `V_J(Z)` is the outer measure of the projection of `Z ⊆ ℝⁿ` onto the coordinates in `J`, `V_j` the sum over `|J| = j`, `V_0 = 1`.

**Semialgebraic complexity.** A set has complexity at most `(k, ℓ)` if it is cut out by a sign condition on at most `k` polynomials of degree at most `ℓ`; multisets are counted with multiplicity.

**The space of lattices.** `X_n = SL_n(ℝ)/SL_n(ℤ)` with left cosets, identified with unimodular lattices by `gΓ ↦ gℤⁿ` (columns). Sources written in the row convention `Γ\G` are translated by `Γg ↦ gᵀΓ`. `μ_n` is the invariant probability.

**Implied constants.** `≪_{a,b}` means up to a constant depending only on `a, b`; every constant named in a statement is explicit or its dependence is listed.

## Sources

- Fabrizio Barroero, Martin Widmer, *Counting lattice points and o-minimal structures*, arXiv:1210.5943v2, 22-page PDF retrieved 2026-10-16 (IMRN 2014) ([source](https://arxiv.org/pdf/1210.5943)). Read: Theorem 1.1 p.2, Theorem 1.3 p.5; §2 pp.7–8; §3 Proposition 3.12 and Corollary 3.13 p.12; §4 p.13; §§5–7 pp.14–21, including Lemma 5.8, Proposition 6.1 and Lemma 6.2. Retrieved PDF has 22 pages.
- Manjul Bhargava, Arul Shankar, *Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves*, arXiv:1006.1002v2, 50 pages ([source](https://arxiv.org/pdf/1006.1002v2)). Read: Physical p.14: Proposition 2.5 and the paragraph after it (the unipotent extension asserted without proof)
- Tim Browning, Pierre Le Boudec, Will Sawin, *The Hasse principle for random Fano hypersurfaces*, arXiv:2006.02356v1 (Ann. of Math. 197 (2023)); arXiv v1 read ([source](https://arxiv.org/pdf/2006.02356v1)). Read: §2 (2.6) p.4; §3.1 Definition 3.2 and Lemmas 3.1, 3.3–3.6 pp.7–11; §3.4 Definition 3.17 and Lemmas 3.18–3.20 pp.19–21; §4.2 (4.1)–(4.2), Lemmas 4.2–4.3 and proofs pp.27–30; §4.5 (4.24)–(4.26), Lemma 4.8 pp.34–35.
- Manjul Bhargava, Arul Shankar, Xiaoheng Wang, *Squarefree values of polynomial discriminants II*, Forum of Mathematics, Pi 13 (2025), e17 (open access); arXiv:2207.05592v1 read for §5, whose equation numbers are one lower than the published ones from (20) on ([source](https://arxiv.org/pdf/2207.05592)). Read: arXiv v1 §5 in full: (20)–(27), Theorem 5.1, Proposition 5.2, Theorem 5.3, Propositions 5.4–5.5, Lemma 5.6, Proposition 5.7, proof of Theorem 5.1; Published locators and the confirmed corrections E14, E15, E18 are those of the reviewed extraction PAPER-BHARGAVA-SHANKAR-WANG-25 (which read the published text)
- Jan-Hendrik Evertse, *Diophantine approximation, Chapter 2: Geometry of numbers*, Mastermath lecture notes, dio19-2.pdf (printed = PDF + 10) ([source](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf)). Read: §2.3 basis/minima proof, printed pp.24–25; §2.4 Theorem 2.20 and Corollary 2.21 with proofs, printed pp.32–34 (PDF pp.22–24).
- Martin Widmer, *Counting primitive points of bounded height*, arXiv:1204.0927 (Trans. Amer. Math. Soc. 362 (2010), 4793–4829) ([source](https://arxiv.org/pdf/1204.0927)). Read: §5 Theorem 5.4 and proof pp.17–18; surrounding lattice-basis estimates p.16.
- Peter Koymans, Djordjo Milovic, *Joint distribution of spins*, arXiv:1809.09597v1 ([source](https://arxiv.org/pdf/1809.09597v1)). Read: Proof of Lemma 3.1, (3.9)–(3.10), p.11
- Ilya Khayutin, *Joint equidistribution of CM points*, arXiv:1710.04557v3 (Ann. of Math. 189 (2019)) ([source](https://arxiv.org/pdf/1710.04557v3)). Read: §9, the class L(C_l, θ_l) and Remark 9.5, p.69; Theorem 9.7 statement, p.70; §10.3, Definition 10.8 and the sentence after it, p.90
- Aleksandar Ivić, Ekkehard Krätzel, Manfred Kühleitner, Werner Georg Nowak, *Lattice points in large regions and related arithmetic functions: recent developments in a very classic topic*, arXiv:math/0410522 ([source](https://arxiv.org/pdf/math/0410522)). Read: §3.1 'Lattice points in plane convex domains', van der Corput's and Huxley's estimates, pp.9–10
- Amit Ghosh, Peter Sarnak, *Integral points on Markoff type cubic surfaces*, arXiv:1706.06712v3 (Invent. Math. 229 (2022)) ([source](https://arxiv.org/pdf/1706.06712v3)). Read: §7 Lemmas 7.1–7.3 and proof pp.21–22; Lemma 9.5 and representation-pair application p.29. The strip correction yielding 1/48 was independently recomputed.
- Yuan Liu, Melanie Matchett Wood, David Zureick-Brown, *A predicted distribution for Galois groups of maximal unramified extensions*, arXiv:1907.05002v2 (Invent. Math. 237 (2024)) ([source](https://arxiv.org/abs/1907.05002)). Read: Lemma 12.8 and Corollary 12.9 with proof, printed pp.51–52.
- Jiajie Xue, Brian M. Kurkoski, Emanuele Viterbo, *Construction A lattice design based on the truncated union bound*, arXiv:2502.10728v1 ([source](https://arxiv.org/pdf/2502.10728v1)). Read: §II Definition 2 and (6)–(9), printed p.2: binary Construction A, covolume and squared minimum.
- Dave Witte Morris, *Ratner's theorems on unipotent flows*, arXiv:math/0310402 (Chicago Lectures in Mathematics, 2005); printed = physical − 10 ([source](https://arxiv.org/pdf/math/0310402)). Read: §1.2 Theorem 1.2.2 and ternary proof printed pp.13–15; §3.2 Mautner and mixing, printed pp.102–105; §4.7 Proposition 4.7.1 and proof printed pp.139–142; §4.8 Corollary 4.8.5 printed pp.144–145. Exercise 1.2#15 is an assigned reduction, not a supplied proof.
- Dmitry Kleinbock, Gregory Margulis, *Flows on homogeneous spaces and Diophantine approximation on manifolds*, arXiv:math/9810036 (Ann. of Math. 148 (1998)) ([source](https://arxiv.org/pdf/math/9810036)). Read: §3 (3.1), Lemma 3.1, Proposition 3.2 and interpolation proof pp.6–7; §4 marking argument, Theorem 4.1 and proof pp.9–13; §5 (5.1), Theorems 5.2–5.3 and proofs pp.13–15.
- Stephen D. Miller, *The geometry of numbers: an automorphic perspective*, Rutgers graduate course notes, Spring 2020 ([source](https://ow3.math.rutgers.edu/~sdmiller/Miller_automorphic_lattice_course.pdf)). Read: §4 printed pp.10–11 (PDF pp.4–5); §6 printed pp.12–14 (PDF pp.6–8), including mirabolic unfolding and the explicit warning that measure normalisations still need comparison.
- Alex Eskin, *Counting problems in moduli space (Luminy lecture notes)*, author-hosted lecture notes, luminy.pdf ([source](https://math.uchicago.edu/~eskin/luminy.pdf)). Read: §1, Siegel's formula and its primitive version, pp.3–4
- W. Duke, Ö. Imamoḡlu, Á. Tóth, *Geometric invariants for real quadratic fields*, Ann. of Math. 184 (2016), 949–990 (free from the Annals site) ([source](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf)). Read: §2 (2.3)–(2.11) pp.951–954; §4 (4.3)–(4.5) pp.959–961; CM weight after (5.12) p.963; §7 p.972 and §9 p.978, footnote 8.
- W. Duke, *Hyperbolic distribution problems and half-integral weight Maass forms*, Published-layout author copy, Invent. Math. 92 (1988), 73–90 ([source](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf)). Read: §1, pp.73–76: Weyl sums W_u(n), the theta series with harmonic coefficients, Heegner points and closed geodesics, Theorem 1
- Martin Henk, *Successive Minima and Lattice Points*, arXiv:math/0204158v1 ([source](https://arxiv.org/pdf/math/0204158v1)). Read: Theorem 1.5, ceiling convention and (1.3), pp.2–3 (arXiv:math/0204158v1).
- Davesh Maulik, Ananth N. Shankar, Yunqing Tang, *Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture*, arXiv:2011.08887 (Invent. Math. 228 (2022)) ([source](https://arxiv.org/abs/2011.08887)). Read: §7 Definition 7.8 and Lemma 7.9, Corollary 7.10, Proposition 7.11 and proof, pp.28–29 (arXiv:2011.08887v1); the count explicitly includes the constant term.
- Ananth N. Shankar, Arul Shankar, Yunqing Tang, Salim Tayou, *Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*, arXiv:1909.07473v3 (Forum Math. Pi 10 (2022)) ([source](https://arxiv.org/abs/1909.07473)). Read: Proof of Proposition 7.7 and footnote 32, p.37 in the retrieved arXiv:1909.07473v3 (the inherited p.40 locator was incorrect for this PDF).
- Oded Regev; scribe Elad Verbin, *Transference Theorems, Lattices in Computer Science, Lecture 11*, Fall 2004 lecture notes ([source](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf)). Read: Theorem 4 and Gaussian proof, especially Lemmas 7–9, pp.5–6.
- Yves Benoist, *Arithmeticity of discrete subgroups*, Author notes for 2018/2019 lectures ([source](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf)). Read: Lattice space, Mahler compactness and Fact 1.5, physical pp.5–7.
- Paul D. Nelson, Akshay Venkatesh, *The orbit method and analysis of automorphic forms*, Acta Math. 226 (2021), 1–209 ([source](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf)). Read: Published archive copy: §27, Lemma 27.8 and proof, pp.184–185; context p.183. This is an application of Morris Proposition 4.7.1, not a substitute proof of Borel density.
- Valentin Blomer, Andrew Granville, *Representation numbers of quadratic forms*, Author-hosted journal proof layout, Duke Math. J. 135 (2006), no.2 ([source](https://dms.umontreal.ca/~andrew/PDF/quadraticforms.pdf)). Read: §1.1 fundamental-discriminant convention pp.2–3; Theorem 2 p.5. This source does not directly imply the former all-d representation-pair target.

## How the targets fit together

The counting sections build upwards: projection volumes and the interval condition (§4.6) feed Davenport-type asymptotics (§4.6, §4.7); Henk's bound from the base plan gives the successive-minima ball count (§4.7), which the counts of the following sections use (§§4.8–4.9, §4.12, §4.16). The dynamical half starts from the space of lattices (§4.13), which carries Mahler's criterion, the flows and mixing, the nondivergence estimates (§4.14), the Oppenheim auxiliaries (§4.15) and the Siegel transform (§4.16). §4.17 supplies the arithmetic objects of the equidistribution theorems.

## Targets

### 4.6 Davenport's principle and semialgebraic regions

Davenport's principle counts lattice points of a region by its volume, with an error controlled by the volumes of its coordinate projections, provided every axis-parallel line meets the region and its projections in boundedly many intervals. For semialgebraic regions of bounded description complexity the number of intervals is bounded uniformly, which is what makes the estimate usable in families. The base plan's target davenport-semialgebraic-count (Bhargava–Shankar, Proposition 2.5) is proved from the nodes of this section; its unipotent clause needs the uniform proof recorded as an open input in unipotent-davenport-transfer.

<a id="coordinate-projection-volumes"></a>
#### Volumes of coordinate projections

`GN.4/coordinate-projection-volumes` · definition

Let n ≥ 1 and Z ⊆ ℝⁿ (ℝⁿ = Fin n → ℝ with Lebesgue measure). For J ⊆ Fin n let π_J : ℝⁿ → ℝ^J be the coordinate projection and V_J(Z) = vol_J(π_J(Z)) ∈ [0, ∞] its outer Lebesgue measure on ℝ^J. For 0 ≤ j ≤ n put V_j(Z) = Σ_{|J| = j} V_J(Z), with the convention V_0(Z) = 1, so V_n(Z) = vol(Z). The projection maximum of Bhargava–Shankar is Vol(Z̄) = max{V_J(Z) : 1 ≤ |J| ≤ n − 1}, which is 0 when n = 1.

*Hypotheses.*

- n ≥ 1; Z arbitrary (outer measure, so no measurability is assumed). V_0 = 1 is a convention for the constant term of the error, not the measure of a point; it is used even for Z = ∅ only inside error bounds, which are then trivially true.

*Uses.*

- Davenport 1951 / Barroero–Widmer Theorem 1.1, p.2: the error term Σ h^{n−j} V_j(Z) of Davenport's principle
- Bhargava–Shankar Proposition 2.5, physical p.14: the error O(max(Vol(R̄), 1)) for semialgebraic multisets
- Barroero–Widmer Theorem 1.3, p.5: the error Σ_j V_j(Z_T)/(λ_1⋯λ_j) for definable families
- ArithmeticStatistics:ST.2 (Davenport request): consumers estimate projection volumes of fundamental-domain pieces

*API.*

- `coordProjVolume` (constructor): coordProjVolume Z J = volume (π_J '' Z) in ℝ≥0∞, for J : Finset (Fin n).
- `coordProjVolumeSum` (data): coordProjVolumeSum Z j = Σ_{J.card = j} coordProjVolume Z J for 1 ≤ j, and = 1 for j = 0.
- `projMaxVolume` (data): projMaxVolume Z = ⨆ over J with 1 ≤ J.card ≤ n − 1 of coordProjVolume Z J (0 when n = 1).
- `coordProjVolume_univ` (simp): coordProjVolume Z univ = volume Z.
- `coordProjVolumeSum_zero` (simp): coordProjVolumeSum Z 0 = 1.
- `coordProjVolume_mono` (structure): Z ⊆ Z' → coordProjVolume Z J ≤ coordProjVolume Z' J.
- `coordProjVolume_vadd` (relation): coordProjVolume (v +ᵥ Z) J = coordProjVolume Z J.
- `coordProjVolume_smul` (relation): coordProjVolume (c • Z) J = ‖c‖₊^{J.card} * coordProjVolume Z J.
- `coordProjVolume_unipotent_final` (relation): For u upper triangular unipotent and J = {k, …, n − 1}, coordProjVolume (u '' Z) J = coordProjVolume Z J.
- `coordProjVolume_le_of_proj` (compatibility): For J' ⊆ J, π_{J'} factors through π_J, and coordProjVolume of a set equals the volume of its image in ℝ^J composed with the further projection.

*Unit tests.*

- `coordProjVolume_unitCube` (computation): For Z = [0,1]ⁿ, coordProjVolume Z J = 1 for every J and coordProjVolumeSum Z j = Nat.choose n j.
- `coordProjVolume_box` (computation): For Z = [0,a] × [0,b] ⊂ ℝ² with a, b ≥ 0: coordProjVolumeSum Z 1 = a + b and coordProjVolumeSum Z 2 = a·b.
- `coordProjVolume_empty` (degenerate): coordProjVolume ∅ J = 0 for J nonempty, while coordProjVolumeSum ∅ 0 = 1.
- `coordProjVolume_diagonal` (non-example): The diagonal segment {(t,t) : 0 ≤ t ≤ 1} ⊂ ℝ² has volume 0 but coordProjVolumeSum 1 = 2: the volume alone does not control the projections.
- `proj_volume_shear` (non-example): For u(x,y) = (x + 10y, y) and Z = [0,1]², the projection of u '' Z onto the first coordinate has length 11 while that of Z has length 1: only final-segment projections are unipotent-invariant.

*Proof sketch.*

1. V_J is the composite of the image under the measurable linear map π_J with the outer measure on ℝ^J; V_{Fin n} = vol because π_{Fin n} is the identity up to the canonical equivalence ℝⁿ ≃ ℝ^{Fin n}.
2. Monotonicity, translation invariance and the scaling law |c|^{|J|} follow from the same properties of Lebesgue measure on ℝ^J and from π_J(c·Z + v) = c·π_J(Z) + π_J(v).
3. For an upper triangular unipotent u (u_ii = 1, u_ij = 0 for i > j) and a final segment J = {k, …, n − 1}, π_J ∘ u = u_J ∘ π_J with u_J the unipotent lower-right block, so V_J(uZ) = V_J(Z); for other J this fails (test proj_volume_shear).

*Checks.*

- The unit cube has V_J = 1 for every J and V_j = C(n, j).
- For the box [0, a] × [0, b] ⊂ ℝ²: V_1 = a + b, V_2 = ab.

*Needs:* `MeasureTheory.Measure.pi` (Mathlib); `MeasureTheory.Measure.addHaar_image_linearMap` (Mathlib); `MeasureTheory.Measure.addHaar_smul` (Mathlib).

*Source:* Fabrizio Barroero, Martin Widmer (BW2014), Theorem 1.1, p.2 (arXiv:1210.5943): Defines V_j as the sum of the j-dimensional volumes of the projections onto the coordinate subspaces obtained by setting n − j coordinates to zero, with V_0 = 1; this node is that quantity with outer measure. Manjul Bhargava, Arul Shankar (BhargavaShankar2010), Proposition 2.5, physical p.14 (arXiv:1006.1002v2): Vol(R̄) is the largest volume of a projection of R onto a coordinate subspace of dimension 1 to n − 1; recorded here as the projection maximum.

<a id="davenport-principle"></a>
#### Davenport's principle for coordinate-convex regions

`GN.4/davenport-principle` · theorem

Let n ≥ 1, h ≥ 1 and Z ⊆ ℝⁿ compact. Suppose (1) every line parallel to a coordinate axis meets Z in the empty set or a union of at most h closed intervals (single points allowed), and (2) for every J ⊆ Fin n with 1 ≤ |J| ≤ n − 1 the projection π_J(Z) ⊆ ℝ^J has the same property for lines parallel to the axes of ℝ^J. Then |#(Z ∩ ℤⁿ) − vol(Z)| ≤ Σ_{j=0}^{n−1} h^{n−j} V_j(Z), with V_j as in coordinate-projection-volumes (V_0 = 1).

*Hypotheses.*

- Compactness makes every projection compact, hence measurable, and every interval of a line section closed.
- The constant is explicit; no uniformity in a family is claimed here (that is semialgebraic-interval-condition).

*Proof sketch.*

1. n = 1: Z is a union of at most h closed intervals I and |#(I ∩ ℤ) − len I| ≤ 1 for each.
2. n > 1: write N(Z) = Σ_{t∈ℤ} N(Z^{(t)}) over the slices Z^{(t)} = {y ∈ ℝ^{n−1} : (t, y) ∈ Z}. Each slice satisfies (1)–(2) in dimension n − 1, since the projections of a slice are slices of projections of Z and lines in a slice are lines in ℝⁿ; apply the induction hypothesis.
3. Main term: by Tonelli, Σ_{t∈ℤ} vol_{n−1}(Z^{(t)}) = ∫_{ℝ^{n−1}} #{t ∈ ℤ : (t, y) ∈ Z} dy, and the integrand differs from the length of the fibre over y by at most h, so the sum is vol(Z) + O(h·V_{n−1}-term of the projection forgetting the first coordinate).
4. Error terms: Σ_t V_J(Z^{(t)}) for J ⊆ {2, …, n} is again a lattice sum of slice volumes of π_{{1}∪J}(Z), estimated by the same Tonelli step; collecting the powers of h gives the stated bound (Davenport's induction, as reproduced by Barroero–Widmer).

*Checks.*

- Z = [0, N]ⁿ with N ∈ ℕ: #(Z ∩ ℤⁿ) − vol Z = (N+1)ⁿ − Nⁿ ≤ Σ_{j<n} C(n,j) N^j, the bound with h = 1.
- A finite set of h points on the x-axis in ℝ¹ has volume 0 and at most h lattice points: the bound h·V_0 = h is attained.

*Needs:* [`coordinate-projection-volumes`](#coordinate-projection-volumes); `MeasureTheory.lintegral_prod` (Mathlib); `MeasureTheory.Measure.prod_apply` (Mathlib); `Real.volume_Icc` (Mathlib); `IsCompact.image` (Mathlib).

*Source:* Fabrizio Barroero, Martin Widmer (BW2014), Theorem 1.1, p.2 (arXiv:1210.5943), quoting Davenport, J. London Math. Soc. 26 (1951), 179–183: States exactly this inequality for compact sets satisfying the two interval conditions, with V_0 = 1. Fabrizio Barroero, Martin Widmer (BW2014), §2, Lemma 2.1, p.7: Applies the principle after a linear change of variables taking a lattice to ℤⁿ, the form used in semialgebraic-family-lattice-count.

<a id="semialgebraic-complexity"></a>
#### Semialgebraic sets and multisets of bounded complexity

`GN.4/semialgebraic-complexity` · definition

Let n, k, ℓ ∈ ℕ. A set S ⊆ ℝⁿ has description complexity at most (k, ℓ) if there are polynomials f_1, …, f_k ∈ ℝ[x_1, …, x_n] of total degree ≤ ℓ and a set Σ ⊆ {−1, 0, 1}^k of sign vectors with S = {x : (sign f_1(x), …, sign f_k(x)) ∈ Σ}. A bounded semialgebraic multiset of maximal multiplicity m and complexity (k, ℓ) is a function μ : ℝⁿ → {0, …, m} with bounded support such that each superlevel set {μ ≥ i}, 1 ≤ i ≤ m, has complexity at most (k, ℓ); its lattice count is Σ_{x∈ℤⁿ} μ(x) and its volume is ∫ μ. Every set given by a Boolean combination of at most k polynomial equalities and inequalities of degree ≤ ℓ has complexity at most (k, ℓ).

*Hypotheses.*

- The sign vector set Σ is arbitrary, so complements, intersections and unions are covered without changing the polynomials.
- A multiset counts lattice points with multiplicity; a set is the case m = 1.

*Uses.*

- Bhargava–Shankar Proposition 2.5, physical p.14: the class of regions whose lattice points are counted
- Bhargava–Shankar–Wang 2025, Proposition 4.1: fundamental-domain pieces of binary-form spaces are semialgebraic multisets
- ArithmeticStatistics:ST.2 consumers: apply the estimate to (R − v₀)/m, so the complexity must be invariant under affine changes of variables
- semialgebraic-interval-condition (this packet): uniform interval counts on lines from the complexity alone

*API.*

- `HasComplexity` (constructor): HasComplexity k ℓ S ↔ ∃ f : Fin k → MvPolynomial (Fin n) ℝ, (∀ i, (f i).totalDegree ≤ ℓ) ∧ ∃ Σ : Set (Fin k → SignType), S = {x | (fun i ↦ SignType.sign (eval x (f i))) ∈ Σ}.
- `HasComplexity.compl` (structure): HasComplexity k ℓ S → HasComplexity k ℓ Sᶜ.
- `HasComplexity.inter` (structure): HasComplexity k ℓ S → HasComplexity k' ℓ' T → HasComplexity (k + k') (max ℓ ℓ') (S ∩ T).
- `HasComplexity.union` (structure): The same bound for S ∪ T.
- `HasComplexity.mono` (structure): k ≤ k' → ℓ ≤ ℓ' → HasComplexity k ℓ S → HasComplexity k' ℓ' S.
- `HasComplexity.image_affine` (functoriality): For an invertible affine map e of ℝⁿ, HasComplexity k ℓ S → HasComplexity k ℓ (e '' S).
- `HasComplexity.preimage_affine` (functoriality): For an affine map a : ℝ^d → ℝⁿ, HasComplexity k ℓ S → HasComplexity k ℓ (a ⁻¹' S).
- `HasComplexity.isSemialgebraic` (compatibility): Every HasComplexity set is semialgebraic in the sense of Tau Ceti's IsSemialgebraic (on Tau Ceti main, not at the pin): a finite Boolean combination of zero sets and positivity sets.
- `exists_hasComplexity` (equivalence): Every semialgebraic S ⊆ ℝⁿ has HasComplexity k ℓ S for some k, ℓ.
- `SemialgebraicMultiset` (structure): A structure with μ : ℝⁿ → ℕ, μ ≤ m, bounded support, and HasComplexity k ℓ {x | i ≤ μ x} for 1 ≤ i ≤ m.
- `SemialgebraicMultiset.latticeCount` (data): Σ_{x ∈ ℤⁿ} μ x (finite by boundedness).
- `SemialgebraicMultiset.volume` (data): ∫ μ = Σ_{i=1}^m vol {μ ≥ i}.

*Unit tests.*

- `hasComplexity_closedBall` (computation): HasComplexity 1 2 (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1), via f = 1 − Σ x_i² and Σ = {0, 1}.
- `hasComplexity_Icc` (computation): For a ≤ b in ℝ, HasComplexity 1 2 (Set.Icc a b) via (x − a)(b − x).
- `hasComplexity_empty_univ` (degenerate): HasComplexity 0 0 ∅ and HasComplexity 0 0 univ (Σ = ∅, resp. Σ = all of the singleton set of sign vectors).
- `not_hasComplexity_integers` (non-example): ℤ ⊆ ℝ has no complexity (k, ℓ): a set of complexity (k, ℓ) in ℝ has at most kℓ + 1 connected components.
- `multiset_count_double` (characterisation): For μ = 2·1_{[0,N]} on ℝ (m = 2) the lattice count is 2(N + 1) and the volume is 2N; forgetting multiplicity would give N + 1.

*Proof sketch.*

1. Closure properties: complement replaces Σ by its complement; intersection and union of complexity (k, ℓ) and (k', ℓ') sets have complexity (k + k', max(ℓ, ℓ')).
2. Invertible affine changes of variables x ↦ Ax + b preserve total degree, so u(S), S − v and S/m have the same complexity; restriction to an affine subspace parametrised affinely by ℝ^d gives a set of complexity (k, ℓ) in ℝ^d.
3. Each complexity-(k, ℓ) set is semialgebraic (a finite Boolean combination of zero and positivity sets of polynomials); conversely a semialgebraic set has some complexity (finitely many polynomials occur in any description).

*Checks.*

- The closed unit ball has complexity (1, 2).
- A finite union of h points of ℝ has complexity (1, h).

*Needs:* `MvPolynomial` (Mathlib); `MvPolynomial.totalDegree` (Mathlib); `MvPolynomial.eval` (Mathlib); `SignType.sign` (Mathlib).

*Source:* Manjul Bhargava, Arul Shankar (BhargavaShankar2010), Proposition 2.5, physical p.14 (arXiv:1006.1002v2): Bounded semialgebraic multisets with maximal multiplicity m defined by at most k polynomial inequalities of degree at most ℓ; the constant of the Davenport estimate depends only on (n, m, k, ℓ). Fabrizio Barroero, Martin Widmer (BW2014), §1, p.3 and §3, pp.11–13 (arXiv:1210.5943): Semialgebraic sets as the definable sets of the o-minimal structure of real semialgebraic sets, the setting of the family count.

<a id="semialgebraic-uniform-components"></a>
#### Uniform bound on connected components in semialgebraic families

`GN.4/semialgebraic-uniform-components` · theorem

Let S ⊆ ℝ^{m+n} be semialgebraic and for a ∈ ℝ^m let S_a = {x ∈ ℝⁿ : (a, x) ∈ S}. There is M_S ∈ ℕ such that every fibre S_a is a disjoint union of at most M_S cells (in the cylindrical sense), and in particular has at most M_S connected components. Consequently, for all n, k, ℓ there is B(n, k, ℓ) such that every set of complexity at most (k, ℓ) in ℝⁿ has at most B(n, k, ℓ) connected components.

*Hypotheses.*

- S semialgebraic; the bound M_S depends on S only, not on a.
- The consequence uses, for each of the finitely many sign-vector sets Σ ⊆ {−1,0,1}^k, the family parametrised by the coefficient vectors of k polynomials of degree ≤ ℓ.

*Proof sketch.*

1. Take a cylindrical decomposition of ℝ^{m+n} adapted to S (cylindrical algebraic decomposition). Its restriction to each fibre over a ∈ ℝ^m is a decomposition of ℝⁿ into at most as many cells, partitioning S_a.
2. Cells are connected, so S_a has at most M_S = (number of cells of the decomposition) connected components.
3. For the consequence: the set {(c, x) : x lies in the complexity-(k, ℓ) set with coefficient vector c and sign set Σ} is semialgebraic in ℝ^{N+n}, N the number of coefficients; take B = the maximum of the M_S over the finitely many Σ.

*Checks.*

- For k = 1, ℓ = 2 in ℝ¹ (sets {sign(ax² + bx + c) ∈ Σ}) every such set has at most 3 components.
- The fibres of S = {(a, x) : x² < a} are empty or one interval: M_S = 1 suffices for the component count.

*Needs:* [`semialgebraic-complexity`](#semialgebraic-complexity); `IsPreconnected` (Mathlib).

*Source:* Fabrizio Barroero, Martin Widmer (BW2014), §3, Proposition 3.12 and Corollary 3.13, p.12 (arXiv:1210.5943), quoting van den Dries, Tame topology and o-minimal structures, Ch. 3, (3.5): Corollary 3.13: a definable family has a uniform bound M_S on the number of cells partitioning each fibre, hence on the number of connected components; semialgebraic families are definable.

<a id="semialgebraic-interval-condition"></a>
#### Davenport's interval condition for semialgebraic regions

`GN.4/semialgebraic-interval-condition` · lemma

Let n, k, ℓ ∈ ℕ and Z ⊆ ℝⁿ of complexity at most (k, ℓ). There is h = h(n, k, ℓ) such that: (a) for every J ⊆ Fin n with |J| ≥ 1 and every line L ⊂ ℝ^J parallel to a coordinate axis, L ∩ π_J(Z) is a union of at most h intervals; (b) for every coordinate i, every J ⊆ Fin n ∖ {i} and every s ≥ 0, the superlevel set {w ∈ ℝ^J : vol_1({t : (t, w) ∈ π_{{i}∪J}(Z)}) ≥ s} of the fibre-length function of π_{{i}∪J}(Z) along the i-th axis satisfies the same condition with the same h. The constant depends on (n, k, ℓ) only.

*Hypotheses.*

- Z need not be closed; the intervals may be open, half-open or degenerate.
- Part (b) is the condition used for triangular unipotent images (unipotent-davenport-transfer).

*Proof sketch.*

1. (a) L ∩ π_J(Z) = π_J(Z ∩ π_J⁻¹(L)), and π_J⁻¹(L) is an affine subspace parametrised affinely by ℝ^{n−|J|+1}; the pulled-back set has complexity (k, ℓ) (semialgebraic-complexity, preimage_affine), hence at most B(n, k, ℓ) connected components (semialgebraic-uniform-components).
2. A connected set maps under the continuous projection to L onto a connected subset of a line, i.e. an interval; so L ∩ π_J(Z) is a union of at most B intervals.
3. (b) The set {(c, s, w)} of coefficient vectors, levels s and points w with fibre length ≥ s is semialgebraic (the fibre is a union of boundedly many intervals with semialgebraic endpoints, by Tarski–Seidenberg); apply semialgebraic-uniform-components to this family and argue as in (a).

*Checks.*

- For the open unit disc in ℝ² every axis-parallel line section is one interval and each projection is (−1, 1): h = 1 works.
- For a set of complexity (1, ℓ) in ℝ¹, h = ℓ + 1 works.

*Needs:* [`semialgebraic-complexity`](#semialgebraic-complexity); [`semialgebraic-uniform-components`](#semialgebraic-uniform-components); [`coordinate-projection-volumes`](#coordinate-projection-volumes); `IsPreconnected.image` (Mathlib); `isPreconnected_iff_ordConnected` (Mathlib).

*Source:* Fabrizio Barroero, Martin Widmer (BW2014), §4 'The Davenport constant', p.13, and Corollary 3.13, p.12 (arXiv:1210.5943): Shows that a definable family has a uniform Davenport constant: the number of connected components of the intersection of a line with a projection of a fibre is uniformly bounded; this lemma is the semialgebraic case with the bound depending on (n, k, ℓ). Manjul Bhargava, Arul Shankar (BhargavaShankar2010), Proposition 2.5 and the paragraph after it, physical p.14: Asserts that Davenport's argument applies to bounded semialgebraic multisets with a constant depending only on (n, m, k, ℓ); the interval condition is the input that makes this so.

<a id="unipotent-davenport-transfer"></a>
#### Davenport's estimate for triangular unipotent images

`GN.4/unipotent-davenport-transfer` · lemma

Let n ≥ 1, h ≥ 1 and Z ⊆ ℝⁿ bounded such that Z and all its coordinate projections satisfy the h-interval condition on axis-parallel lines, as do the superlevel sets of their fibre-length functions (semialgebraic-interval-condition (b)). Let u be an upper triangular unipotent real matrix. Then |#(uZ ∩ ℤⁿ) − vol(Z)| ≤ C(n, h)·Σ_{J ⊊ Fin n} V_J(Z), with V_∅ = 1 and C(n, h) depending only on n and h. The projection volumes are those of Z, not of uZ. The lower triangular case follows by reversing the order of the coordinates.

*Hypotheses.*

- Upper triangular means x'_i = x_i + Σ_{j>i} u_ij x_j; the coordinate sheared by the others is the first.
- No integrality of u is assumed; vol(uZ) = vol(Z) since det u = 1.

*Proof sketch.*

1. The following is a proposed proof architecture, not a verified closure: its induction must establish the uniform complexity/variation of every superlevel family that occurs. See the open input Uniform unipotent Davenport proof.
2. Fibre along the first coordinate: for z ∈ ℝ^{n−1} the fibre of uZ over z is a translate of the fibre of Z over u'⁻¹z, where u' is the lower-right (n − 1)-block of u, again upper triangular unipotent. Hence #(uZ ∩ ℤⁿ) = Σ_{z∈ℤ^{n−1}} (G(u'⁻¹z) + O(h)) with G(w) the length of the fibre of Z over w.
3. The O(h) terms are supported on u'(π(Z)) ∩ ℤ^{n−1}, π forgetting the first coordinate; by induction (with u') their number is vol(π(Z)) + O(Σ_{J ⊊ {2..n}} V_J(Z)).
4. Main term: Σ_z G(u'⁻¹z) = ∫_0^∞ #(u'S_s ∩ ℤ^{n−1}) ds with S_s = {G ≥ s}. Apply the induction hypothesis to each S_s: the main terms integrate to ∫ G = vol(Z), and the errors ∫_0^∞ V_J(S_s) ds are at most V_{{1}∪J}(Z), because over each w ∈ π_J(S_s) the projection π_{{1}∪J}(Z) contains a first-coordinate set of length ≥ s.
5. The superlevel sets S_s are bounded by π(Z) and inherit the interval condition by hypothesis, uniformly in s.

*Checks.*

- u = identity recovers davenport-principle up to the constant.
- n = 2, Z = [0, ε] × [0, T], u(x, y) = (x + ay, y): the count is at most 2(⌊T⌋ + 1) for every a, within C·(1 + ε + T) as the lemma predicts, although the projection of uZ to the first axis has length ε + aT.

*Needs:* [`davenport-principle`](#davenport-principle); [`coordinate-projection-volumes`](#coordinate-projection-volumes); `MeasureTheory.lintegral_prod` (Mathlib); `MeasureTheory.lintegral_eq_lintegral_meas_le` (Mathlib).

*Source:* Manjul Bhargava, Arul Shankar (BhargavaShankar2010), Proposition 2.5 and the sentence following it, physical p.14: States the unipotent triangular estimate with projection volumes of the original region and says Davenport’s proof adapts. The replacement induction proposed here is not yet certified; E401 is rejected as an established source erratum, and the atlas closure gap is explicit. Fabrizio Barroero, Martin Widmer (BW2014), Theorem 1.1, p.2: The base principle whose slicing argument is reorganised along the flag of the triangular matrix.

### 4.7 Counting by successive minima

Counts that are uniform in the lattice, with the error expressed through the successive minima. The ball count follows from Henk's product bound in the base plan; Schmidt's bounded-domain count, the quadratic-lattice count of Eskin–Katznelson and the small-vector counts of Browning–Le Boudec–Sawin follow from it. Asymptotic counts with error terms come in two forms: Widmer's, for bounded sets with Lipschitz parametrisable boundary, and Barroero–Widmer's, for semialgebraic families; both transport the lattice to ℤⁿ through a basis adapted to the minima.

<a id="ball-count-successive-minima"></a>
#### Lattice points in a ball, by successive minima

`GN.4/ball-count-successive-minima` · theorem

Let Λ is a discrete subgroup of a finite-dimensional real inner-product space E, of rank R ≥ 1, viewed as a full lattice in V = span_ℝ Λ with its induced inner product; λ_1 ≤ … ≤ λ_R are its successive minima for the closed unit ball of V (GN.1 successive-minimum, one-based here) and det Λ its covolume in V. Then for every T > 0, #(Λ ∩ B̄(0, T)) ≤ 2^{3R−1}·Σ_{j=0}^{R} T^j/(λ_1⋯λ_j), the j = 0 term being 1. In particular #(Λ ∩ B̄(0, T)) ≤ 2^{3R−1}(R + 1)·max_{0≤j≤R} T^j/(λ_1⋯λ_j).

*Hypotheses.*

- No lower bound on T is needed; for T < λ_1 the count is 1 and only the j = 0 term matters.
- The constant is explicit; the ambient dimension of E plays no role.

*Proof sketch.*

1. Transport Λ isometrically to a full lattice in ℝ^R (GN.1 successive-minimum-linear-equiv); the minima are unchanged.
2. Apply Henk Theorem 1.5 (pp.2–3) with its ceiling factors: for R ≥ 2 the count is < 2^{R−1}∏_i ceil(2T/λ_i + 1). For R = 1 use the direct interval count ≤ 1 + 2T/λ_1.
3. Since ceil(2x+1) ≤ 2(1+x) for x ≥ 0, expand the product. For each subset I of size j, ∏_{i∈I} λ_i ≥ λ_1⋯λ_j; hence the bound is ≤ 2^{2R−1}Σ_j binom(R,j)T^j/(λ_1⋯λ_j) ≤ 2^{3R−1}Σ_j T^j/(λ_1⋯λ_j). The rank-one interval bound also satisfies the displayed estimate.

*Checks.*

- Λ = ℤ^R, T = 1: the count is 2R + 1 and the bound is 2^{3R−1}(R + 1).
- Λ = aℤ with a > 2T: the count is 1, the j = 0 term.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.4/henk-successive-minima-count`; `GeometryOfNumbersAndQuadraticArithmetic:GN.4/first-minimum-count`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-smul-body`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-linear-equiv`.

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Lemma 3.5, first bound, p.9 (arXiv:2006.02356v1), citing Schmidt, Duke Math. J. 35 (1968), Lemma 2: The count of lattice points of a rank-R lattice in a ball of radius T ≥ 1 is ≪_R Σ_i T^{R−i}/(λ_1⋯λ_{R−i}). Martin Henk (Henk2002), Theorem 1.5 and inequality (1.3), pp.2–3: The product bound used in the proof, with explicit constant. Manjul Bhargava, Arul Shankar, Xiaoheng Wang (BSW2025), Proposition 5.2, p.22 (published numbering): The same estimate for a bounded domain, quoted from Schmidt; see bounded-domain-count.

<a id="ball-count-intermediate-minimum"></a>
#### Ball count past an intermediate minimum

`GN.4/ball-count-intermediate-minimum` · lemma

Let Λ is a discrete subgroup of a finite-dimensional real inner-product space E, of rank R ≥ 1, viewed as a full lattice in V = span_ℝ Λ with its induced inner product; λ_1 ≤ … ≤ λ_R are its successive minima for the closed unit ball of V (GN.1 successive-minimum, one-based here) and det Λ its covolume in V. If 1 ≤ i₀ ≤ R and T ≥ λ_{i₀}, then #(Λ ∩ B̄(0, T)) ≤ C_R·T^R/(λ_1⋯λ_{i₀−1}·λ_{i₀}^{R−i₀+1}), with C_R = 2^{3R−1}(R + 1).

*Hypotheses.*

- T ≥ λ_{i₀} is required: for smaller T the right-hand side can be smaller than 1.

*Proof sketch.*

1. Start from ball-count-successive-minima. For j ≤ i₀ − 1 bound T^j/(λ_1⋯λ_j) by T^R/(λ_1⋯λ_{i₀−1}λ_{i₀}^{R−i₀+1}) using T ≥ λ_{i₀} ≥ λ_i (i ≤ i₀); for j ≥ i₀ use λ_i ≥ λ_{i₀} for i ≥ i₀.
2. Sum the R + 1 terms.

*Checks.*

- i₀ = R: the bound reads T^R/(λ_1⋯λ_R) ≍ T^R/det Λ, the volume order.
- i₀ = 1: T^R/λ_1^R.

*Needs:* [`ball-count-successive-minima`](#ball-count-successive-minima).

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Lemma 3.5, second bound and its proof, pp.9–10: For i₀ ∈ {1, …, R} and T ≥ λ_{i₀}, the count is ≪_R T^R/(λ_1⋯λ_{i₀−1}λ_{i₀}^{R−i₀+1}).

<a id="bounded-domain-count"></a>
#### Schmidt's count in a dilated bounded domain

`GN.4/bounded-domain-count` · theorem

Let Λ be a lattice of rank k in ℝ^m with Euclidean successive minima μ_1 ≤ … ≤ μ_k, and D ⊆ ℝ^m bounded. There is C = C(k, D) with #(Y·D ∩ Λ) ≤ C·max_{0≤j≤k} Y^j/(μ_1⋯μ_j) for every Y > 0; the j = 0 term is 1. Without the j = 0 term the bound is false whenever 0 ∈ D: the origin is always counted while every other term tends to 0 as Y → 0.

*Hypotheses.*

- The j = 0 term is necessary: for 0 ∈ D the origin is always counted.

*Proof sketch.*

1. Choose r with D ⊆ B̄(0, r); then #(YD ∩ Λ) ≤ #(Λ ∩ B̄(0, rY)).
2. Apply ball-count-successive-minima and bound (rY)^j by max(1, r)^k Y^j.

*Checks.*

- Λ = ℤ^k, D = (−1, 1)^k, Y → 0: the count is 1 = the j = 0 term while every other term tends to 0.

*Needs:* [`ball-count-successive-minima`](#ball-count-successive-minima).

*Source:* Manjul Bhargava, Arul Shankar, Xiaoheng Wang (BSW2025), Proposition 5.2, (22), p.22 (published Forum Math. Pi version; (21) in arXiv v1): States the bound with the maximum over 1 ≤ j ≤ k; the corrected range 0 ≤ j ≤ k is PAPER-BHARGAVA-SHANKAR-WANG-25/E14 (confirmed). Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Lemma 3.5, p.9: The ball case.

<a id="quadratic-norm-count-by-minima"></a>
#### Counting vectors of bounded norm in a definite quadratic lattice

`GN.4/quadratic-norm-count-by-minima` · theorem

Let (L, Q) be a free ℤ-module of rank r ≥ 1 with a positive definite quadratic form Q (real-valued). Let μ_i = inf{y > 0 : L contains i linearly independent vectors v with Q(v) ≤ y²} and a_i = μ_1⋯μ_i (a_0 = 1), as in GN.1 successive-minimum-partial-product. Then for every Y > 0, #{v ∈ L : Q(v) ≤ Y} ≤ 2^{3r−1}Σ_{i=0}^{r} Y^{i/2}/a_i; the nonzero count vanishes for Y < μ_1².

*Hypotheses.*

- Q positive definite on L ⊗ ℝ; the minima are in the square-root normalisation of Eskin–Katznelson.

*Proof sketch.*

1. Give L ⊗ ℝ the inner product with ‖v‖² = Q(v); then L is a full lattice whose Euclidean minima are the μ_i.
2. Apply ball-count-successive-minima with T = √Y.

*Checks.*

- L = ℤ^r with Q = sum of squares: μ_i = 1, a_i = 1 and the bound is a polynomial in √Y of degree r, matching the order Y^{r/2} of the true count.

*Needs:* [`ball-count-successive-minima`](#ball-count-successive-minima); `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-partial-product`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/integral-norm-minima-comparison`.

*Source:* Davesh Maulik, Ananth N. Shankar, Yunqing Tang (MST2022), Proof of Propositions 7.11 and 7.13 (accepted version of 25 December 2021), quoting Eskin–Katznelson, Lemma 2.4 and (5)–(6): Counts vectors of bounded Q in the lattices L_n by Σ_i Y^{i/2}/a_i with a constant depending on the rank only. Ananth N. Shankar, Arul Shankar, Yunqing Tang, Salim Tayou (SSTT2022), Proof of Proposition 7.7 and footnote 32, p.37 (retrieved PDF) (arXiv:1909.07473v3): The count of nonzero v with Q(v) < X is ≪_r Σ_i X^{i/2}/a_i.

<a id="small-vector-count"></a>
#### Counting nonzero vectors below the last minimum

`GN.4/small-vector-count` · theorem

Let Λ is a discrete subgroup of a finite-dimensional real inner-product space E, of rank R ≥ 1, viewed as a full lattice in V = span_ℝ Λ with its induced inner product; λ_1 ≤ … ≤ λ_R are its successive minima for the closed unit ball of V (GN.1 successive-minimum, one-based here) and det Λ its covolume in V. Let M > 0 with M < λ_1 and Y ≥ λ_R. (a) For 0 ≤ R₀ ≤ R − 1 and 0 < T ≤ Y: #((Λ ∖ {0}) ∩ B̄(0, T)) ≤ C_R·(T^{R−R₀}Y^{R₀}/det Λ + (T/M)^{R−R₀−1}). (b) If moreover 0 ≤ j₀ ≤ R − 1, J ≥ M with J < λ_{j₀+1}, and 0 ≤ R₀ ≤ R − 1 − j₀, then #((Λ ∖ {0}) ∩ B̄(0, T)) ≤ C_R·(T^{R−R₀}Y^{R₀}/det Λ + (T/M)^{j₀}·((T/J)^{R−R₀−1−j₀} + 1)).

*Hypotheses.*

- C_R depends only on R.
- If T ≤ M the left side is 0, so only T > M matters.

*Proof sketch.*

1. (a) is (b) with j₀ = 0, J = M.
2. For T > M write the count via ball-count-successive-minima and split the sum at R₀: the terms with many minima use λ_{R−i+1}⋯λ_R ≤ Y^i and Minkowski's second theorem λ_1⋯λ_R ≍ det Λ; the others use λ_i > M for i ≤ j₀ and λ_i > J for i > j₀.
3. Sum the geometric series in T/J (T > M) as in the source.

*Checks.*

- Λ = ℤ^R, M = 1/2, Y = 1, T = 1/4: the count is 0.
- R = 1: (a) with R₀ = 0 gives a bound C(T/det Λ + 1).

*Needs:* [`ball-count-successive-minima`](#ball-count-successive-minima); `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-lower`.

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Lemma 3.6 and its proof, pp.10–11: States both bounds with implied constants depending at most on R and proves them from Lemma 3.5 and Minkowski's second theorem.

<a id="adapted-basis-coordinates"></a>
#### A basis adapted to the successive minima, with coordinate bounds

`GN.4/adapted-basis-coordinates` · theorem

Let Λ be a full lattice in an R-dimensional real inner-product space E (R ≥ 1) with successive minima λ_1 ≤ … ≤ λ_R. There is a ℤ-basis b_1, …, b_R of Λ with ‖b_j‖ ≤ j·λ_j for every j, and every x = Σ_j t_j b_j ∈ E satisfies |t_j| ≤ c_R‖x‖/λ_j for every j, where c_R = 2^R·R!/V_R and V_R is the volume of the unit ball.

*Hypotheses.*

- The coordinate bound holds for all real x, not only lattice points.
- The basis need not realise the minima.

*Proof sketch.*

1. The basis comes from GN.1 basis-from-minima: b_j lies in (λ_1 + ⋯ + λ_j)·B̄, so ‖b_j‖ ≤ jλ_j.
2. Cramer's rule: t_j = det(b_1, …, x, …, b_R)/det(b_1, …, b_R), x in place j; Hadamard's inequality bounds the numerator by ‖x‖∏_{i≠j}‖b_i‖ ≤ ‖x‖∏_{i≠j} iλ_i.
3. det(b) = det Λ ≥ V_R λ_1⋯λ_R/2^R by Minkowski's second theorem; combine.

*Checks.*

- E = ℝ^R, Λ = ℤ^R: the standard basis satisfies both bounds with t_j = x_j.
- R = 1, Λ = aℤ: b_1 = a and t_1 = x/a.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.1/basis-from-minima`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0/orthonormal-coordinate-hadamard`; `Matrix.cramer` (Mathlib); `Module.Basis.det` (Mathlib).

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Proofs of Lemmas 3.21 (pp.22–23) and 3.23 (p.24), citing Davenport, Proc. Roy. Soc. A 272 (1963), Lemma 5: Uses a basis with ‖b_j‖ ≍ λ_j in which every vector x of the lattice has coordinates of size ≪ ‖x‖/λ_j. Fabrizio Barroero, Martin Widmer (BW2014), §2, p.7, citing Cassels, An introduction to the geometry of numbers, Lemma 8, p.135: A basis with |v_i| ≤ iλ_i, used to map the lattice to ℤⁿ before applying Davenport's principle. Jan-Hendrik Evertse (EvertseGeometry), §2.3, Exercise 2.8, printed p.24: The basis-from-minima input.

<a id="widmer-lipschitz-count"></a>
#### Widmer's lattice-point count for Lipschitz boundaries

`GN.4/widmer-lipschitz-count` · theorem

Let D ≥ 1, Λ a full lattice in ℝ^D with Euclidean successive minima λ_1 ≤ … ≤ λ_D, and S ⊆ ℝ^D bounded whose boundary ∂S is covered by the images of M maps [0,1]^{D−1} → ℝ^D, each Lipschitz with constant L (∂S is Lipschitz parametrisable in dimension D − 1 with these data). Then S is Lebesgue measurable and |#(S ∩ Λ) − vol(S)/det Λ| ≤ c₀(D)·M·max_{0≤i<D} L^i/(λ_1⋯λ_i), where the i = 0 term is 1 and c₀(D) = D^{3D²/2}.

*Hypotheses.*

- The bound is uniform in Λ: it depends on Λ only through its minima, unlike the fixed-lattice count of GlobalNumberFields Layer 3.
- For D = 1 the boundary is a finite set of at most M points.

*Proof sketch.*

1. Measurability: ∂S is a finite union of Lipschitz images of a (D−1)-cube, hence Lebesgue null.
2. Choose a basis with minimal orthogonality defect (adapted-basis-coordinates) and its fundamental parallelepiped P; #(S ∩ Λ) differs from vol(S)/det Λ by at most the number of translates of P meeting ∂S.
3. Cover each Lipschitz image by subcubes of side 1/m; each subimage has diameter ≤ L√(D−1)/m and meets a number of translates bounded by ∏_i(κL/(mλ_i) + 2) with κ the orthogonality constant; optimise m to get the maximum over i.

*Checks.*

- Λ = ℤ^D, S = [0, N]^D: the error is (N + 1)^D − N^D ≤ c₀(D)·2D·N^{D−1}, consistent with M = 2D faces of Lipschitz constant ≍ N.
- Λ = εℤ ⊕ ℤ^{D−1} with ε → 0 and S fixed: the bound grows like L/ε, the i = 1 term.

*Needs:* [`adapted-basis-coordinates`](#adapted-basis-coordinates); `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-3-geometry-of-numbers-and-ray-class-ideal-counting`; `ZLattice.covolume` (Mathlib); `ZSpan.fundamentalDomain` (Mathlib).

*Source:* Martin Widmer (Widmer2010), Theorem 5.4 and its proof, p.17 (arXiv:1204.0927; Trans. Amer. Math. Soc. 362 (2010)): For a lattice in ℝ^D with minima λ_i and bounded S whose boundary lies in Lip(D, 1, M, L), S is measurable and the count differs from vol S/det Λ by at most c₀(D)M max_{0≤i<D} L^i/(λ_1⋯λ_i), with c₀(D) = D^{3D²/2}. Peter Koymans, Djordjo Milovic (KM2021), Proof of Lemma 3.1, (3.10), p.11 (arXiv:1809.09597v1): Applies Widmer's Theorem 5.4 to dilated cubes in a family of lattices Λ_g, uniformly in g.

<a id="semialgebraic-family-lattice-count"></a>
#### Lattice points in semialgebraic families, uniformly in the lattice

`GN.4/semialgebraic-family-lattice-count` · theorem

Let m, n ≥ 1 and Z ⊆ ℝ^{m+n} semialgebraic with bounded fibres Z_T = {x : (T, x) ∈ Z}, T ∈ ℝ^m. There is c_Z depending only on Z such that for every full lattice Λ ⊆ ℝⁿ with successive minima λ_1 ≤ … ≤ λ_n and every T: |#(Z_T ∩ Λ) − vol(Z_T)/det Λ| ≤ c_Z·Σ_{j=0}^{n−1} V_j(Z_T)/(λ_1⋯λ_j), with V_j the coordinate projection volumes (V_0 = 1).

*Hypotheses.*

- Only semialgebraic families are claimed here; the source proves the statement for families definable in any o-minimal structure, which no library or roadmap plans.

*Proof sketch.*

1. Map Λ to ℤⁿ by the linear map Ψ sending an adapted basis (adapted-basis-coordinates) to the standard basis; apply davenport-principle to Ψ(closure Z_T) with a Davenport constant h depending only on Z (semialgebraic-interval-condition applied to the family, via semialgebraic-uniform-components).
2. BW Lemmas 2.2–2.4 first bound transformed coordinate projections using the largest volumes of arbitrary orthogonal projections, V′_j. Replacing V′_j(Z_T) by a family-dependent multiple of V_j(Z_T) needs Proposition 6.1, pp.17–20: definable sections (Lemma 6.2), rectifiability and Hausdorff-measure comparison (Lemma 5.8). This nonroutine input has no exact supplier in the present prerequisite list; it is an open input.
3. BW §7, pp.20–21, passes from compact closures to arbitrary bounded fibres using definable boundaries of dimension < n, equality of projection volumes with their closures, and the compact-fibre estimate applied to the boundary. These boundary and projection-comparison inputs must be supplied before claiming closure.

*Checks.*

- Λ = ℤⁿ and Z_T = T·[0,1]ⁿ (T ∈ ℝ_{>0}): recovers |(⌊T⌋ + 1)ⁿ − Tⁿ| ≪ Σ_j T^j.
- The example of Barroero–Widmer p.5 (union of axis segments of length T shifted by λ_j e_j) shows the j-th term cannot be dropped.

*Needs:* [`davenport-principle`](#davenport-principle); [`coordinate-projection-volumes`](#coordinate-projection-volumes); [`semialgebraic-interval-condition`](#semialgebraic-interval-condition); [`semialgebraic-uniform-components`](#semialgebraic-uniform-components); [`adapted-basis-coordinates`](#adapted-basis-coordinates).

*Source:* Fabrizio Barroero, Martin Widmer (BW2014), Theorem 1.3, p.5; Lemmas 2.1–2.4, pp.7–8; Lemma 5.8, pp.15–17; Proposition 6.1 and Lemma 6.2, pp.17–20; §7, pp.20–21 (arXiv:1210.5943, retrieved 2026-10-16): For a definable family with bounded fibres, |#(Z_T ∩ Λ) − vol(Z_T)/det Λ| ≤ c_Z Σ_{j<n} V_j(Z_T)/(λ_1⋯λ_j); semialgebraic families are definable. Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), §3.1, p.9 and §5.1, p.51: Uses Theorem 1.3 of Barroero–Widmer for the semialgebraic regions R_v(T, γ).

<a id="hyperplane-orthant-count"></a>
#### Lattice points on a hyperplane in the positive orthant

`GN.4/hyperplane-orthant-count` · theorem

Let d ≥ 2, L = v + Λ ⊆ ℤ^d a translate of a full lattice Λ ⊆ ℤ^d by an integer vector, and a_1, …, a_d positive integers. There are k ≥ 1, s ∈ ℤ/k and r > 0 such that for every integer n ≥ 1, L′(n) = L ∩ {Σ a_i x_i = n} is empty unless n ≡ s mod k, and if n ≡ s mod k then #(L′(n) ∩ ℝ^d_{≥0}) = r·n^{d−1} + O_{d,L,a}(n^{d−2}).

*Hypotheses.*

- All a_i > 0: with some a_i = 0 the count is infinite (PAPER-LIU-WOOD-ZUREICKBROWN-24/E8, confirmed); then the simplex {x ≥ 0, Σa_ix_i = n} is bounded.

*Proof sketch.*

1. The values Σ a_i x_i on L form a coset s + kℤ of a subgroup kℤ ⊆ ℤ (k = gcd of the a-values on Λ).
2. For n ≡ s mod k, L′(n) is a translate of the rank-(d − 1) lattice Λ ∩ {Σa_ix_i = 0} inside the hyperplane; the points with x ≥ 0 lie in the dilated simplex n·Δ, Δ = {x ≥ 0, Σa_ix_i = 1}.
3. Apply the fixed-lattice count with Lipschitz boundary (GlobalNumberFields Layer 3) or semialgebraic-family-lattice-count in the hyperplane: main term vol(nΔ)/det = r n^{d−1} with r = vol(Δ)/covol, error O(n^{d−2}).

*Checks.*

- d = 2, L = ℤ², a = (1, 1): k = 1 and #{x, y ≥ 0, x + y = n} = n + 1 = n + O(1), r = 1.

*Needs:* [`semialgebraic-family-lattice-count`](#semialgebraic-family-lattice-count); `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-3-geometry-of-numbers-and-ray-class-ideal-counting`.

*Source:* Yuan Liu, Melanie Matchett Wood, David Zureick-Brown (LWZB2024), Lemma 12.8, p.51 (arXiv:1907.05002v2): States the result for non-negative a_i not all zero; positivity is needed for finiteness (E8).

### 4.8 Primitive lattices, angular bands and weighted sums

The lattice-point inputs of Browning–Le Boudec–Sawin's study of random Fano hypersurfaces: counts in intersections of angular bands, counts of primitive sublattices of ℤ^{n+1} with prescribed minima, the volumes of one- and two-band sections, and primitive point counts by Möbius inversion.

<a id="angular-band-region"></a>
#### Angular bands and their lattice regions

`GN.4/angular-band-region` · definition

Let N ≥ 1, γ > 0 and v ∈ ℝ^N. The angular band of v is C_v^{(γ)} = {t ∈ ℝ^N : |⟨v, t⟩| ≤ ‖v‖·‖t‖/(2γ)}, the set of vectors making an angle with the hyperplane v^⊥ whose sine is at most 1/(2γ). For v_1, …, v_I ∈ ℝ^N and T > 0 put R_v(T, γ) = B̄_N(T) ∩ C_{v_1}^{(γ)} ∩ ⋯ ∩ C_{v_I}^{(γ)}, and for a lattice Λ of rank R put V_v(Λ; γ) = vol_R(span_ℝ Λ ∩ R_v(1, γ)), the R-dimensional volume in the span.

*Hypotheses.*

- γ > 0; v = 0 gives the whole space (the inequality reads 0 ≤ 0).
- The band is a closed cone (invariant under t ↦ ct for c ∈ ℝ), so R_v(T, γ) = T·R_v(1, γ).

*Uses.*

- Browning–Le Boudec–Sawin, Lemma 3.4, p.9: lattice points of a rank-R lattice in R_v(T, γ) are counted with main term T^R V_v/det Λ
- Browning–Le Boudec–Sawin, §4.2, (4.1)–(4.2), p.27: the one- and two-band volumes I(w,z) and J(w,z) are volumes of such regions
- HeightsRationalPointsAndObstructions, Part II (random Fano hypersurfaces): the localised counting function is a sum over points of these regions

*API.*

- `angularBand` (constructor): angularBand γ v = {t | |⟪v, t⟫| ≤ ‖v‖ * ‖t‖ / (2 * γ)}.
- `bandRegion` (constructor): bandRegion T γ v = closedBall 0 T ∩ ⋂ i, angularBand γ (v i).
- `bandVolume` (data): bandVolume Λ γ v = volume (restricted to span ℝ Λ) of span ℝ Λ ∩ bandRegion 1 γ v.
- `mem_angularBand_smul` (simp): c • t ∈ angularBand γ v ↔ t ∈ angularBand γ v for c ≠ 0, and 0 ∈ angularBand γ v.
- `bandRegion_eq_smul` (relation): For T > 0, bandRegion T γ v = T • bandRegion 1 γ v.
- `angularBand_antitone` (structure): γ ≤ γ' → angularBand γ' v ⊆ angularBand γ v.
- `angularBand_zero` (simp): angularBand γ 0 = univ.
- `hasComplexity_bandRegion` (compatibility): bandRegion T γ v has description complexity (I + 1, 2).

*Unit tests.*

- `angularBand_half_eq_univ` (degenerate): For γ = 1/2 and any v, angularBand γ v = univ, by Cauchy–Schwarz.
- `angularBand_e1_one` (computation): In ℝ², (1, 1) ∉ angularBand 1 e_1 (|1| > √2/2) and (1, 2) ∈ angularBand 1 e_1 (1 ≤ √5/2).
- `bandRegion_volume_plane` (computation): In ℝ², bandRegion 1 1 (e_1) is the union of two sectors of half-angle π/6 about the t_2-axis, of area π/3.
- `angularBand_not_convex` (non-example): (1, 2) and (1, −2) lie in angularBand 1 e_1 ⊆ ℝ² but their midpoint (1, 0) does not: the band is a closed double cone, not a convex set.

*Proof sketch.*

1. The band is defined by the polynomial inequality 4γ²⟨v,t⟩² ≤ ‖v‖²‖t‖², so R_v(T, γ) has complexity (I + 1, 2) (semialgebraic-complexity).
2. Homogeneity: C_v^{(γ)} is closed under real scalar multiplication, hence R_v(T, γ) = T·R_v(1, γ) and V_v depends on Λ only through span_ℝ Λ.

*Checks.*

- For N = 2, v = e_1 and γ = 1/2 the band is all of ℝ² (|t_1| ≤ ‖t‖ always).
- For N = 2, v = e_1, γ = 1 the band is {|t_1| ≤ ‖t‖/2}, two sectors of half-angle π/6 around the t_2-axis.

*Needs:* [`semialgebraic-complexity`](#semialgebraic-complexity); `Metric.closedBall` (Mathlib); `real_inner_self_eq_norm_sq` (Mathlib).

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), §2, (2.6), p.4 (arXiv:2006.02356v1): Defines C_v^{(γ)} by |⟨v,t⟩| ≤ ‖v‖‖t‖/(2γ). Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Lemma 3.4, statement, p.9: Defines R_{v_1,…,v_I}(T, γ) and V_{v_1,…,v_I}(Λ; γ).

<a id="band-count"></a>
#### Lattice points in intersections of angular bands

`GN.4/band-count` · theorem

Let N ≥ 2, 1 ≤ R ≤ N, 1 ≤ I ≤ N − 1, Λ ⊆ ℝ^N a lattice of rank R, v_1, …, v_I ∈ ℝ^N and γ > 0. Let Y ≥ λ_R(Λ). For T ≥ Y: #(Λ ∩ R_v(T, γ)) = (T^R/det Λ)·(V_v(Λ; γ) + O(Y/T)), the implied constant depending only on N and I (and on R).

*Hypotheses.*

- The constant is uniform in Λ, the v_i and γ.
- The source states dependence on R only; the uniformity in the family follows from the semialgebraic family bound, whose constant depends on the family (N, I): recorded as a dependence on (N, I).

*Proof sketch.*

1. Rotate span_ℝ Λ onto ℝ^R × {0} by an orthogonal map; the region becomes a semialgebraic family in the parameters (v, γ, T) of complexity depending only on (N, I).
2. Apply semialgebraic-family-lattice-count: the error is ≪ Σ_{i=1}^{R} T^{R−i}/(λ_1⋯λ_{R−i}).
3. By Minkowski's second theorem λ_1⋯λ_{R−i} ≍ det Λ/(λ_{R−i+1}⋯λ_R) ≥ det Λ/Y^i, so each error term is ≪ (T^R/det Λ)(Y/T)^i ≤ (T^R/det Λ)(Y/T) for T ≥ Y.

*Checks.*

- I = 1, v_1 = 0: the region is the ball, V_v = V_R and the formula is the classical ball count with error T^{R−1}Y/det Λ.

*Needs:* [`semialgebraic-family-lattice-count`](#semialgebraic-family-lattice-count); [`angular-band-region`](#angular-band-region); `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-lower`.

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Lemma 3.4 and its proof, p.9: States the asymptotic count with error O(Y/T) for T ≥ Y ≥ λ_R(Λ), using Barroero–Widmer Theorem 1.3 and Minkowski's second theorem. Fabrizio Barroero, Martin Widmer (BW2014), Theorem 1.3, p.5: The uniform family count.

<a id="primitive-lattices-with-prescribed-minima"></a>
#### Primitive integral lattices with prescribed dyadic minima

`GN.4/primitive-lattices-with-prescribed-minima` · definition

Let n ≥ 2, 1 ≤ r ≤ n + 1 and s_1, …, s_r ≥ 1. S_{r,n}(s_1, …, s_r) is the set of primitive lattices L ⊆ ℤ^{n+1} of rank r (L = span_ℝ L ∩ ℤ^{n+1}) whose Euclidean successive minima satisfy s_j/2 < λ_j(L) ≤ s_j for every j.

*Hypotheses.*

- Primitive means saturated in ℤ^{n+1}; the minima are computed in span_ℝ L.

*Uses.*

- Browning–Le Boudec–Sawin, Lemmas 3.18–3.24, pp.19–25: dyadic decomposition of sums over primitive lattices by their minima
- Bhargava–Shankar–Wang 2025, Proposition 5.7, p.23: the analogous sets Σ(L, s) of row lattices with prescribed skewed minima (skew-row-lattice-count)

*API.*

- `primitiveWithMinima` (constructor): primitiveWithMinima n r s = {L : Submodule ℤ (Fin (n+1) → ℤ) | L.IsSaturated ∧ finrank L = r ∧ ∀ j, s j / 2 < λ_j L ∧ λ_j L ≤ s j}.
- `primitiveWithMinima_finite` (structure): (primitiveWithMinima n r s).Finite.
- `mem_primitiveWithMinima_iff` (characterisation): Membership unfolds to saturation, rank and the dyadic minima conditions.
- `primitiveWithMinima_one` (characterisation): primitiveWithMinima n 1 s is in bijection with the pairs {x, −x} of primitive vectors of ℤ^{n+1} with s_1/2 < ‖x‖ ≤ s_1.
- `primitiveWithMinima_eq_empty` (relation): If some s_j < 1 the set is empty, since nonzero integral vectors have norm ≥ 1.

*Unit tests.*

- `primitiveWithMinima_line_count` (computation): For n = 2, r = 1, s_1 = 1: the primitive lines with 1/2 < λ_1 ≤ 1 are the three coordinate axes, so the set has 3 elements.
- `primitiveWithMinima_full_rank` (degenerate): For r = n + 1 and s = (1, …, 1) the set is {ℤ^{n+1}}.
- `primitiveWithMinima_nonprimitive_excluded` (non-example): 2ℤe_1 has minimum 2 but is not primitive, so it is not in S_{1,n}(2) although its minimum is in (1, 2].
- `primitiveWithMinima_small_s` (degenerate): For s_1 = 1/2 (not ≥ 1) no lattice qualifies.

*Proof sketch.*

1. A rank-r primitive lattice is determined by its real span, so S_{r,n} is a set of rational subspaces of dimension r.
2. Finiteness: λ_r(L) ≤ s_r bounds a basis of L, so only finitely many L occur (ball-count-successive-minima).

*Checks.*

- S_{1,n}(s) is the set of lines ℤx with x primitive and s/2 < ‖x‖ ≤ s.
- For r = n + 1 the only primitive lattice is ℤ^{n+1}, with all minima 1: it lies in S_{n+1,n}(s) iff 1 ≤ s_j < 2 for all j.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0/saturated-adapted-basis`.

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Definition 3.17, p.19: Defines S_{r,n}(s_1, …, s_r) as above.

<a id="schmidt-primitive-extension-count"></a>
#### Primitive extensions of a fixed primitive lattice

`GN.4/schmidt-primitive-extension-count` · theorem

Let n ≥ 2, 2 ≤ r ≤ n + 1 and L' ⊆ ℤ^{n+1} a primitive lattice of rank r − 1. For s ≥ 1, the number of primitive lattices L ⊆ ℤ^{n+1} of rank r with L' ⊆ L and det(L)/det(L') ≤ s is ≪_n s^{n−r+2}·det(L').

*Hypotheses.*

- The implied constant depends only on n.

*Proof sketch.*

1. L ↦ π(L) with π the orthogonal projection away from span L' identifies such L with primitive vectors of the rank-(n − r + 2) quotient lattice π(ℤ^{n+1}) of norm ≤ s, up to sign (det L = det L'·‖π(x)‖).
2. M = π(ℤ^{n+1}) has rank q = n − r + 2, determinant 1/det(L') (GN.0 covolume-projection) and integral dual M* = L'^⊥ (GN.0 dual-projection-comap). Integrality gives λ_i(M*) ≥ 1, so transference-minkowski-constant bounds every minimum μ_i of M by a constant c(q).
3. By ball-count-successive-minima the number of x ∈ M with ‖x‖ ≤ s is ≪ Σ_j s^j/(μ_1⋯μ_j) = Σ_j s^j μ_{j+1}⋯μ_q/(μ_1⋯μ_q) ≪ s^q·det(L') for s ≥ 1, using μ_1⋯μ_q ≍ det M (Minkowski's second theorem).

*Checks.*

- r = 2, L' = ℤe_1: the extensions correspond to primitive x ∈ ℤ^n (the other coordinates) with ‖x‖ ≤ s, about s^n of them.

*Needs:* [`ball-count-successive-minima`](#ball-count-successive-minima); [`transference-minkowski-constant`](#transference-minkowski-constant); `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-projection`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0/dual-projection-comap`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`.

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Proof of Lemma 3.18, p.19, citing Schmidt, Duke Math. J. 35 (1968), Lemma 6 with i = 1: Uses the bound ≪_n s^{n−r+2}det(L') for primitive rank-r extensions of a primitive rank-(r − 1) lattice with det(L)/det(L') ≤ s.

<a id="primitive-lattice-minima-count"></a>
#### Counting primitive lattices by their minima

`GN.4/primitive-lattice-minima-count` · theorem

Let n ≥ 2 and 1 ≤ r ≤ n + 1. For all s_1, …, s_r ≥ 1, #S_{r,n}(s_1, …, s_r) ≪_n ∏_{j=1}^r s_j^{n+r+2−2j}.

*Hypotheses.*

- The implied constant depends only on n.

*Proof sketch.*

1. Induction on r. r = 1: #S_{1,n}(s_1) ≤ #(ℤ^{n+1} ∩ B̄(s_1)) ≪ s_1^{n+1}.
2. r − 1 → r: for L ∈ S_{r,n} choose b_j ∈ L with ‖b_j‖ = λ_j(L) (j < r) and L^{(−1)} = (ℝb_1 + ⋯ + ℝb_{r−1}) ∩ ℤ^{n+1}, primitive of rank r − 1 with minima ≤ s_j and det ≪ s_1⋯s_{r−1}; the number of choices of L^{(−1)} is bounded by the induction hypothesis (after a dyadic decomposition of its minima).
3. Given L^{(−1)}, det(L)/det(L^{(−1)}) ≪ s_r, so schmidt-primitive-extension-count bounds the number of L by s_r^{n−r+2}·det(L^{(−1)}); multiply.

*Checks.*

- r = 1: the bound s_1^{n+1} is the order of the number of primitive vectors of norm ≤ s_1.
- r = n + 1: the bound is ∏ s_j^{2n+3−2j} ≥ 1, while the true count is ≤ 1.

*Needs:* [`primitive-lattices-with-prescribed-minima`](#primitive-lattices-with-prescribed-minima); [`schmidt-primitive-extension-count`](#schmidt-primitive-extension-count); [`ball-count-successive-minima`](#ball-count-successive-minima); `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`.

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Lemma 3.18 and its proof, pp.19–20: States #S_{r,n}(s_1, …, s_r) ≪ s_1^{n+r}s_2^{n+r−2}⋯s_r^{n−r+2} and proves it by induction on r.

<a id="band-section-volumes"></a>
#### One-band and two-band section volumes

`GN.4/band-section-volumes` · definition

For N ≥ 2 and w, z ∈ ℝ^N let I(w, z) = vol_{N−1}{t ∈ (ℝw)^⊥ : |⟨z, t⟩| ≤ ‖t‖ ≤ 1} (volume in the hyperplane w^⊥, w ≠ 0) and J(w, z) = vol_N{t ∈ ℝ^N : |⟨w, t⟩| ≤ ‖t‖, |⟨z, t⟩| ≤ ‖t‖, ‖t‖ ≤ 1}. Put δ(w, z) = ‖w‖²‖z‖² − ⟨w, z⟩², which is > 0 exactly when w, z are linearly independent.

*Hypotheses.*

- w ≠ 0 for I; no condition for J (J = V_N when ‖w‖, ‖z‖ ≤ 1).

*Uses.*

- Browning–Le Boudec–Sawin, Lemmas 4.2–4.3, pp.27–29: asymptotics in terms of δ(w, z)
- Browning–Le Boudec–Sawin, §4.3–§4.4: main terms of the pair-correlation counts of the localised counting function

*API.*

- `oneBandVolume` (constructor): oneBandVolume w z = volume in (ℝ ∙ w)ᗮ of {t | |⟪z, t⟫| ≤ ‖t‖ ∧ ‖t‖ ≤ 1}.
- `twoBandVolume` (constructor): twoBandVolume w z = volume {t | |⟪w, t⟫| ≤ ‖t‖ ∧ |⟪z, t⟫| ≤ ‖t‖ ∧ ‖t‖ ≤ 1}.
- `bandDelta` (data): bandDelta w z = ‖w‖^2 * ‖z‖^2 − ⟪w, z⟫^2.
- `bandDelta_pos_iff` (characterisation): 0 < bandDelta w z ↔ LinearIndependent ℝ ![w, z].
- `oneBandVolume_of_norm_le_one` (simp): For w ≠ 0 and ‖z‖ ≤ 1, oneBandVolume w z = the volume of the unit ball of dimension N−1.
- `twoBandVolume_of_norm_le_one` (simp): ‖w‖ ≤ 1 → ‖z‖ ≤ 1 → twoBandVolume w z = V_N.
- `oneBandVolume_orthogonal` (functoriality): oneBandVolume (O w) (O z) = oneBandVolume w z for O orthogonal.
- `twoBandVolume_le` (structure): twoBandVolume w z ≤ V_N.

*Unit tests.*

- `bandDelta_orthonormal` (computation): bandDelta e_1 e_2 = 1.
- `oneBandVolume_small` (computation): For N=3, w ≠ 0 and ‖z‖ ≤ 1, oneBandVolume w z = π.
- `bandDelta_dependent` (degenerate): bandDelta w (2 • w) = 0.
- `twoBandVolume_not_product` (non-example): twoBandVolume is not the product of the two single-band volumes: for ‖w‖, ‖z‖ ≤ 1 it equals V_N, not V_N².

*Proof sketch.*

1. Both sets are compact semialgebraic, so the volumes are finite; I is a volume in a hyperplane, computed via an isometry w^⊥ ≃ ℝ^{N−1}.
2. Invariance: I(Ow, Oz) = I(w, z) and J(Ow, Oz) = J(w, z) for orthogonal O; I(cw, z) = I(w, z) for c ≠ 0.

*Checks.*

- If ‖z‖ ≤ 1 then I(w, z) = V_{N−1}.
- δ(w, z) = 0 for dependent vectors.

*Needs:* `MeasureTheory.Measure.addHaar_image_linearMap` (Mathlib); `real_inner_self_eq_norm_sq` (Mathlib); `InnerProductSpace.volume_closedBall` (Mathlib).

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), §4.2, (4.1) and (4.2), p.27: Defines I(w, z), J(w, z) and δ_{w,z} as above.

<a id="band-section-volume-asymptotics"></a>
#### Asymptotics of the band section volumes

`GN.4/band-section-volume-asymptotics` · theorem

Let N ≥ 3 and w, z ∈ ℝ^N linearly independent, δ = δ(w, z). Then I(w, z) = (2(N − 2)/(N − 1))·V_{N−2}·‖w‖/δ^{1/2}·(1 + O_N(min{1, ‖w‖²/δ})), and J(w, z) = (4(N − 2)/N)·V_{N−2}/δ^{1/2}·(1 + O_N(min{1, (‖w‖ + ‖z‖)²/δ})).

*Hypotheses.*

- N ≥ 3; the asymptotics are informative when δ is large compared with ‖w‖² (resp. (‖w‖+‖z‖)²).

*Proof sketch.*

1. I: inside w^⊥ the condition |⟨z, t⟩| ≤ ‖t‖ is a band around the hyperplane orthogonal to the component z' of z in w^⊥, with ‖z'‖ = δ^{1/2}/‖w‖; integrate in polar coordinates, the band having angular measure ≍ 1/‖z'‖ with the explicit constant 2V_{N−2}(N−2)/(N−1).
2. J: intersect two such bands; for δ large the intersection is a neighbourhood of the codimension-2 subspace {w, z}^⊥ of angular size ≍ 1/(δ^{1/2}) after the change of variables to an orthonormal basis of span(w, z).

*Checks.*

- When w ⊥ z with ‖w‖ = 1 and ‖z‖ = R large, I ≈ 2(N − 2)V_{N−2}/((N − 1)R).

*Needs:* [`band-section-volumes`](#band-section-volumes); `MeasureTheory.integral_fun_norm_addHaar` (Mathlib).

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), Lemma 4.2, p.27, and Lemma 4.3, p.28 (statements; the proofs were not read and the steps above are a sketch): State the two asymptotic formulas with the displayed constants and error terms.

<a id="weighted-lattice-sums"></a>
#### Primitive and unrestricted weighted lattice sums

`GN.4/weighted-lattice-sums` · definition

For N ≥ 1, an integral lattice Λ ⊆ ℤ^N, a bounded region R ⊆ ℝ^N and an integer k ≥ 0 put S*_k(Λ; R) = Σ_{a ∈ Λ ∩ ℤ^N_prim ∩ R} ‖a‖^{−k} and S_k(Λ; R) = Σ_{a ∈ (Λ ∖ {0}) ∩ R} ‖a‖^{−k}, where ℤ^N_prim is the set of primitive vectors of ℤ^N (gcd of coordinates 1).

*Hypotheses.*

- The sums are finite since R is bounded; primitivity is in ℤ^N, not in Λ.

*Uses.*

- Browning–Le Boudec–Sawin, Lemmas 4.8–4.11, pp.34–47: pair counts D_{d,n}(A, B) are sums of S*_0 over the lattices Γ_{x,y}
- primitive-ball-count (this packet): asymptotic for S*_0 over a ball

*API.*

- `primitiveWeightedSum` (constructor): primitiveWeightedSum Λ R k = Σ over a ∈ Λ with a primitive in ℤ^N and a ∈ R of ‖a‖^{−k}.
- `nonzeroWeightedSum` (constructor): nonzeroWeightedSum Λ R k = Σ over a ∈ Λ ∖ {0} with a ∈ R of ‖a‖^{−k}.
- `primitiveWeightedSum_le` (structure): 0 ≤ primitiveWeightedSum Λ R k ≤ nonzeroWeightedSum Λ R k.
- `primitiveWeightedSum_mono` (structure): Monotone in Λ and in R.
- `nonzeroWeightedSum_zero_eq_card` (simp): nonzeroWeightedSum Λ R 0 = #((Λ ∖ {0}) ∩ R).
- `primitiveWeightedSum_of_not_primitive` (relation): If Λ ⊆ mℤ^N with m ≥ 2 then primitiveWeightedSum Λ R k = 0.

*Unit tests.*

- `primitiveWeightedSum_unit_disc` (computation): primitiveWeightedSum ℤ² (closedBall 0 1) 0 = 4 (the four unit vectors).
- `nonzeroWeightedSum_disc_two` (computation): nonzeroWeightedSum ℤ² (closedBall 0 2) 0 = 12, while primitiveWeightedSum = 8.
- `primitiveWeightedSum_two_lattice` (degenerate): primitiveWeightedSum (2ℤ)² R k = 0.
- `primitive_in_Z_not_in_lattice` (non-example): For Λ = 2ℤ × ℤ, the vector (2, 0) is primitive in Λ but not in ℤ², so it is not counted by primitiveWeightedSum Λ R 0, while (2, 1) is counted: primitivity is taken in ℤ^N.

*Proof sketch.*

1. S_k(Λ; R) = Σ_{m ≥ 1} m^{−k} S*_k(Λ ∩ ..., R/m)-type decompositions hold only for primitive Λ (a ∈ Λ primitive in ℤ^N iff primitive in Λ when Λ is primitive).
2. S*_0(Λ; B̄(T)) counts primitive points; S_0 counts all nonzero points.

*Checks.*

- S*_0(ℤ^2; B̄(1)) = 4 and S_0(ℤ^2; B̄(1)) = 4.
- S*_0(2ℤ^2; R) = 0 for every R.

*Needs:* `Finset.gcd` (Mathlib).

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), §4.5, (4.24) and (4.25), p.34: Defines S*_k and S_k for integral lattices and bounded regions.

<a id="primitive-ball-count"></a>
#### Primitive points of a primitive lattice in a ball

`GN.4/primitive-ball-count` · theorem

Let N ≥ 3, 3 ≤ R ≤ N, Λ ⊆ ℤ^N a primitive lattice of rank R and Y ≥ 1 such that B̄_N(Y) contains R linearly independent vectors of Λ (λ_R(Λ) ≤ Y). For T ≥ Y: S*_0(Λ; B̄_N(T)) = V_R T^R/(ζ(R) det Λ)·(1 + O_R(Y/T)) + O_R(T log(2Y)).

*Hypotheses.*

- Primitive Λ, so primitivity in Λ and in ℤ^N agree; R ≥ 3 makes the Möbius sum converge with a log error.

*Proof sketch.*

1. Möbius inversion over the content: S*_0(Λ; B̄(T)) = Σ_{m ≥ 1} μ(m)·#((Λ ∖ {0}) ∩ B̄(T/m)).
2. For m ≤ T/Y use the ball count with error (band-count with I = 1, v = 0): #(Λ ∩ B̄(T/m)) = V_R(T/m)^R/det Λ·(1 + O(mY/T)); for m > T/Y bound by small-vector-count.
3. Sum: Σ_m μ(m)m^{−R} = 1/ζ(R) with tail O((Y/T)^{R−1}); the error sums give O(Y/T) relative error plus O(T log(2Y)).

*Checks.*

- Λ = ℤ^3, Y = 1: the number of primitive vectors of norm ≤ T is (4π/3)T³/ζ(3) + O(T²) ⊂ the stated form.

*Needs:* [`weighted-lattice-sums`](#weighted-lattice-sums); [`band-count`](#band-count); [`small-vector-count`](#small-vector-count); `ArithmeticFunction.moebius` (Mathlib); `riemannZeta` (Mathlib).

*Source:* Tim Browning, Pierre Le Boudec, Will Sawin (BLS2020), §4.5, proof of Lemma 4.8, p.35, citing Le Boudec, Algebra Number Theory (2018), Lemma 3: Applies the asymptotic S*_0(Γ; B̄(A)) = 8ι(A^{R}/det Γ)(1 + O(µ/A)) + O(A log B) for primitive Γ with λ_R ≤ µ ≤ A, which is this statement with V_R/ζ(R) = 8ι.

### 4.9 Singular symmetric matrices in skewed balls

Bhargava–Shankar–Wang's skew-uniform version of Eskin–Katznelson's bound for integral symmetric matrices of rank r in a dilated and torus-skewed ball. Rank-r matrices are fibred over their saturated row lattices; each fibre is counted inside a lattice of symmetric matrices with an explicit almost reduced basis, and the row lattices are counted by their skewed minima. The statements use the corrected covolume d(γΛ) and keep the full-rank part apart from the spanning lattice.

<a id="symmetric-row-lattices"></a>
#### Symmetric matrices with prescribed row space

`GN.4/symmetric-row-lattices` · definition

Let n ≥ 2 and S = Sym²(n) the real symmetric n×n matrices with the Frobenius Euclidean norm (identify S with ℝ^{n(n+1)/2} so that off-diagonal coordinates carry weight √2; covolumes are taken for this norm). For a lattice Λ ⊆ ℤⁿ of rank r, S(Λ) is the set of B ∈ S(ℤ) whose row space is contained in Λ ⊗ ℝ, and S'(Λ) the lattice it spans; the full-rank part S(Λ)^{full} consists of those B whose row space is all of Λ ⊗ ℝ. For v, w ∈ ℝⁿ put v ∗ w = vwᵀ + wvᵀ if v, w are linearly independent and v ∗ w = vwᵀ otherwise. For s = diag(t_1^{−1}, …, t_n^{−1}) with t_i > 0 and 1 ≤ r < n put C(r, s) = ∏_{1≤i<j≤n, j>n−r} t_i/t_j. SL_n(ℝ) acts on S by γ·A = γAγᵀ.

*Hypotheses.*

- The full-rank subset and the spanning lattice are different objects (PAPER-BHARGAVA-SHANKAR-WANG-25/E18); counts of rank-r matrices fibre over the saturated row lattice.
- C(r, s) is a product over the pairs (i, j) with i < j and j > n − r.
- The diagonal skew matrix s = diag(t_1,…,t_n) has t_i > 0 and ∏_i t_i = 1 (so s ∈ SL_n(ℝ)); uniformity is asserted only for these skews.

*Uses.*

- Bhargava–Shankar–Wang 2025, Theorem 5.3 and Propositions 5.4–5.5, pp.22–23: bases of γ(S'(Λ)) and counts of its points in YD
- Bhargava–Shankar–Wang 2025, §6, (74)–(76), pp.47–48: tail estimates for pairs (A, B) with B singular, summed over row lattices
- ArithmeticStatistics:ST.2 (request for skew-region symmetric-rank counts): the deep-cusp and shallow-cusp tails of BSW II

*API.*

- `symRowLattice` (constructor): symRowLattice Λ = {B : Matrix (Fin n) (Fin n) ℤ | B.IsSymm ∧ ∀ i, (B i) ∈ Λ.span ℝ}, as an additive subgroup.
- `symRowFullRank` (constructor): symRowFullRank Λ = {B ∈ symRowLattice Λ | rank B = finrank Λ}.
- `symStar` (constructor): symStar v w = vecMulVec v w + vecMulVec w v if LinearIndependent ℝ ![v, w], else vecMulVec v w.
- `skewConstant` (data): skewConstant r t = ∏ over i < j with j > n − r of t i / t j.
- `symStar_comm` (simp): symStar v w = symStar w v when v, w are independent; symStar v v = vecMulVec v v.
- `norm_symStar_le` (relation): ‖v‖ * ‖w‖ ≤ ‖symStar v w‖ ≤ 2 * ‖v‖ * ‖w‖ (Frobenius norm).
- `mem_symRowFullRank_saturation` (characterisation): A rank-r integral symmetric B lies in symRowFullRank Λ for exactly one primitive rank-r Λ, its saturated row lattice.
- `smul_symRowLattice` (functoriality): γ • symRowLattice Λ has row spaces in (γ • Λ).span ℝ, for γ ∈ SL_n(ℝ) acting by A ↦ γ A γᵀ.
- `skewConstant_le` (structure): For t_1 ≥ ⋯ ≥ t_n > 0, skewConstant r t ≤ skewConstant (n − 1) t = ∏_{i<j} t_i/t_j.

*Unit tests.*

- `symRowLattice_line` (computation): For n = 2 and Λ = ℤe_1, symRowLattice Λ = {!![b, 0; 0, 0] | b ∈ ℤ}.
- `norm_symStar_e1_e2` (computation): symStar e_1 e_2 = !![0,1;1,0] has Frobenius norm √2, between 1 and 2.
- `skewConstant_trivial` (degenerate): If all t_i = 1 then skewConstant r t = 1.
- `symRowFullRank_ne_span` (non-example): For Λ = ℤ² (n = 2, r = 2 is excluded, so take n = 3, Λ = ℤe_1 ⊕ ℤe_2): diag(1, 0, 0) lies in symRowLattice Λ but not in symRowFullRank Λ, since its rank is 1.

*Proof sketch.*

1. v ∗ w is symmetric with row space in span{v, w} and ‖v‖‖w‖ ≤ ‖v ∗ w‖ ≤ 2‖v‖‖w‖ in the Frobenius norm.
2. Every rank-r integral symmetric matrix has a unique saturated row lattice Λ = rowspace ∩ ℤⁿ, primitive of rank r, and lies in S(Λ)^{full}.
3. γ(S(Λ)) = {γBγᵀ : B ∈ S(Λ)} has row spaces in γΛ ⊗ ℝ.

*Checks.*

- For n = 2, Λ = ℤe_1: S(Λ) = {diag(b, 0) : b ∈ ℤ} = ℤ·e_1 ∗ e_1/1 (here e_1 ∗ e_1 = e_1e_1ᵀ).
- C(n − 1, s) = ∏_{i<j} t_i/t_j.

*Needs:* `Matrix.IsSymm` (Mathlib); `Matrix.rank` (Mathlib); `Matrix.vecMulVec` (Mathlib); `Matrix.frobeniusNormedAddCommGroup` (Mathlib).

*Source:* Manjul Bhargava, Arul Shankar, Xiaoheng Wang (BSW2025), §5, (20)–(24), pp.21–22 (published numbering; (20)–(23) in arXiv v1): Defines S = Sym²(n), the skew balls s(YD), C(r, s), S(Λ), the product v_1 ∗ v_2 and the norm inequality |v||w| ≤ |v ∗ w| ≤ 2|v||w|.

<a id="eskin-katznelson-basis"></a>
#### A reduced basis for the symmetric row lattice

`GN.4/eskin-katznelson-basis` · theorem

Let γ ∈ SL_n(ℝ), Λ ⊆ ℤⁿ primitive of rank r and ℓ_1, …, ℓ_r a basis of γΛ. Then {ℓ_i ∗ ℓ_j : 1 ≤ i ≤ j ≤ r} is a basis of γ(S'(Λ)), and the covolume of γ(S'(Λ)) in its span is 2^{r(r−1)/4}·d(γΛ)^{r+1}, where d(γΛ) is the covolume of γΛ in its span. If {ℓ_i} is almost reduced (∏‖ℓ_i‖ ≪_n d(γΛ)), so is {ℓ_i ∗ ℓ_j}.

*Hypotheses.*

- d(γΛ) ≠ d(Λ) in general: an element of SL_n(ℝ) preserves n-dimensional covolume only (PAPER-BHARGAVA-SHANKAR-WANG-25/E15).
- Almost reduced bases exist (adapted-basis-coordinates).

*Proof sketch.*

1. Choose a ℤ-basis e_1, …, e_r of Λ; S'(Λ) is the image of Sym²(ℤ^r) under X ↦ EXEᵀ, E the n×r matrix of the basis, with basis {e_i ∗ e_j}.
2. Apply γ: γ(e_i ∗ e_j)γᵀ = γe_i ∗ γe_j, and change basis within γΛ.
3. Covolume: the map Sym²(ℝ^r) → S, X ↦ FXFᵀ (F the matrix of ℓ) scales Frobenius covolume by det(FᵀF)^{(r+1)/2} = d(γΛ)^{r+1}; the factor 2^{r(r−1)/4} comes from the √2 weights of the off-diagonal coordinates against the basis vectors ℓ_i ∗ ℓ_j.
4. Almost reducedness: ∏_{i≤j}‖ℓ_i ∗ ℓ_j‖ ≤ 2^{r(r+1)/2}∏_{i≤j}‖ℓ_i‖‖ℓ_j‖ = 2^{…}(∏‖ℓ_i‖)^{r+1} ≪ d(γΛ)^{r+1}.

*Checks.*

- r = 1, Λ = ℤv: S'(Λ) = ℤ·vvᵀ, covolume ‖vvᵀ‖ = ‖v‖² = d(Λ)², matching 2^0 d^2.

*Needs:* [`symmetric-row-lattices`](#symmetric-row-lattices); [`adapted-basis-coordinates`](#adapted-basis-coordinates); `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram`; `ZLattice.covolume` (Mathlib).

*Source:* Manjul Bhargava, Arul Shankar, Xiaoheng Wang (BSW2025), Theorem 5.3, p.22 (published), following Eskin–Katznelson, Duke Math. J. 79 (1995), Proposition 3.3 and Lemma 3.5: States the basis, the covolume formula and the transfer of almost-reducedness; the published text writes the covolume also as 2^{r(r−1)/4}d(Λ)^{r+1}, valid only for γ preserving r-dimensional covolume (E15).

<a id="eskin-katznelson-nonvanishing"></a>
#### Minima conditions for a nonempty count

`GN.4/eskin-katznelson-nonvanishing` · lemma

Let γ ∈ SL_n(ℝ), Λ ⊆ ℤⁿ primitive of rank r with γΛ having successive minima μ_1 ≤ … ≤ μ_r, D ⊆ S(ℝ) bounded and Y > 0. If Y·D ∩ γ(S(Λ)^{full}) ≠ ∅ then μ_iμ_j ≤ c_1Y for all i, j with i + j ≤ r + 1, with c_1 depending on n and D.

*Hypotheses.*

- The nonempty intersection is with the full-rank part: a matrix whose row space is all of γΛ ⊗ ℝ (E18).

*Proof sketch.*

1. Write a full-rank B ∈ YD ∩ γ(S(Λ)) as Σ_{k≤l} b_kl ℓ_k ∗ ℓ_l in an almost reduced basis ℓ of γΛ. If μ_iμ_j > c_1Y for some i + j ≤ r + 1, every basis vector ℓ_k ∗ ℓ_l with k ≥ i, l ≥ j has length ≥ μ_kμ_l > c_1Y, so its coefficient vanishes (almost-reducedness bounds |b_kl| by ‖B‖/‖ℓ_k ∗ ℓ_l‖ up to a constant).
2. Then the Gram matrix of B in the basis ℓ has a zero block in rows i..r and columns j..r, of total size (r − i + 1) + (r − j + 1) ≥ r + 1 > r, so B has rank < r, a contradiction. 
3. The pigeonhole on the anti-diagonal i + j = r + 1 is Eskin–Katznelson's Lemma 4.1.

*Checks.*

- r = 1: the condition is μ_1² ≤ c_1Y, i.e. the generator of γΛ has ‖v‖² ≪ Y.

*Needs:* [`eskin-katznelson-basis`](#eskin-katznelson-basis); [`adapted-basis-coordinates`](#adapted-basis-coordinates).

*Source:* Manjul Bhargava, Arul Shankar, Xiaoheng Wang (BSW2025), Proposition 5.4, p.22 (published), following Eskin–Katznelson Lemma 4.1: If the count is positive then µ_iµ_j ≤ c_1Y for i + j ≤ r + 1.

<a id="row-lattice-matrix-count"></a>
#### Counting symmetric matrices with a fixed row lattice

`GN.4/row-lattice-matrix-count` · theorem

Let γ ∈ SL_n(ℝ), Λ ⊆ ℤⁿ primitive of rank r with γΛ having minima μ_1 ≤ … ≤ μ_r, D ⊆ S(ℝ) bounded and Y ≥ 1. Then #(Y·D ∩ γ(S(Λ)^{full})) ≪_{n,D} (Y^{r(r+1)/2}/d(γΛ)^{r+1})·∏_{1≤i<j≤r, i+j≤r+1} μ_j/μ_i.

*Hypotheses.*

- The denominator is d(γΛ)^{r+1}, not d(Λ)^{r+1} (E15).
- Counting is over the full-rank part; the spanning lattice S'(Λ) is used only for the lattice-point bound.

*Proof sketch.*

1. By bounded-domain-count and eskin-katznelson-basis, the count in S'(Λ) is ≪ (Y^{r(r+1)/2}/d(γΛ)^{r+1})·∏_{(i,j)∈U(r)}(Y/(μ_iμ_j))^{−1}, U(r) = {i ≤ j, i + j > r + 1} (the minima of γ(S'(Λ)) above Y).
2. If the full-rank count is positive, eskin-katznelson-nonvanishing gives μ_{r+1−j}μ_j ≪ Y, and the injection (i, j) ↦ (r + 1 − j, i) of U(r) into {k < l, k + l ≤ r + 1} turns the product into ∏ μ_j/μ_i over the stated pairs.

*Checks.*

- r = 1: the bound is Y/d(γΛ)² = Y/μ_1², the count of b with |b|μ_1² ≪ Y.

*Needs:* [`eskin-katznelson-basis`](#eskin-katznelson-basis); [`eskin-katznelson-nonvanishing`](#eskin-katznelson-nonvanishing); [`bounded-domain-count`](#bounded-domain-count).

*Source:* Manjul Bhargava, Arul Shankar, Xiaoheng Wang (BSW2025), Proposition 5.5 and proof, (25)–(26), pp.22–23 (published): States the bound with d(Λ)^{r+1} in the denominator; the correct quantity is d(γΛ)^{r+1} (PAPER-BHARGAVA-SHANKAR-WANG-25/E15, confirmed).

<a id="skew-row-lattice-count"></a>
#### Counting row lattices with prescribed skew minima

`GN.4/skew-row-lattice-count` · theorem

Let n ≥ 2, 1 ≤ r < n, s = diag(t_1^{−1}, …, t_n^{−1}) with t_1 ≥ c t_2 ≥ ⋯ (s in the Siegel torus T′: t_i ≫ t_{i+1}) and L = (L_1, …, L_r) with 0 < L_1 ≤ ⋯ ≤ L_r. Let Σ(L, s) be the set of primitive Λ ⊆ ℤⁿ of rank r whose minima μ_i of s^{−1}Λ satisfy L_i ≤ μ_i < 2L_i. (a) If Σ(L, s) ≠ ∅ then L_i t_j^{−1} > c' for all i + j ≥ n + 1, with c' depending only on n. (b) #Σ(L, s) ≪_n (L_1⋯L_r)^n·∏_{1≤i<j≤r}(L_i/L_j)·C(r, s).

*Hypotheses.*

- The ordering t_1 ≫ ⋯ ≫ t_n is part of the hypothesis (s ∈ T′).
- The diagonal skew matrix s = diag(t_1,…,t_n) has t_i > 0 and ∏_i t_i = 1 (so s ∈ SL_n(ℝ)); uniformity is asserted only for these skews.

*Proof sketch.*

1. (a) A basis ℓ_1, …, ℓ_r of Λ with |s^{−1}ℓ_i| < 2L_i has integral entries u_ij with |u_ij| ≤ 2L_it_j^{−1}. If L_kt_{n+1−k}^{−1} < c'' for some k and a small c'', then |u_ij| < 1, so u_ij = 0, for all i ≤ k and j ≤ n + 1 − k (L_it_j^{−1} ≪ L_kt_{n+1−k}^{−1} there); thus ℓ_1, …, ℓ_k lie in the (k − 1)-dimensional span of e_{n+2−k}, …, e_n, contradicting independence.
2. (b) Count r-tuples (ℓ_1, …, ℓ_r) in s^{−1}ℤⁿ with L_i ≤ |ℓ_i| < 2L_i forming a reduced basis: for each i the coordinates j ≤ α(i) (with L_i t_{α(i)}^{−1} ≤ c') vanish, and bounded-domain-count bounds the choices of ℓ_i in the remaining coordinates; (a) gives α(i) ≤ n − i; multiply and compare with C(r, s).

*Checks.*

- s = 1 (all t_i = 1): (b) reads #Σ ≪ (L_1⋯L_r)^n∏(L_i/L_j), the count of primitive rank-r lattices with minima ≍ L_i (compare primitive-lattice-minima-count).

*Needs:* [`bounded-domain-count`](#bounded-domain-count); [`symmetric-row-lattices`](#symmetric-row-lattices); [`adapted-basis-coordinates`](#adapted-basis-coordinates).

*Source:* Manjul Bhargava, Arul Shankar, Xiaoheng Wang (BSW2025), Lemma 5.6, Proposition 5.7 and proofs, (27)–(28), pp.23–24 (published; Lemma 5.6 and (27) in arXiv v1): Lemma 5.6 gives the condition L_it_j^{−1} > c′ for i + j ≥ n + 1; Proposition 5.7 bounds #Σ(L, s).

<a id="skew-singular-symmetric-count"></a>
#### Singular integral symmetric matrices in skewed balls

`GN.4/skew-singular-symmetric-count` · theorem

Let n ≥ 2, 1 ≤ r < n, Θ > 0, D ⊆ S(ℝ) bounded, Y ≥ 2 and s = diag(t_1^{−1}, …, t_n^{−1}) ∈ T′ with t_1 ≤ C·Y^Θ and t_n ≥ c·Y^{−Θ}. Let N_r(Y, s) = #(s(Y·D) ∩ S(ℤ)^{(r)}), S(ℤ)^{(r)} the integral symmetric matrices of rank exactly r. Then N_r(Y, s) ≪_{n,Θ,D} C(r, s)·Y^{nr/2}·(log Y)^r, uniformly in s.

*Hypotheses.*

- The endpoint constraints t_1 ≪ Y^Θ, t_n ≫ Y^{−Θ} make the number of dyadic ranges O((log Y)^r).
- The diagonal skew matrix s = diag(t_1,…,t_n) has t_i > 0 and ∏_i t_i = 1 (so s ∈ SL_n(ℝ)); uniformity is asserted only for these skews.

*Proof sketch.*

1. Fibre the rank-r matrices by their saturated row lattice Λ (symmetric-row-lattices): N_r(Y, s) = Σ_Λ #(Y·D ∩ s^{−1}(S(Λ)^{full})) after transporting by γ = s^{−1}.
2. Decompose the Λ dyadically by the minima of s^{−1}Λ (sets Σ(L, s)); eskin-katznelson-nonvanishing and skew-row-lattice-count (a) confine L to O((log Y)^r) dyadic boxes.
3. For each box combine row-lattice-matrix-count with d(s^{−1}Λ) ≍ L_1⋯L_r and skew-row-lattice-count (b); the product telescopes to C(r, s)Y^{nr/2}.

*Checks.*

- s = 1: N_r(Y, 1) ≪ Y^{nr/2}(log Y)^r, the Eskin–Katznelson upper bound for rank-r symmetric matrices of norm ≤ Y.
- The restriction Y ≥ 2 avoids a vanishing (log Y)^r as Y decreases to 1 while a fixed nonzero integral singular matrix can remain in the region.

*Needs:* [`row-lattice-matrix-count`](#row-lattice-matrix-count); [`skew-row-lattice-count`](#skew-row-lattice-count); [`eskin-katznelson-nonvanishing`](#eskin-katznelson-nonvanishing); [`symmetric-row-lattices`](#symmetric-row-lattices).

*Source:* Manjul Bhargava, Arul Shankar, Xiaoheng Wang (BSW2025), Theorem 5.1, p.21, and its proof, pp.24–25 (published): States N_r(Y, s) = O(C(r, s)Y^{nr/2} log^r Y) uniformly for s ∈ T′ with t_1 ≪ Y^Θ, t_n ≫ Y^{−Θ}; proved by summing Proposition 5.5 over dyadic ranges using Proposition 5.7.

### 4.10 Planar domains with curvature

Lattice-point counts in planar convex domains whose boundary has nonvanishing curvature, uniform in integer translates and scalings, as Khayutin's sieve and the large-sieve consumers need them.

<a id="curvature-lattice-class"></a>
#### Planar domains with a curvature-controlled lattice count

`GN.4/curvature-lattice-class` · definition

A C² convex planar domain is a compact convex E ⊆ ℝ² with nonempty interior whose boundary is a C² curve of nowhere vanishing curvature; A(E) is its area and R_max(E) the maximum radius of curvature of ∂E. For C > 0 and θ > 0, L(C, θ) is the class of C² convex planar domains E such that for every integer a ≥ 1 and every x₀ ∈ ℤ² with A(E) ≥ a²: |#(a^{−1}(E − x₀) ∩ ℤ²) − a^{−2}A(E)| ≤ C·(R_max(E)/a)^θ. An exponent θ is admissible (for integral binary forms) if some C makes every ellipse {Q ≤ X}, Q a positive definite integral binary quadratic form and X > 0, belong to L(C, θ).

*Hypotheses.*

- The estimate is uniform over integer translates x₀ and integer scalings a, as the sieve applications require.
- Ellipses of definite integral binary forms have analytic boundary of nonzero curvature.

*Uses.*

- Khayutin 2019, Theorem 9.7 and Propositions 10.10–10.15, pp.70–98: sieved upper bounds for representation numbers in ellipses use an admissible exponent
- SieveMethodsAndPrimePatterns:SV.1–SV.2 (request for the L(C_l, θ_l) input): binary convex large sieve and power-level sieves

*API.*

- `IsC2ConvexDomain` (constructor): IsC2ConvexDomain E: E compact convex with nonempty interior and C² boundary of nonvanishing curvature, with radiusOfCurvatureMax E.
- `CurvatureLatticeClass` (constructor): CurvatureLatticeClass C θ E ↔ IsC2ConvexDomain E ∧ ∀ a : ℕ, 1 ≤ a → ∀ x₀ : ℤ × ℤ, (a:ℝ)^2 ≤ area E → |#((a⁻¹ • (E − x₀)) ∩ ℤ²) − area E / a^2| ≤ C * (radiusOfCurvatureMax E / a)^θ.
- `IsAdmissibleExponent` (constructor): IsAdmissibleExponent θ ↔ ∃ C > 0, ∀ Q positive definite integral binary form, ∀ X > 0, CurvatureLatticeClass C θ {v | Q v ≤ X}.
- `CurvatureLatticeClass.mono` (structure): For θ ≤ θ′ and C′ ≥ C·π^{(θ′−θ)/2}, CurvatureLatticeClass C θ E implies CurvatureLatticeClass C′ θ′ E.
- `IsAdmissibleExponent.mono` (structure): θ ≤ θ' → IsAdmissibleExponent θ → IsAdmissibleExponent θ'.
- `radiusOfCurvatureMax_ellipse` (simp): For Q = ax² + bxy + cy² positive definite and X > 0 the maximal radius of curvature of {Q ≤ X} is an explicit algebraic function of a, b, c, X, ≍ X^{1/2}.

*Unit tests.*

- `curvatureClass_disc_translate` (computation): For E the closed disc of radius 1 centred at 0 and a = 1, x₀ = 0, the count is 5 and A(E) = π; |5 − π| ≈ 1.86 must be ≤ C·1^θ, forcing C ≥ 1.86.
- `curvatureClass_small_area` (degenerate): If A(E) < a² the condition imposes nothing for that a.
- `square_not_C2` (non-example): The unit square is not IsC2ConvexDomain, so it is in no class L(C, θ); its lattice error is of order the perimeter, not (R/a)^θ.
- `isAdmissible_mono_test` (characterisation): IsAdmissibleExponent (3/4) follows from IsAdmissibleExponent (2/3 + 1/100).

*Proof sketch.*

1. Membership is a uniform family of lattice counts for the dilates a^{−1}(E − x₀), equivalently counts of the lattice aℤ² + x₀ in E.
2. For θ′ ≥ θ, A(E) ≤ πR_max(E)² gives R_max(E)/a ≥ π^{−1/2}. Thus L(C,θ) ⊆ L(C·π^{(θ′−θ)/2},θ′). One may then increase C further; the constant cannot in general be left unchanged.

*Checks.*

- Every disc of radius ρ has R_max = ρ and lies in L(C, 2/3) for an absolute C (van der Corput).
- A square is not C² convex in this sense (curvature vanishes on its sides), so it is not in any L(C, θ).

*Needs:* `Convex` (Mathlib); `IsCompact` (Mathlib).

*Source:* Ilya Khayutin (Khayutin2019), §9, the class L(C_l, θ_l) before Remark 9.5, p.69, and Definition 10.8, p.90 (arXiv:1710.04557v3): Defines L(C_l, θ_l) by the uniform count over integer translates and scalings and calls θ_l admissible when all ellipses of definite integral binary forms lie in L(C_l, θ_l). Aleksandar Ivić, Ekkehard Krätzel, Manfred Kühleitner, Werner Georg Nowak (IKKN2004), §3.1, pp.9–10 (arXiv:math/0410522): Fixes the curvature conventions (class C^k boundaries, r_min, r_max) for plane convex domains.

<a id="van-der-corput-planar-count"></a>
#### Van der Corput's bound for C² convex domains

`GN.4/van-der-corput-planar-count` · theorem

There is an absolute constant C such that for every C² convex planar domain E (nonvanishing curvature, maximal radius of curvature r_max), every real x ≥ 1 and every translate: |#(x·E ∩ ℤ²) − x²A(E)| ≤ C(1 + r_max·x)^{2/3}. Consequently, for every ε > 0 every C² convex domain lies in L(C_ε, 2/3 + ε) for some C_ε, and every θ > 2/3 is admissible.

*Hypotheses.*

- The constant is absolute (Chaix's form); translates are covered since the hypotheses are translation-invariant.

*Proof sketch.*

1. Cut ∂(xE) into arcs on which the boundary is a graph y = f(t) with |f''| ≍ 1/(r x) bounded above and below; the count in each vertical strip is Σ_t (⌊f(t)⌋ − …) and the error is Σ ψ(f(t)) with ψ the sawtooth.
2. Van der Corput's second-derivative test bounds Σ_{t∈I} ψ(f(t)) ≪ |I|λ^{1/3} + λ^{−1/2} with λ ≍ 1/(r_max x) the size of f''; summing over O(1) arcs of length ≪ r_max x gives (r_max x)^{2/3}.
3. The class statement: with x = 1/a after translating by x₀, (R_max/a)^{2/3} ≥ 1 when A(E) ≥ a², so the additive 1 is absorbed.

*Checks.*

- The circle of radius √X: the error is O(X^{1/3}), the classical Gauss circle exponent of van der Corput.
- Jarník's convex curves show the exponent 2/3 cannot be improved for general C² domains.

*Needs:* [`curvature-lattice-class`](#curvature-lattice-class); `Int.fract` (Mathlib).

*Source:* Aleksandar Ivić, Ekkehard Krätzel, Manfred Kühleitner, Werner Georg Nowak (IKKN2004), §3.1, 'Van der Corput's estimate', p.9 (arXiv:math/0410522): States P(x; CD₂) ≪ x^{2/3} for C² boundaries, Chaix's form |P| ≤ C(1 + r_max x)^{2/3} with absolute C, Krätzel's explicit constants, and Jarník's optimality. Ilya Khayutin (Khayutin2019), Remark 9.5, p.69: Deduces from van der Corput's bound that every C² convex domain lies in L(C_l, 2/3 + ε).

<a id="huxley-planar-count"></a>
#### Huxley's bound for C³ convex domains

`GN.4/huxley-planar-count` · theorem

For every C³ convex planar domain E (boundary of class C³ with nonvanishing curvature) there is C_E such that |#(x·E ∩ ℤ²) − x²A(E)| ≤ C_E·x^{131/208}(log x)^{18637/8320} for x ≥ 2. For ellipses the constant can be taken uniform in the form after normalising the radius of curvature, so every θ > 131/208 is admissible.

*Hypotheses.*

- C³ boundary; the uniformity for ellipses of integral forms is what admissibility requires.

*Proof sketch.*

1. The proof is Huxley's discrete Hardy–Littlewood method (Bombieri–Iwaniec–Huxley) for the sawtooth sums Σψ(f(t)), with first and second spacing problems for resonance curves. The method is not decomposed here; see the gap 'Huxley exponent-sum method'.

*Checks.*

- The circle: P(x) ≪ x^{131/208+ε}, 131/208 ≈ 0.6298 < 2/3.

*Needs:* [`curvature-lattice-class`](#curvature-lattice-class); [`van-der-corput-planar-count`](#van-der-corput-planar-count).

*Source:* Aleksandar Ivić, Ekkehard Krätzel, Manfred Kühleitner, Werner Georg Nowak (IKKN2004), §3.1, 'Huxley's estimate', p.10: States Huxley's 1993 bound x^{46/73} for C³ boundaries and his 2003 improvement x^{131/208}(log x)^{18637/8320}. Ilya Khayutin (Khayutin2019), Remark 9.5, p.69 (citing Huxley 2003, Proposition 5 and Theorem 5): Deduces that all ellipses belong to L(C_l, 131/208 + ε).

<a id="admissible-ellipse-exponents"></a>
#### Admissible lattice-count exponents for ellipses

`GN.4/admissible-ellipse-exponents` · application

Every θ > 2/3 is admissible in the sense of curvature-lattice-class, and every θ > 131/208 is admissible.

*Hypotheses.*

- Admissibility quantifies over all positive definite integral binary forms and all scales.

*Proof sketch.*

1. Ellipses {Q ≤ X} are C^∞ convex domains with nonvanishing curvature; apply van-der-corput-planar-count (θ > 2/3) and huxley-planar-count (θ > 131/208).
2. Uniformity in Q: after an integral change of variables bringing Q to reduced form the ratio R_max²/A(E) is bounded below, and the constants depend only on the normalised shape, which van der Corput's bound with absolute constant handles directly.

*Checks.*

- θ = 0.7 is admissible; θ = 0.64 is admissible by Huxley.

*Needs:* [`van-der-corput-planar-count`](#van-der-corput-planar-count); [`huxley-planar-count`](#huxley-planar-count); [`curvature-lattice-class`](#curvature-lattice-class).

*Source:* Ilya Khayutin (Khayutin2019), Definition 10.8 and the sentence after it, p.90: Any θ_l > 2/3 is admissible by van der Corput and any θ_l > 131/208 by Huxley.

### 4.11 Explicit counts in applications

Counts in explicit regions used by Ghosh–Sarnak for Markoff-type surfaces, with the corrected constant 1/48, and the Blomer–Granville bound for pairs of representations.

<a id="markoff-fibre-count"></a>
#### Points of a Markoff level set with a fixed first coordinate

`GN.4/markoff-fibre-count` · lemma

For integers a with 3 ≤ a ≪ K^{1/3}, let N_a(K) be the number of integer pairs (m, n) with a ≤ m ≤ n and a² + m² + n² + amn ≤ K. Then N_a(K) = log((√(a−2) + √(a+2))/2)·(K − a²)/√(a² − 4) − E_a(K) + O(√K), where E_a(K) = ((K − a²)/a)·(U√(1 + U²) + arsinh U − U²) with U = a²/(2√(K − a²)) accounts for the excluded strip 0 ≤ m < a; E_a(K) ≍ a√K for a ≤ K^{1/4}.

*Hypotheses.*

- The region is a piece of the interior of a hyperbola-type conic in the (m, n)-plane; the constant in O(√K) is absolute.

*Proof sketch.*

1. The inequality defines an ellipse-like region {m² + n² + amn ≤ K − a²} which for a ≥ 3 is the region between two lines of a hyperbola; restrict to a ≤ m ≤ n.
2. Count lattice points by columns: for each m the n-range is an interval of explicit length; sum with error O(1) per column and O(√K) columns.
3. Integrate the column lengths: the full sector gives the log term and the strip 0 ≤ m < a gives E_a(K).

*Checks.*

- a = 3, K large: the main term is log((1 + √5)/2)·(K − 9)/√5.

*Needs:* [`davenport-principle`](#davenport-principle).

*Source:* Amit Ghosh, Peter Sarnak (GS2022), §7, Lemma 7.1, pp.21–22 (arXiv:1706.06712v3): States the count with main term log[(√(a−2)+√(a+2))/2](K − a²)/√(a²−4) + O(√K); the strip correction E_a(K) is missing in the source (PAPER-GHOSH-SARNAK-22/E1, confirmed).

<a id="markoff-fundamental-set-count"></a>
#### Counting points in the Markoff fundamental sets

`GN.4/markoff-fundamental-set-count` · theorem

Let R⁺(K) = #{(x₁, x₂, x₃) ∈ ℤ³ : 3 ≤ x₁ ≤ x₂ ≤ x₃, x₁² + x₂² + x₃² + x₁x₂x₃ ≤ K} and R⁻(K) = #{(x₁, x₂, x₃) ∈ ℤ³ : 3 ≤ x₁ ≤ x₂ ≤ x₃ ≤ x₁x₂/2, 1 ≤ x₁x₂x₃ − x₁² − x₂² − x₃² ≤ K}. Then R^±(K) = (1/48)K(log K)² + O(K log K).

*Hypotheses.*

- The constant is 1/48 for both signs (corrected from the printed 1/36 for R⁺).

*Proof sketch.*

1. Sum markoff-fibre-count over 3 ≤ a ≤ K^{1/3} (the condition a ≤ m ≤ n forces a³ ≲ K). The main terms are (1/2)(log a)K/a·(1 + O(1/a)), and Σ_{a≤K^{1/3}}(K/2)(log a)/a = (K/4)(log K^{1/3})² + O(K log K) = K(log K)²/36 + O(K log K).
2. The strip corrections are O(a√K) for a ≤ K^{1/4} (in total Σ_{a≤K^{1/4}} a√K = O(K)) and (K/a)(log(a²/√K) + O(1)) for K^{1/4} ≤ a ≤ K^{1/3}; with u = log a their sum is K∫_{L/4}^{L/3}(2u − L/2)du + O(K log K) = K(log K)²/144 + O(K log K), L = log K. Hence R⁺(K) = K(log K)²(1/36 − 1/144) = K(log K)²/48 + O(K log K).
3. R⁻ is treated by the analogous column count for the region 1 ≤ x₁x₂x₃ − Σx_i² ≤ K with x₃ ≤ x₁x₂/2.

*Checks.*

- The two counts have the same main term.

*Needs:* [`markoff-fibre-count`](#markoff-fibre-count).

*Source:* Amit Ghosh, Peter Sarnak (GS2022), §7, Lemmas 7.2–7.3, p.22: States R⁺(K) = (1/36)K(log K)² + O(K log K) and R⁻(K) = (1/48)K(log K)² + O(K log K); the reviewed extraction re-derived 1/48 for both (PAPER-GHOSH-SARNAK-22/E1, confirmed).

<a id="blomer-granville-representation-bound"></a>
#### Blomer–Granville bound for pairs of representations

`GN.4/blomer-granville-representation-bound` · theorem

UNRESOLVED TARGET (not an established bound). For K ≥ 2 and 1 ≤ d ≤ K, determine hypotheses under which the number of (s₁,s₂,t₁,t₂) ∈ ℤ⁴ with s₁² + d t₂² = s₂² + d t₁², |s_j| ≤ √K and |t_j| ≤ √(K/d) is ≪ K/√d + K(log K)τ(d)/d. The original assertion for unrestricted d ≥ 1 is false. A valid restricted statement and derivation from the primary source are required.

*Hypotheses.*

- At least a restriction on d relative to K is necessary. No claim is made here that d ≤ K alone suffices.
- Blomer–Granville Theorem 2 is about fundamental discriminants and contains additional error terms; a proof must explain the passage to the required possibly nonfundamental d.

*Proof sketch.*

1. For fixed K = 2 and d → ∞, take t₁ = t₂ = 0 and s₁ = ±s₂. The count is positive while the proposed right-hand side tends to zero (τ(d)/d → 0). This disproves the unrestricted statement.
2. GS Lemma 9.5 uses the bound in its own restricted parameter regime. Derive that version with its exact range; a factorisation and the words divisor counting do not establish the asserted uniform estimate.

*Checks.*

- d = 1: the bound K + K log K matches the count of (s, t) pairs with s₁² − s₂² = t₁² − t₂².
- Keep the diagonal family t₁=t₂=0 in every parameter test; it cannot be absorbed by a right-hand side tending to zero for fixed K.

*Needs:* `ArithmeticFunction.sigma` (Mathlib).

*Source:* Amit Ghosh, Peter Sarnak (GS2022), Proof of Lemma 9.5, p.29, citing Blomer–Granville, Duke Math. J. 135 (2006), Theorem 2: Quotes a representation-pair estimate inside the restricted regime of Lemma 9.5; it does not justify the packet’s former assertion for arbitrary d ≥ 1. Valentin Blomer, Andrew Granville (BG2006), §1.1 pp.2–3; Theorem 2 p.5: A second-moment theorem under the fundamental-discriminant convention, with additional error terms. The required reduction and parameter range remain unresolved.

### 4.12 Transference, covering and Construction A

A transference inequality for all indices with Minkowski's constant, proved completely from Minkowski's second theorem; covering from a lower bound on the dual lattice in the sup norm, as Kronecker's approximation theorem uses it; and the minimal norm of a Construction A lattice.

<a id="transference-minkowski-constant"></a>
#### Transference with Minkowski's constant

`GN.4/transference-minkowski-constant` · theorem

Let L be a full lattice in an n-dimensional real inner-product space (n ≥ 1) with polar (inner dual) L*, λ_1 ≤ … ≤ λ_n the successive minima of L and λ*_1 ≤ … ≤ λ*_n those of L* for the closed unit ball B. Then 1 ≤ λ_iλ*_{n+1−i} ≤ c(n) for every i, with c(n) = 4ⁿ/vol(B)².

*Hypotheses.*

- Euclidean ball on both sides; the constant is weaker than Banaszczyk's n (dual-transference-upper) but the proof is complete from Minkowski's second theorem.

*Proof sketch.*

1. Lower bound: dual-transference-lower (for every j, λ_jλ*_{n+1−j} ≥ 1).
2. Minkowski's second theorem for L and L* (GN.1 minkowski-second-upper) with covol(L)covol(L*) = 1 (GN.0 covolume-dual): ∏_j λ_j·∏_j λ*_j ≤ 4ⁿ/vol(B)².
3. Hence λ_iλ*_{n+1−i} = ∏_j(λ_jλ*_{n+1−j}) / ∏_{j≠i}(λ_jλ*_{n+1−j}) ≤ 4ⁿ/vol(B)², the denominator being ≥ 1.

*Checks.*

- L = ℤⁿ: all minima are 1 and the products equal 1.
- n = 1, L = aℤ: λ_1λ*_1 = a·a^{−1} = 1 ≤ 4/2² = 1, equality.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-lower`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-dual`.

*Source:* Jan-Hendrik Evertse (EvertseGeometry), §2.4, Theorem 2.20, its remark and proof, printed pp.32–33: Proves 1 ≤ λ_iλ*_{n+1−i} ≤ c(n) and notes that Minkowski's second theorem gives c(n) = 4ⁿvol(Bⁿ)^{−2}.

<a id="max-norm-covering"></a>
#### Covering from a lower bound on the dual lattice

`GN.4/max-norm-covering` · theorem

Let L be a full lattice in ℝⁿ (n ≥ 1) with polar L* = {y : ⟨y, x⟩ ∈ ℤ for all x ∈ L}, and R > 0. (a) If ‖y‖₂ ≥ R for every nonzero y ∈ L*, then every b ∈ ℝⁿ has some x ∈ L with ‖x − b‖₂ ≤ n/R. (b) If ‖y‖_∞ ≥ R for every nonzero y ∈ L*, then every b has some x ∈ L with ‖x − b‖_∞ ≤ ‖x − b‖₂ ≤ n/R. In terms of a basis matrix B (L = Bℤⁿ, L* = (Bᵀ)^{−1}ℤⁿ) the constant n depends only on n.

*Hypotheses.*

- For the same numerical R, the sup-norm lower bound in (b) implies the Euclidean lower bound in (a), since ‖y‖₂ ≥ ‖y‖∞; hence (b) follows directly from (a).

*Proof sketch.*

1. (a) μ(L)·λ_1(L*) ≤ n (covering-dual-transference) and λ_1(L*) ≥ R give μ(L) ≤ n/R; the covering radius is attained (covering-radius).
2. (b) ‖y‖₂ ≥ ‖y‖_∞ ≥ R, so (a) applies; finally ‖x − b‖_∞ ≤ ‖x − b‖₂.
3. Evertse's Corollary 2.21 gives the same with constant n·c(n)/2 from transference-minkowski-constant, without Gaussian sums.

*Checks.*

- L = ℤⁿ, R = 1: every b is within ‖·‖_∞-distance 1/2 ≤ n of ℤⁿ.
- n = 1, L = aℤ, L* = a^{−1}ℤ, R = 1/a: distance a/2 ≤ a.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-dual-transference`; `GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-radius`; [`transference-minkowski-constant`](#transference-minkowski-constant); `LinearMap.BilinForm.dualSubmodule` (Mathlib).

*Source:* Jan-Hendrik Evertse (EvertseGeometry), §2.4, Corollary 2.21 and proof, printed p.33: If every nonzero y ∈ L* has ‖y‖₂ > R then every b is within Euclidean distance n·c(n)/(2R) of L. Oded Regev; scribe Elad Verbin (RegevTransference), Theorem 4, pp.5–6: μ(L)λ_1(L*) ≤ n, the constant used in (a).

<a id="construction-a-minimum"></a>
#### The minimum of a Construction A lattice

`GN.4/construction-a-minimum` · theorem

Let p be prime, n ≥ 1, C ⊆ 𝔽_pⁿ a linear code and L_C = {x ∈ ℤⁿ : x mod p ∈ C} its unscaled Construction A lattice. For c ∈ C let wt_E(c) = Σ_i c̃_i², where c̃_i ∈ ℤ is the representative of c_i with |c̃_i| ≤ p/2 (the Euclidean weight). Then min{‖x‖² : x ∈ L_C ∖ {0}} = min(p², min_{c ∈ C∖{0}} wt_E(c)) (with the second term omitted for C = 0). For p = 2, wt_E is the Hamming weight, so the minimal norm is min(4, d(C)).

*Hypotheses.*

- The real realisation is the one of construction-a-real-lattice-interface (scale 1); the rescaled lattice p^{−1/2}L_C has minimal norm divided by p.

*Proof sketch.*

1. If x ∈ L_C is nonzero with x ∈ pℤⁿ then ‖x‖² ≥ p², attained by pe_1.
2. Otherwise c = x mod p ≠ 0 and |x_i| ≥ |c̃_i| coordinatewise, so ‖x‖² ≥ wt_E(c); the lift (c̃_i) itself lies in L_C.
3. For p = 2, c̃_i ∈ {0, 1} and wt_E(c) = wt_H(c).

*Checks.*

- C = 0: L_C = pℤⁿ and the minimal norm is p².
- C = 𝔽_pⁿ: L_C = ℤⁿ and the minimum is 1 = wt_E(e_1).
- The extended Hamming [8,4,4] code over 𝔽₂ gives minimal norm min(4, 4) = 4 (the E₈ lattice scaled by √2).

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.4/construction-a-real-lattice-interface`; `ZMod.valMinAbs` (Mathlib); `ZMod.natAbs_valMinAbs_le` (Mathlib).

*Source:* Jiajie Xue, Brian M. Kurkoski, Emanuele Viterbo (XKV2025), §II, (8)–(9), p.2 (arXiv:2502.10728v1): For a binary linear code the Construction A lattice has volume 2^{n−k} and squared minimum distance min(4, d_c), d_c the minimum Hamming distance, because 2ℤⁿ is contained in the lattice; the general-p statement with Euclidean weights is proved in the steps by the same comparison.

### 4.13 The space of lattices, its measure and its flows

The carrier of the dynamical half of the layer: SL_n(ℝ)/SL_n(ℤ) with its quotient topology, identified with the unimodular lattices, its invariant probability, Mahler's criterion with bounded bases, the diagonal and unipotent flows, the Mautner phenomenon and mixing of noncompact one-parameter flows, including the time-one map of the diagonal flow on X_2 that the metric number theory consumer needs.

<a id="space-of-unimodular-lattices"></a>
#### The space of unimodular lattices

`GN.4/space-of-unimodular-lattices` · construction

For n ≥ 1 let G_n = SL_n(ℝ) with its matrix topology and Γ_n = SL_n(ℤ), embedded in G_n by the entrywise cast. The space of unimodular lattices is X_n = G_n/Γ_n (left cosets gΓ_n) with the quotient topology and its Borel σ-algebra, with the continuous left action h·gΓ_n = hgΓ_n. The map gΓ_n ↦ gℤⁿ (the lattice spanned by the columns of g) is a bijection from X_n onto the set of full lattices in ℝⁿ of covolume 1, equivariant for the linear action of SL_n(ℝ). The right-coset model Γ_n\G_n (lattice spanned by the rows) is identified with X_n by Γ_ng ↦ gᵀΓ_n, a homeomorphism intertwining right multiplication by h with left multiplication by hᵀ.

*Hypotheses.*

- n ≥ 1; X_1 is a point.
- Column convention: g ↦ gℤⁿ; consumers in the row convention compose with the transpose homeomorphism.
- The topology is the quotient topology; on lattices it is the topology of convergence of bases (Chabauty), which agrees with it.

*Uses.*

- ProbabilisticAndMetricNumberTheory:PM.4 (request): concrete SL(2,ℝ)/SL(2,ℤ) quotient, Borel structure and the transpose identification for the row convention
- mahler-compactness (base packet): compactness in the quotient topology
- siegel-mean-value (base packet), siegel-transform: functions on X_n defined by summing over the lattice gℤⁿ
- Kleinbock–Margulis 1998, §5: δ(Λ) and trajectories h(x)ℤ^k in the space of lattices
- Morris, Ratner's theorems, §1.2: orbits of SO(Q)° on SL(3, ℝ)/SL(3, ℤ)

*API.*

- `UnimodularLattices` (constructor): UnimodularLattices n := Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ)).range.
- `UnimodularLattices.toLattice` (projection): toLattice : UnimodularLattices n → Submodule ℤ (Fin n → ℝ), gΓ ↦ span ℤ (columns of g); well defined.
- `UnimodularLattices.toLattice_injective` (extensionality): toLattice is injective.
- `UnimodularLattices.range_toLattice` (characterisation): range toLattice = {L | DiscreteTopology L ∧ IsZLattice ℝ L ∧ ZLattice.covolume L = 1}.
- `UnimodularLattices.toLattice_smul` (functoriality): toLattice (h • x) = (h : Matrix) '' toLattice x as ℤ-submodules.
- `UnimodularLattices.instTopologicalSpace` (instance): Quotient topology; T2, locally compact, second countable; the action of SL_n(ℝ) is continuous.
- `UnimodularLattices.transposeHomeomorph` (equivalence): The homeomorphism from the right quotient Γ\G to G/Γ, Γg ↦ gᵀΓ, intertwining right translation by h with left translation by hᵀ.
- `UnimodularLattices.base` (data): The base point Γ_n with toLattice = ℤⁿ.

*Unit tests.*

- `unimodularLattices_one_subsingleton` (degenerate): UnimodularLattices 1 is a single point.
- `toLattice_base` (computation): toLattice (base) = ℤⁿ, i.e. span ℤ of the standard basis.
- `toLattice_diag` (computation): For n = 2 and t > 0, toLattice (diag(t, t⁻¹)·base) = tℤ × t⁻¹ℤ.
- `toLattice_covolume_one` (compatibility): For every x, ZLattice.covolume (toLattice x) volume = 1.
- `twoZ_not_unimodular` (non-example): 2ℤ² has covolume 4, so it is not in the range of toLattice.

*Proof sketch.*

1. G_n is a locally compact second countable topological group (closed embedding into matrices, Matrix.SpecialLinearGroup.isClosedEmbedding_val) and Γ_n is a discrete subgroup, so X_n is a locally compact Hausdorff space and the quotient map is open.
2. gℤⁿ = g'ℤⁿ iff g⁻¹g' ∈ GL_n(ℤ), and det g = det g' = 1 forces det(g⁻¹g') = 1, i.e. g⁻¹g' ∈ SL_n(ℤ), so the map is injective; it is surjective onto covolume-one lattices because every such lattice has a basis whose matrix has determinant +1 (change the sign of one basis vector if necessary).
3. Transpose: Γ_ng ↦ gᵀΓ_n is well defined since (γg)ᵀ = gᵀγᵀ and Γ_n is transpose-stable; it is a homeomorphism as transpose is continuous and involutive, and (gh)ᵀ = hᵀgᵀ gives the intertwining.

*Checks.*

- X_2 is identified with the unit tangent bundle of the modular surface; the point Γ_2 corresponds to ℤ².
- diag(t, t^{−1})ℤ² leaves every compact set as t → ∞ (mahler-compactness).

*Needs:* `Matrix.SpecialLinearGroup` (Mathlib); `Matrix.SpecialLinearGroup.map` (Mathlib); `Matrix.SpecialLinearGroup.isTopologicalGroup` (Mathlib); `Matrix.SpecialLinearGroup.isClosedEmbedding_val` (Mathlib); `QuotientGroup.mk` (Mathlib); `ZLattice.covolume` (Mathlib); `AdelicAlgebraicGroups:AA.3`.

*Source:* Yves Benoist (Benoist2019), Physical pp.5–7, lattice-space conventions and Mahler's statement: Describes SL_n(ℝ)/SL_n(ℤ) as the space of covolume-one lattices with its invariant probability. Stephen D. Miller (Miller2020), §4, p.10: The space Γ\G of unimodular lattices spanned by the rows of g ∈ SL(n, ℝ), the row convention, with its bi-invariant Haar measure of finite volume. Dave Witte Morris (MorrisRatner), Corollary 4.8.5, printed p.144: SL(ℓ, ℤ) is a lattice in SL(ℓ, ℝ).

<a id="lattice-space-invariant-probability"></a>
#### The invariant probability on the space of lattices

`GN.4/lattice-space-invariant-probability` · construction

For n ≥ 2 there is a unique SL_n(ℝ)-invariant Borel probability measure μ_n on X_n. It is the normalised pushforward of Haar measure restricted to a measurable fundamental domain: for a fundamental domain F of Γ_n in SL_n(ℝ), μ_n(A) = m_G(F ∩ π⁻¹A)/m_G(F), and m_G(F) < ∞ because Γ_n is a lattice.

*Hypotheses.*

- n ≥ 2 (for n = 1 the space is a point and μ_1 is the Dirac mass).
- Uniqueness is among invariant Borel probability measures on the homogeneous space; full Haar measure on G cannot be pushed forward and normalised, since Γ is infinite.

*Uses.*

- ProbabilisticAndMetricNumberTheory:PM.4: normalised invariant Haar probability on SL(2,ℝ)/SL(2,ℤ)
- siegel-mean-value (base packet): the measure μ in Siegel's formula
- homogeneous-mixing (this packet), howe-moore-mixing (base packet): the L² space of the quotient

*API.*

- `latticeSpaceMeasure` (constructor): latticeSpaceMeasure n : Measure (UnimodularLattices n).
- `latticeSpaceMeasure.isProbabilityMeasure` (instance): IsProbabilityMeasure (latticeSpaceMeasure n) for n ≥ 2.
- `latticeSpaceMeasure.smulInvariant` (instance): SMulInvariantMeasure (SL n ℝ) (UnimodularLattices n) (latticeSpaceMeasure n).
- `latticeSpaceMeasure_eq_of_invariant` (extensionality): Every SL_n(ℝ)-invariant Borel probability measure on X_n equals latticeSpaceMeasure n.
- `latticeSpaceMeasure_quotient` (compatibility): The homogeneous-space quotient integral formula for G/Γ_n, with counting Haar measure on Γ_n and μ_n normalised by covolume; this does not assert QuotientMeasureEqMeasurePreimage for a normal subgroup.
- `integral_latticeSpace_eq` (characterisation): ∫ f dμ_n = (1/m_G(F)) ∫_F f(gΓ) dm_G(g) for a measurable fundamental domain F.

*Unit tests.*

- `latticeSpaceMeasure_univ` (degenerate): latticeSpaceMeasure n univ = 1.
- `latticeSpaceMeasure_one` (degenerate): For n = 1 the space is a point and the measure is the Dirac mass.
- `latticeSpaceMeasure_base_null` (computation): The singleton {base} has measure 0 for n ≥ 2.
- `counting_measure_not_invariant` (non-example): For n ≥ 2 the Dirac mass at base is not SL_n(ℝ)-invariant: an embedded diag(2,1/2) moves base.

*Proof sketch.*

1. Use the homogeneous-space quotient integral formula of AdelicAlgebraicGroups AA.2 for the discrete, nonnormal subgroup Γ_n. The Mathlib quotient-group Haar theorem assumes a normal subgroup and is not a provider here.
2. Finite covolume: Siegel sets cover SL_n(ℝ) up to Γ_n and have finite Haar measure (AdelicAlgebraicGroups AA.3, 'S-arithmetic subgroups are lattices' with S = {∞}, or gln-real-reduction); normalise.
3. Uniqueness: a G-invariant Borel probability on G/Γ_n lifts, through a measurable fundamental domain, to a left-invariant Radon measure on G, i.e. a Haar measure, unique up to the scalar fixed by the total mass.

*Checks.*

- μ_2 corresponds, under X_2 ≅ T¹(SL_2(ℤ)\ℍ), to the normalised Liouville measure; the hyperbolic area of the modular surface is π/3.

*Needs:* [`space-of-unimodular-lattices`](#space-of-unimodular-lattices); `MeasureTheory.Measure.haar` (Mathlib); `MeasureTheory.IsFundamentalDomain` (Mathlib); `AdelicAlgebraicGroups:AA.2`; `AdelicAlgebraicGroups:AA.3`.

*Source:* Stephen D. Miller (Miller2020), §4, p.10: Haar measure on SL(n, ℝ) is bi-invariant (no nontrivial characters to ℝ_{>0}) and Γ\G has finite volume. Dave Witte Morris (MorrisRatner), Corollary 4.8.5, printed p.144 (Borel–Harish-Chandra, Theorem 4.8.4): SL(ℓ, ℤ) is a lattice in SL(ℓ, ℝ), so the invariant measure is finite.

<a id="mahler-compactness-sup-norm"></a>
#### Mahler's criterion with the sup norm

`GN.4/mahler-compactness-sup-norm` · lemma

For n ≥ 2 and ε > 0 the set {x ∈ X_n : ‖v‖_∞ ≥ ε for every nonzero v ∈ toLattice x} is compact, and a subset of X_n is relatively compact iff the sup-norm first minimum is bounded below on it by a positive constant. The same holds with ‖·‖_∞ replaced by any norm on ℝⁿ.

*Hypotheses.*

- The equivalence of norms changes ε by a factor depending only on n.

*Proof sketch.*

1. ‖v‖_∞ ≤ ‖v‖₂ ≤ √n‖v‖_∞, so the sup-norm set for ε lies between the Euclidean sets for ε and √n·ε.
2. Apply the Euclidean criterion (mahler-compactness); closedness of the sup-norm set follows from continuity of the sup-norm first minimum on X_n.

*Checks.*

- For n = 2, the set with ε = 1 contains base (ℤ²) and diag(t, 1/t)·base only for t = 1.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness`; [`space-of-unimodular-lattices`](#space-of-unimodular-lattices); `pi_norm_le_iff_of_nonneg'` (Mathlib); `EuclideanSpace.norm_eq` (Mathlib).

*Source:* Yves Benoist (Benoist2019), Fact 1.5, physical p.7: Mahler's criterion: a subset of the space of unimodular lattices is relatively compact iff the norms of nonzero vectors are bounded below.

<a id="mahler-bounded-basis"></a>
#### Bounded bases for lattices without short vectors

`GN.4/mahler-bounded-basis` · lemma

For n ≥ 1 and ε > 0 there is A(n, ε) such that every full lattice L ⊆ ℝⁿ of covolume 1 with λ_1(L) ≥ ε has a ℤ-basis b_1, …, b_n with ‖b_j‖ ≤ A(n, ε) for all j; equivalently L = gℤⁿ with g ∈ SL_n(ℝ) of operator norm ≤ A and ‖g⁻¹‖ ≤ A'(n, ε).

*Hypotheses.*

- Covolume exactly 1 (bounded covolume suffices with A depending on the bound).

*Proof sketch.*

1. Minkowski's second theorem: λ_1⋯λ_n ≤ 2ⁿ/V_n, so λ_n ≤ 2ⁿ/(V_n ε^{n−1}).
2. adapted-basis-coordinates (or GN.1 basis-from-minima) gives a basis with ‖b_j‖ ≤ jλ_j ≤ n·λ_n.
3. The inverse: the rows of g⁻¹ form the dual basis, whose norms are ≤ ∏_{i≠j}‖b_i‖/covol by Cramer and Hadamard.

*Checks.*

- L = ℤⁿ: the standard basis, A = 1.
- L = diag(ε, 1/ε)ℤ²: the basis (ε, 0), (0, 1/ε) has norm 1/ε, consistent with A(2, ε) ≥ 1/ε.

*Needs:* [`adapted-basis-coordinates`](#adapted-basis-coordinates); `GeometryOfNumbersAndQuadraticArithmetic:GN.1/basis-from-minima`; `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`; `GeometryOfNumbersAndQuadraticArithmetic:GN.0/orthonormal-coordinate-hadamard`.

*Source:* Yves Benoist (Benoist2019), Fact 1.5, physical p.7: Mahler's criterion, whose proof reduces to bases bounded in terms of ε. Jan-Hendrik Evertse (EvertseGeometry), §2.3, Exercise 2.8 and Theorem 2.11, printed pp.24–28: Bases adapted to the minima and with product of lengths bounded by the covolume.

<a id="diagonal-and-unipotent-flows"></a>
#### Diagonal and unipotent flows on the space of lattices

`GN.4/diagonal-and-unipotent-flows` · definition

On X_n the diagonal flow of a vector (s_1, …, s_n) with Σ s_i = 0 is a_t·x = diag(e^{s_1t}, …, e^{s_nt})·x, and the unipotent flow of a nilpotent matrix N is u_t·x = exp(tN)·x (t ∈ ℝ). For n = 2, a_t = diag(e^t, e^{−t}), u_t = [[1, t], [0, 1]] and ū_t = [[1, 0], [t, 1]]; they satisfy a_s u_t a_{−s} = u_{e^{2s}t}. The time-one map of a is T(x) = a_1·x.

*Hypotheses.*

- Left action on G/Γ (column convention). In the row convention Γ\G the same flows act on the right; the transpose homeomorphism of space-of-unimodular-lattices exchanges u_t with ū_t.

*Uses.*

- ProbabilisticAndMetricNumberTheory:PM.4: continuous left action of a_t = diag(e^t, e^{−t}) and its time-one map
- mautner-phenomenon, homogeneous-mixing (this packet): the commutation relation and mixing of a_t
- unipotent-nondivergence (base packet), unipotent-quantitative-recurrence: unipotent trajectories

*API.*

- `diagFlow` (constructor): diagFlow s t : SL n ℝ = diag (exp (s i * t)) for s with Σ s = 0.
- `unipotentFlow` (constructor): unipotentFlow N t : SL n ℝ = exp (t • N) for N nilpotent (trace zero).
- `diagFlow_add` (simp): diagFlow s (t + t') = diagFlow s t * diagFlow s t'.
- `unipotentFlow_add` (simp): unipotentFlow N (t + t') = unipotentFlow N t * unipotentFlow N t'.
- `continuous_diagFlow_smul` (structure): (t, x) ↦ diagFlow s t • x is continuous on ℝ × X_n.
- `conj_diagFlow_unipotentFlow` (relation): For n = 2: a_s u_t a_{−s} = u_{e^{2s} t}.
- `measurePreserving_diagFlow` (structure): x ↦ diagFlow s t • x preserves μ_n.
- `timeOne` (data): timeOne s x = diagFlow s 1 • x.

*Unit tests.*

- `diagFlow_zero` (degenerate): diagFlow s 0 = 1.
- `diagFlow_two_base` (computation): For n = 2, toLattice (diagFlow (1, −1) t • base) = e^tℤ × e^{−t}ℤ.
- `conj_relation_test` (computation): For n = 2, a_1 u_1 a_{−1} = u_{e²} as matrices.
- `unipotentFlow_not_diag` (non-example): u_1 is not diagonalisable over ℝ: it differs from the identity but has both eigenvalues 1.

*Proof sketch.*

1. t ↦ a_t and t ↦ u_t are continuous homomorphisms ℝ → SL_n(ℝ) (matrix exponential), so they define continuous flows on X_n preserving μ_n.
2. The commutation relation is a matrix identity.

*Checks.*

- a_t·base for n = 2 is e^tℤ × e^{−t}ℤ.
- u_t·base = ℤ(1, 0) + ℤ(t, 1).

*Needs:* [`space-of-unimodular-lattices`](#space-of-unimodular-lattices); [`lattice-space-invariant-probability`](#lattice-space-invariant-probability); `NormedSpace.exp` (Mathlib); `Matrix.SpecialLinearGroup` (Mathlib).

*Source:* Dave Witte Morris (MorrisRatner), §1.1, the geodesic flow γ_t and horocycle flow η_t on Γ\SL(2, ℝ), and Proposition 3.2.3, printed p.102: The diagonal and unipotent one-parameter subgroups of SL(2, ℝ) with the relation a^{−s}u^ta^{s} = u^{e^{s}t} used in the Mautner phenomenon (row convention, right action). Dmitry Kleinbock, Gregory Margulis (KM1998), §5, Theorem 5.3, p.15 (arXiv:math/9810036): Trajectories u_xΛ of one-parameter unipotent subgroups of SL_k(ℝ).

<a id="mautner-phenomenon"></a>
#### The Mautner phenomenon

`GN.4/mautner-phenomenon` · lemma

Let G be a Lie group, Γ a lattice and μ a probability measure on Γ\G invariant under one-parameter subgroups u_t and a_s with a_{−s}u_ta_s = u_{e^s t}. If f ∈ L²(Γ\G, μ) is essentially a_s-invariant then f is essentially u_t-invariant.

*Hypotheses.*

- Only the commutation relation and invariance of μ under both flows are used.

*Proof sketch.*

1. The unitary operators U_t, A_s of right translation satisfy A_{−s}U_tA_s = U_{e^s t}.
2. If A_sf = f then ‖U_tf − f‖ = ‖A_{−s}U_tA_sf − f‖ = ‖U_{e^st}f − f‖ for all s; letting s → −∞ and using strong continuity of t ↦ U_t gives U_tf = f.

*Checks.*

- G = SL(2, ℝ): the geodesic flow and horocycle flow satisfy the relation.

*Needs:* [`diagonal-and-unipotent-flows`](#diagonal-and-unipotent-flows); `MeasureTheory.Lp` (Mathlib); `MeasureTheory.Lp.compMeasurePreserving` (Mathlib).

*Source:* Dave Witte Morris (MorrisRatner), Proposition 3.2.3 and Corollaries 3.2.4–3.2.5, printed p.102 (arXiv:math/0310402): States the Mautner phenomenon in this form, with the ergodicity consequences for the geodesic flow.

<a id="homogeneous-mixing"></a>
#### Mixing of noncompact one-parameter flows

`GN.4/homogeneous-mixing` · theorem

Let G be a connected simple Lie group with finite centre, Γ a lattice, μ the G-invariant probability measure on Γ\G, and g_t a one-parameter subgroup whose closure is not compact. Then for all φ, ψ ∈ L²(Γ\G, μ): ∫ φ(xg_t)ψ(x) dμ(x) → (∫φ dμ)(∫ψ dμ) as t → ∞. In particular g_t is mixing and ergodic, and so is every time-t₀ map x ↦ xg_{t₀} with t₀ ≠ 0.

*Hypotheses.*

- The limit is the product of the integrals, not of the L² norms (sourceIssue E402).
- G simple (not merely semisimple): for products one must leave every compact set in each factor.

*Proof sketch.*

1. Reduce to φ, ψ in the orthogonal complement ℋ of the constants.
2. For SL₂, follow Morris pp.103–105: a weak limit E of the commuting operators ρ(g_t) is normal because it lies in their abelian von Neumann algebra. Contracting unipotents give ρ(U)E=E and Eρ(V)=E. Thus range(E) is U-fixed and ker(E)⊥ is V-fixed; normality identifies the closures of these ranges. Their intersection consists of G-fixed vectors, so E=0 on the orthogonal complement of constants.
3. For a general simple G, Morris uses Cartan decomposition and the Lie-theoretic generation/contracting subgroup argument. This needs an exact supplier contract; LieGroups Layer 2 alone supplies neither that argument nor decay of matrix coefficients. The former inference from absence of fixed vectors of E to E=0 was invalid. One may instead import the base Howe–Moore theorem, retaining its recorded proof gap.
4. The time-t₀ statement follows by restricting to t ∈ t₀ℕ.

*Checks.*

- G = SL(2, ℝ), Γ = SL(2, ℤ), g_t = diag(e^{t/2}, e^{−t/2}): the geodesic flow on the modular surface is mixing.
- For φ = ψ = 1_A with 0 < μ(A) < 1 the limit is μ(A)², not μ(A).

*Needs:* [`mautner-phenomenon`](#mautner-phenomenon); `GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing`; [`lattice-space-invariant-probability`](#lattice-space-invariant-probability); `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`.

*Source:* Dave Witte Morris (MorrisRatner), Remark 3.2.8, Theorem 3.2.9, Remarks 3.2.10–3.2.12 and proof, printed pp.103–105 (arXiv:math/0310402): States and proves mixing of one-parameter subgroups with noncompact closure on finite-volume quotients of connected simple Lie groups with finite centre; the displayed limit is misprinted as ‖φ‖₂‖ψ‖₂ (E402).

<a id="time-one-mixing-sl2"></a>
#### Mixing of the time-one map of the diagonal flow on X_2

`GN.4/time-one-mixing-sl2` · application

Let T : X_2 → X_2 be x ↦ a_1·x with a_1 = diag(e, e^{−1}). Then T preserves μ_2, is mixing (μ(T^{−k}A ∩ B) → μ(A)μ(B) for all Borel A, B) and hence ergodic.

*Hypotheses.*

- Left action in the column convention; the row-convention statement for x ↦ x·a_1 on Γ\G follows through the transpose homeomorphism.

*Proof sketch.*

1. Transport to the right quotient by space-of-unimodular-lattices (transposeHomeomorph); there a_1 acts by right multiplication by a_1ᵀ = a_1.
2. SL(2, ℝ) is connected and simple with centre {±1} and {a_t} has noncompact closure; apply homogeneous-mixing with t ∈ ℕ to indicator functions.
3. Mixing implies ergodicity (if T⁻¹A = A then μ(A) = μ(A)²).

*Checks.*

- Continuous-flow ergodicity alone would not give ergodicity of T; mixing does.

*Needs:* [`homogeneous-mixing`](#homogeneous-mixing); [`diagonal-and-unipotent-flows`](#diagonal-and-unipotent-flows); [`space-of-unimodular-lattices`](#space-of-unimodular-lattices); [`lattice-space-invariant-probability`](#lattice-space-invariant-probability); `Ergodic` (Mathlib).

*Source:* Dave Witte Morris (MorrisRatner), Theorem 3.2.9, printed p.103: Mixing of one-parameter subgroups with noncompact closure, applied to the geodesic flow on Γ\SL(2, ℝ).

### 4.14 Quantitative nondivergence

Kleinbock–Margulis's quantitative nondivergence for maps into the space of lattices whose covolume functions are good, and its corollary for unipotent trajectories, which strengthens the Dani–Margulis recurrence of the base plan.

<a id="good-functions"></a>
#### (C, α)-good functions

`GN.4/good-functions` · definition

Let V ⊆ ℝ^d and C, α > 0. A continuous f : V → ℝ is (C, α)-good on V if for every open ball B ⊆ V and every ε > 0: |{x ∈ B : |f(x)| < ε}| ≤ C·(ε/‖f‖_B)^α·|B|, where ‖f‖_B = sup_B |f| and |·| is Lebesgue measure (with the convention 1/0 = ∞, so the condition is empty when f vanishes on B).

*Hypotheses.*

- Continuity of f; balls are open Euclidean balls contained in V.
- C > 0 and α > 0. In a real-valued Lean predicate use witnessed positive lower bounds M for sup_B |f|, rather than an unbounded real iSup; require the inequality for every such M. This agrees with the source on bounded balls by approximation to the supremum and also handles unbounded f.

*Uses.*

- Kleinbock–Margulis 1998, Theorem 5.2: hypothesis (i) on the functions ψ_Γ(x) = ‖h(x)Γ‖
- Kleinbock–Margulis 1998, Theorem 5.3: coordinates of h(x)(v_1 ∧ ⋯ ∧ v_j) are polynomials, hence good

*API.*

- `IsGood` (constructor): IsGood C α V f ↔ C>0 ∧ α>0 ∧ ContinuousOn f V ∧ ∀ x r, r>0 → ball x r ⊆ V → ∀ M>0, (∃ y∈ball x r, M≤|f y|) → ∀ ε>0, volume {y∈ball x r | |f y|<ε} ≤ C*(ε/M)^α*volume (ball x r), interpreting the measure inequality in ℝ via toReal on these finite-volume balls.
- `IsGood.abs` (structure): IsGood C α V f ↔ IsGood C α V (|f|).
- `IsGood.const_mul` (structure): IsGood C α V f → IsGood C α V (λ • f).
- `IsGood.iSup` (structure): For a nonempty indexed family of good functions, if the family of absolute values is pointwise bounded above and its supremum is continuous, that supremum is (C,α)-good. Boundedness prevents the real iSup from collapsing on an unbounded family.
- `isGood_polynomial` (example): For k ≥ 1 and p : ℝ[X] with natDegree p ≤ k, IsGood (2*k*(k+1)^(1/k)) (1/k) univ (eval · p).
- `IsGood.mono` (structure): C ≤ C' → IsGood C α V f → IsGood C' α V f.

*Unit tests.*

- `isGood_id` (computation): IsGood 4 1 univ id on ℝ.
- `isGood_zero` (degenerate): For C>0 and α>0, the zero function is (C,α)-good: no positive witnessed M exists on a ball.
- `isGood_square` (computation): x ↦ x² is (2·2·3^{1/2}, 1/2)-good on ℝ (k = 2).
- `not_isGood_flat` (non-example): x ↦ exp(−1/x²) (extended by 0) is not (C, α)-good near 0 for any C, α > 0: its sublevel sets {|f| < ε} contain intervals of length ≍ 1/√log(1/ε).

*Proof sketch.*

1. Closure properties: |f| and λf are (C, α)-good when f is; sup_{i∈I}|f_i| is (C, α)-good when every f_i is.
2. Polynomials: a real polynomial of degree ≤ k in one variable is (2k(k+1)^{1/k}, 1/k)-good on ℝ, by Lagrange interpolation at k + 1 well-separated points where |f| < ε. Here k ≥ 1; degree-zero polynomials can be included by choosing k = 1.

*Checks.*

- f(x) = x on ℝ is (2·2, 1)-good: on B = (−1, 1), |{|x| < ε}| = 2ε = ε·|B|.

*Needs:* `Metric.ball` (Mathlib); `Lagrange.interpolate` (Mathlib).

*Source:* Dmitry Kleinbock, Gregory Margulis (KM1998), §3, (3.1), Lemma 3.1 and Proposition 3.2, p.6 (arXiv:math/9810036): Defines (C, α)-good functions, proves the closure properties and that polynomials of degree ≤ k are (2k(k+1)^{1/k}, 1/k)-good on ℝ.

<a id="quantitative-nondivergence"></a>
#### Kleinbock–Margulis quantitative nondivergence

`GN.4/quantitative-nondivergence` · theorem

Let d, k ≥ 1, r₀ > 0, C, α > 0, 0 < ρ ≤ 1/k, B = B(x₀, r₀) ⊆ ℝ^d a ball, B̃ = B(x₀, 3^k r₀) and h : B̃ → GL_k(ℝ) continuous. For a primitive subgroup Γ of ℤ^k let ψ_Γ(x) = ‖h(x)Γ‖ (the maximum absolute Plücker coordinate of a basis wedge of h(x)Γ, independent of the integral basis; this is not Euclidean covolume). Suppose that for every Γ: (i) ψ_Γ is (C, α)-good on B̃ and (ii) sup_B ψ_Γ ≥ ρ. Then for every 0 < ε ≤ ρ: |{x ∈ B : δ(h(x)ℤ^k) < ε}| ≤ k·C·(3^d N_d)^k·(ε/ρ)^α·|B|, where δ(Λ) is the sup norm of a shortest nonzero vector and N_d is the Besicovitch constant of ℝ^d.

*Hypotheses.*

- N_d depends only on d; Γ ranges over all nonzero primitive subgroups of ℤ^k.

*Proof sketch.*

1. Mark points x ∈ B by flags of primitive subgroups Γ with ψ_Γ(x) small relative to ψ_Γ on balls around x (the poset argument of Kleinbock–Margulis §4).
2. KM §4, Theorem 4.1, pp.9–13, bounds unmarked points by induction on the length of a partially ordered set using bounded-multiplicity Besicovitch covers of prescribed balls. In §5 the primitive-subgroup poset has length k. At a marked point, the wedge inequality (5.1) and a flag augmented by a primitive vector give δ ≥ ε. The AE disjoint-small-ball covering theorem in Mathlib does not supply this covering contract.

*Checks.*

- k = 1: h(x) is a scalar and the statement is the good property of |h| itself.
- Constant h(x) = g: the set is empty or all of B according as δ(gℤ^k) ≥ ε or not, consistent with (ii).

*Needs:* [`good-functions`](#good-functions); [`space-of-unimodular-lattices`](#space-of-unimodular-lattices); `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`.

*Source:* Dmitry Kleinbock, Gregory Margulis (KM1998), §4, Theorem 4.1 and proof, pp.9–13; §5, (5.1), Theorem 5.2 and proof, pp.13–15 (arXiv:math/9810036): States the measure bound k C (3^d N_d)^k (ε/ρ)^α |B| under hypotheses (i)–(ii) on the functions ψ_Γ.

<a id="unipotent-quantitative-recurrence"></a>
#### Quantitative recurrence of unipotent trajectories

`GN.4/unipotent-quantitative-recurrence` · theorem

For every lattice Λ ⊆ ℝ^k there is ρ = ρ(Λ) > 0 such that for every one-parameter unipotent subgroup {u_x} of SL_k(ℝ), every T > 0 and every 0 < ε ≤ ρ: |{0 < x < T : δ(u_xΛ) < ε}| ≤ 2k³·6^k·(k² + 1)^{1/k²}·(ε/ρ)^{1/k²}·T. Consequently, for every x₀ ∈ X_k and η > 0 there is a compact K ⊆ X_k with |{t ∈ [0, T] : u_t x₀ ∉ K}| ≤ ηT for all T > 0.

*Hypotheses.*

- ρ depends on Λ (not on u or T); the compact set in the consequence is uniform in T, which strengthens base unipotent-nondivergence.
- k ≥ 1 and 0 < ε ≤ ρ. The exact source constant uses sup norms for vectors and exterior powers; the same upper bound for the Euclidean short-vector event follows from ‖v‖∞ ≤ ‖v‖₂.

*Proof sketch.*

1. Write Λ = gℤ^k and h(x) = u_xg. For a primitive Γ with basis v_1, …, v_j the coordinates of h(x)(v_1 ∧ ⋯ ∧ v_j) are polynomials of degree ≤ k² in x, hence (2k²(k² + 1)^{1/k²}, 1/k²)-good (good-functions), and so is ψ_Γ.
2. ρ = min(1/k, inf_Γ ‖gΓ‖) > 0 by discreteness of Λ; ψ_Γ(0) ≥ ρ gives (ii) on (0, T).
3. Apply quantitative-nondivergence with d = 1 and N_1 = 2: k·[2k²(k²+1)^{1/k²}]·6^k = 2k³6^k(k²+1)^{1/k²}.
4. The consequence: choose ε with the bound ≤ η and K = {δ ≥ ε}, compact by mahler-compactness-sup-norm (Euclidean version).

*Checks.*

- k = 2, Λ = ℤ², u_x = [[1, x],[0, 1]]: every nonzero vector (p + xq, q) of u_xℤ² has norm ≥ 1 (q ≠ 0 gives |q| ≥ 1, q = 0 gives |p| ≥ 1), so the exceptional set is empty for ε ≤ ρ = 1/2: the periodic horocycle through ℤ² never approaches the cusp.

*Needs:* [`quantitative-nondivergence`](#quantitative-nondivergence); [`good-functions`](#good-functions); `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness`; [`diagonal-and-unipotent-flows`](#diagonal-and-unipotent-flows).

*Source:* Dmitry Kleinbock, Gregory Margulis (KM1998), Theorem 5.3 and proof, p.15 (arXiv:math/9810036): States the bound 2k³6^k(k²+1)^{1/k²}(ε/ρ)^{1/k²}T for unipotent trajectories, as a quantitative strengthening of Dani's theorem. Dave Witte Morris (MorrisRatner), Theorem 1.9.2 (Dani–Margulis), printed p.58: The qualitative recurrence statement for unipotent flows on Γ\G.

### 4.15 Borel density and the Oppenheim auxiliaries

The three auxiliary statements of Margulis's proof of the Oppenheim conjecture through Ratner's orbit closure theorem: the subgroups between SO(2,1)° and SL₃(ℝ), rationality of forms with closed SO(Q)-orbits through Borel density, and the reduction from n ≥ 4 variables to three.

<a id="borel-density"></a>
#### Borel's density theorem

`GN.4/borel-density` · theorem

Let G be a closed subgroup of SL_ℓ(ℝ) and Γ a lattice in G (discrete with G/Γ of finite G-invariant measure). Then the Zariski closure of Γ in SL_ℓ(ℝ) (the common zero set of all polynomial functions in the matrix entries vanishing on Γ) contains every unipotent element and every hyperbolic (diagonalisable over ℝ with positive eigenvalues) element of G.

*Hypotheses.*

- G closed in SL_ℓ(ℝ); no connectedness or semisimplicity is assumed in this form.
- The conclusion concerns unipotent and hyperbolic elements, not all of G.

*Proof sketch.*

1. Let Γ̄ be the Zariski closure; G acts on the space of polynomials of bounded degree and the line of a polynomial vanishing on Γ̄ gives a finite measure on a projective space invariant under the image of G/Γ.
2. For a unipotent or hyperbolic g, the iterates g^m push every point of projective space towards a g-fixed point (polynomial or exponential growth); Poincaré recurrence for the finite invariant measure on G/Γ forces g to fix the relevant points, so g ∈ Γ̄.

*Checks.*

- Γ = SL_ℓ(ℤ) in G = SL_ℓ(ℝ): Γ is Zariski dense.
- A finite group Γ is a lattice only in a compact G, which has no nontrivial unipotent elements: consistent.

*Needs:* `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`; [`lattice-space-invariant-probability`](#lattice-space-invariant-probability); `MeasureTheory.Conservative.ae_mem_imp_frequently_image_mem` (Mathlib).

*Source:* Dave Witte Morris (MorrisRatner), Proposition 4.7.1 and proof, printed pp.139–142 (arXiv:math/0310402), using Theorem 4.5.2 and Corollary 4.3.6: States and proves that the Zariski closure of a lattice in a closed subgroup of SL(ℓ, ℝ) contains its unipotent and hyperbolic elements. Paul D. Nelson, Akshay Venkatesh (NV2021), Proof of Lemma 27.8, p.184 (Acta Math. 226 (2021)): Uses Borel density: for a lattice Γ_S in a closed connected S, the real points of the Zariski closure of Γ_S contain the unipotents of S.

<a id="so21-intermediate-subgroups"></a>
#### Connected subgroups between SO(2,1) and SL(3,ℝ)

`GN.4/so21-intermediate-subgroups` · lemma

Let H = SO(Q₀)° ⊆ SL_3(ℝ) for Q₀ = x₁² + x₂² − x₃². The only connected Lie subgroups S of SL_3(ℝ) with H ⊆ S are S = H and S = SL_3(ℝ).

*Hypotheses.*

- Connected subgroups; the statement is about Lie algebras 𝔥 ⊆ 𝔰 ⊆ 𝔰𝔩_3(ℝ).

*Proof sketch.*

1. Under H ≅ PSL_2(ℝ) (or SO(2,1)° ≅ PSL_2(ℝ)), 𝔰𝔩_3(ℝ) = 𝔥 ⊕ 𝔭 with 𝔭 the 5-dimensional irreducible representation (traceless Q₀-symmetric matrices).
2. An 𝔥-invariant subspace 𝔰 ⊇ 𝔥 is 𝔥 ⊕ (𝔰 ∩ 𝔭), and irreducibility of 𝔭 forces 𝔰 ∩ 𝔭 ∈ {0, 𝔭}.

*Checks.*

- The Lie algebra 𝔰𝔬(2,1) has dimension 3 and 𝔰𝔩_3 dimension 8 = 3 + 5.

*Needs:* `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`; `LieSubalgebra` (Mathlib).

*Source:* Dave Witte Morris (MorrisRatner), §1.2, proof of Margulis' theorem, printed pp.14–15 (arXiv:math/0310402): Uses that a connected subgroup containing H = SO(2,1)° is H or SL(3, ℝ), as part of the proof via Ratner's orbit closure theorem.

<a id="closed-orbit-rational-form"></a>
#### Closed SO(Q) orbits come from rational forms

`GN.4/closed-orbit-rational-form` · lemma

Let Q = λQ₀∘g with g ∈ SL_3(ℝ), λ ≠ 0, and H = SO(Q₀)°. If the orbit H·gΓ_3 ⊆ X_3 (the lattices hgℤ³, h ∈ H) is closed and carries a finite H-invariant measure, then Q is a scalar multiple of a form with integer coefficients.

*Hypotheses.*

- Q indefinite nondegenerate ternary; the closed orbit is the alternative left by Ratner's orbit closure theorem with S = H.

*Proof sketch.*

1. Closed finite-volume orbit ⇒ Γ_H = g⁻¹Hg ∩ SL_3(ℤ) is a lattice in g⁻¹Hg = SO(Q)° (Morris §1.1 exercises 22, 24).
2. Borel density (borel-density): the Zariski closure of Γ_H contains all unipotents of SO(Q)°, which generate it, so SO(Q)° lies in the Zariski closure of a set of integer matrices; that closure is defined over ℚ.
3. The space of quadratic forms invariant under SO(Q) is the line ℝQ; it is cut out by linear equations with rational coefficients (invariance under the rational generators), so it contains a nonzero rational form.

*Checks.*

- Q = x² + y² − 3z²: the orbit of SO(Q)° is closed (Q rational).

*Needs:* [`borel-density`](#borel-density); [`space-of-unimodular-lattices`](#space-of-unimodular-lattices); `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`.

*Source:* Dave Witte Morris (MorrisRatner), §1.2, proof of Margulis' theorem, printed pp.14–15: Shows that if the orbit closure is the H-orbit itself then the orbit is closed with finite volume, H ∩ gΓg⁻¹ is a lattice, and Borel density forces Q to be a multiple of an integral form.

<a id="oppenheim-ternary-reduction"></a>
#### Reduction of Oppenheim's theorem to three variables

`GN.4/oppenheim-ternary-reduction` · lemma

Let n ≥ 4 and Q a real nondegenerate indefinite quadratic form in n variables that is not a scalar multiple of a rational form. Then there is a rational 3-dimensional subspace W ⊆ ℚⁿ (with W ⊗ ℝ spanned by integer vectors) such that Q|_{W⊗ℝ} is nondegenerate, indefinite and not a scalar multiple of a rational form; restricting to W ∩ ℤⁿ ≅ ℤ³ gives Q(ℤⁿ) ⊇ Q|_W(ℤ³).

*Hypotheses.*

- The subspace is rational, so W ∩ ℤⁿ is a lattice of rank 3.
- Irrationality is not treated as an open condition; the proof retains an irrational ratio on two fixed integer vectors.

*Proof sketch.*

1. Integer vectors exist in both open sign cones by rational density. Suppose every pair of integer vectors v,w with Q(v)>0>Q(w) has Q(v)/Q(w) rational. Fix one such v₀,w₀. For any integer u, Q(u+mv₀)>0 for all sufficiently large integers m. Three consecutive such m give Q(u+mv₀)/Q(w₀) rational; quadratic interpolation at these integer arguments implies Q(u)/Q(w₀) rational. Evaluating at e_i and e_i+e_j then makes every coefficient of Q/Q(w₀) rational, a contradiction.
2. Choose integer v₁,v₂ with opposite signs and irrational Q(v₁)/Q(v₂). Their span is a nondegenerate indefinite plane: its Gram determinant is Q(v₁)Q(v₂)−B(v₁,v₂)²<0. Its orthogonal complement is nondegenerate. Choose a real v₃ whose orthogonal component has nonzero Q-value; nonvanishing of the three-dimensional Gram determinant is open, so rational density and denominator clearing give an integer v₃ with the same property.
3. The resulting rational ternary subspace is nondegenerate and indefinite. If its restriction were proportional to a rational form, the ratio Q(v₁)/Q(v₂) would be rational. Its integral intersection has rank three; the chosen independent integer vectors suffice for the asserted inclusion of value sets, even without choosing a saturated basis.

*Checks.*

- n = 4, Q = x₁² + x₂² − √2x₃² + x₄²: W = span(e₁, e₂, e₃) works.

*Needs:* `QuadraticMap` (Mathlib); `QuadraticMap.Anisotropic` (Mathlib).

*Source:* Dave Witte Morris (MorrisRatner), §1.2, proof printed p.14; Exercise 1.2#15 and its hint, printed p.18: Asks for integer v₁,v₂ with negative irrational value ratio and a generic third vector. The proof above supplies the rational-ratio contradiction and nondegenerate extension explicitly.

### 4.16 Siegel's mean value theorem

The Siegel transform, the unfolding of its primitive part over the mirabolic subgroup, the uniqueness of invariant measures on the punctured space, and the mean value theorem with its constant, which proves the base plan's siegel-mean-value.

<a id="siegel-transform"></a>
#### The Siegel transform

`GN.4/siegel-transform` · definition

For n ≥ 2 and f : ℝⁿ → [0, ∞] measurable (or f : ℝⁿ → ℂ with Σ|f| finite on every lattice), the Siegel transform of f is the function on X_n given by S f(x) = Σ_{v ∈ toLattice(x) ∖ {0}} f(v), and the primitive Siegel transform is S*f(x) = Σ_{v primitive in toLattice(x)} f(v), where v is primitive in L if v ∉ mL for every integer m ≥ 2. For nonnegative f, S f = Σ_{m≥1} S*(f∘(m·)).

*Hypotheses.*

- The origin is excluded; for f ≥ 0 the transforms take values in [0, ∞].
- Primitivity is in the lattice toLattice(x), not in ℤⁿ.

*Uses.*

- siegel-mean-value (base packet): the integral of S f over X_n
- Kleinbock–Margulis, logarithm laws; Eskin–Margulis–Mozes (Morris §1.4A): counting via averages of S f over orbits
- Browning–Le Boudec–Sawin §4.5: primitive point counts as primitive transforms of indicator functions

*API.*

- `siegelTransform` (constructor): siegelTransform f x = ∑' v : toLattice x, if v = 0 then 0 else f v (in ℝ≥0∞ for f ≥ 0).
- `primitiveSiegelTransform` (constructor): primitiveSiegelTransform f x = ∑' over primitive v of f v.
- `siegelTransform_eq_tsum_primitive` (relation): siegelTransform f = ∑' m : ℕ+, primitiveSiegelTransform (f ∘ (m • ·)).
- `siegelTransform_smul` (functoriality): siegelTransform f (h • x) = siegelTransform (f ∘ h) x for h ∈ SL_n(ℝ).
- `measurable_siegelTransform` (structure): f measurable → siegelTransform f measurable on X_n.
- `siegelTransform_mono` (structure): f ≤ f' → siegelTransform f ≤ siegelTransform f'.
- `siegelTransform_indicator_ball` (simp): siegelTransform (indicator (closedBall 0 T) 1) x = #(toLattice x ∩ closedBall 0 T) − 1.

*Unit tests.*

- `siegelTransform_base_ball` (computation): For n = 2, siegelTransform 1_{closedBall 0 1} base = 4 (the vectors ±e₁, ±e₂).
- `primitiveSiegelTransform_base_ball2` (computation): For n = 2, the primitive transform of 1_{closedBall 0 2} at base is 8 while the full transform is 12.
- `siegelTransform_zero` (degenerate): siegelTransform 0 = 0.
- `siegelTransform_excludes_origin` (non-example): For f = 1_{\{0\}}, siegelTransform f = 0: the origin is never counted, so the formula ∫S f = ∫f is not contradicted by point masses.

*Proof sketch.*

1. Well defined on X_n since it depends only on the lattice gℤⁿ.
2. Every nonzero lattice vector is uniquely m·w with m ≥ 1 and w primitive, giving S f = Σ_m S*(f(m·)).

*Checks.*

- S 1_{B̄(T)} counts the nonzero lattice points in the ball of radius T.
- For f compactly supported away from 0 and x in a compact set, S f(x) is a finite sum.

*Needs:* [`space-of-unimodular-lattices`](#space-of-unimodular-lattices); `ENNReal.tsum_eq_iSup_sum` (Mathlib); `Measurable.ennreal_tsum` (Mathlib).

*Source:* Stephen D. Miller (Miller2020), §4, (1), p.10, and the primitive reformulation, pp.11–12: Defines E f(g) as the sum of f over the nonzero vectors of the lattice of g, and the equivalent statement with primitive vectors. Alex Eskin (EskinLuminy), §1, pp.3–4: Uses f̂(Δ) = Σ_{v∈Δ∖0} f(v) and its primitive version.

<a id="primitive-siegel-unfolding"></a>
#### Unfolding the primitive Siegel transform

`GN.4/primitive-siegel-unfolding` · lemma

Let n ≥ 2, G = SL_n(ℝ), Γ = SL_n(ℤ), P ⊆ G the stabiliser of e_n (the mirabolic subgroup) and m_G a Haar measure. For f : ℝⁿ → [0, ∞] measurable: ∫_{G/Γ} S*f dm_{G/Γ} = c·∫_{ℝⁿ} f(x) dx, where c = m_{P/(P∩Γ)}(P/(P∩Γ)) for the compatible Haar measures on P and on G/P ≅ ℝⁿ ∖ {0} (normalised to Lebesgue measure); in particular c < ∞ and does not depend on f.

*Hypotheses.*

- Tonelli for nonnegative f: no integrability hypothesis.
- The constant c is finite because P ∩ Γ ≅ SL_{n−1}(ℤ) ⋉ ℤ^{n−1} is a lattice in P ≅ SL_{n−1}(ℝ) ⋉ ℝ^{n−1}.

*Proof sketch.*

1. Γ acts transitively on primitive vectors of ℤⁿ with stabiliser of e_n equal to P ∩ Γ, so S*f(gΓ) = Σ_{γ ∈ Γ/(P∩Γ)} f(gγe_n).
2. Unfold: ∫_{G/Γ} Σ_{γ∈Γ/(Γ∩P)} F(gγ) = ∫_{G/(Γ∩P)} F with F(g) = f(ge_n), then integrate over P/(Γ∩P) fibrewise: ∫_{G/P} f(ge_n)·m(P/(Γ∩P)).
3. G/P ≅ ℝⁿ ∖ {0} via g ↦ ge_n, and the G-invariant measure on it is a multiple of Lebesgue measure (invariant-measures-punctured-space); absorb the multiple into c.

*Checks.*

- n = 2: the stabiliser of e₂ in SL₂(ℤ) is {[[1, 0],[k, 1]] : k ∈ ℤ} and P = {[[1, 0],[t, 1]] : t ∈ ℝ}, so P/(P ∩ Γ) is a circle.

*Needs:* [`siegel-transform`](#siegel-transform); [`invariant-measures-punctured-space`](#invariant-measures-punctured-space); [`lattice-space-invariant-probability`](#lattice-space-invariant-probability); `QuotientGroup.integral_eq_integral_automorphize` (Mathlib); `MeasureTheory.lintegral_tsum` (Mathlib); `AdelicAlgebraicGroups:AA.2`; `AdelicAlgebraicGroups:AA.3`.

*Source:* Stephen D. Miller (Miller2020), §6 'Lie theoretic formulation of Siegel's integration formula', pp.12–13 (with footnote 4 on the mirabolic subgroup): Rewrites the primitive sum as a sum over Γ/(Γ∩P), unfolds the integral to (Γ∩P)\G and fibres over P\G ≅ ℝⁿ ∖ {0}, so the average is a constant multiple of the Lebesgue integral; the row convention is used there.

<a id="invariant-measures-punctured-space"></a>
#### Invariant measures on the punctured space

`GN.4/invariant-measures-punctured-space` · lemma

For n ≥ 2, every SL_n(ℝ)-invariant Radon measure on ℝⁿ ∖ {0} is a nonnegative multiple of Lebesgue measure.

*Hypotheses.*

- n ≥ 2 makes the action transitive; for n = 1 the group is trivial.

*Proof sketch.*

1. SL_n(ℝ) acts transitively on ℝⁿ ∖ {0} with stabiliser P (the mirabolic subgroup), so ℝⁿ ∖ {0} ≅ G/P; Lebesgue measure is G-invariant since det = 1.
2. An invariant Radon measure on a homogeneous space G/P, when one exists, is unique up to a scalar (it lifts to a Haar measure of G through the quotient integral formula); so every invariant measure is c·Lebesgue.

*Checks.*

- The Dirac mass at e_1 is not invariant; Lebesgue measure restricted to the punctured space is.

*Needs:* `MeasureTheory.Measure.haar` (Mathlib); `MeasureTheory.Measure.isMulLeftInvariant_eq_smul` (Mathlib); `MeasureTheory.Measure.addHaar_image_linearMap` (Mathlib).

*Source:* Stephen D. Miller (Miller2020), §4, Remark 2, p.11, and §6, p.13: Siegel's argument: the averaged functional is invariant, hence a multiple of Lebesgue measure on G/P ≅ ℝⁿ ∖ {0}.

<a id="primitive-siegel-mean-value"></a>
#### Siegel's mean value theorem, primitive form

`GN.4/primitive-siegel-mean-value` · theorem

For n ≥ 2 and f : ℝⁿ → [0, ∞] measurable, ∫_{X_n} S*f dμ_n = (1/ζ(n))·∫_{ℝⁿ} f(x) dx, and ∫_{X_n} S f dμ_n = ∫_{ℝⁿ} f(x) dx. For f ∈ L¹(ℝⁿ), S f is μ_n-integrable and the same identities hold.

*Hypotheses.*

- μ_n is the invariant probability; the identities hold in [0, ∞] for f ≥ 0 and integrability of S f is a consequence, not a hypothesis.

*Proof sketch.*

1. primitive-siegel-unfolding gives ∫S*f dμ_n = c'·∫f for a constant c' ∈ [0, ∞) independent of f.
2. S f = Σ_m S*(f(m·)) and ∫f(mx)dx = m^{−n}∫f give ∫S f dμ_n = c'ζ(n)∫f.
3. Determine c'ζ(n) = 1: for f_T = 1_{B̄(T)}/vol B̄(T), S f_T(x) → 1 as T → ∞ for every x (the lattice toLattice x has covolume 1). Domination: by ball-count-successive-minima S f_T ≤ C·Σ_{j<n} T^{j−n}/(λ_1⋯λ_j) + C for T ≥ 1, and since λ_1⋯λ_n ≍ 1 each 1/(λ_1⋯λ_j) is at most C'·#(toLattice x ∩ B̄(1)) (the vectors realising the minima ≤ 1 generate that many points), which is μ_n-integrable by the first step. Dominated convergence gives c'ζ(n)·1 = 1.
4. Positive and negative parts give the L¹ statement.

*Checks.*

- n = 2, f = 1_{B̄(T)}: the average number of nonzero lattice points of a random unimodular lattice in a disc of radius T is exactly πT², and of primitive ones πT²/ζ(2) = 6T²/π.

*Needs:* [`primitive-siegel-unfolding`](#primitive-siegel-unfolding); [`siegel-transform`](#siegel-transform); [`lattice-space-invariant-probability`](#lattice-space-invariant-probability); [`ball-count-successive-minima`](#ball-count-successive-minima); `riemannZeta` (Mathlib); `MeasureTheory.lintegral_tsum` (Mathlib).

*Source:* Stephen D. Miller (Miller2020), §4, formula (2) and Remark 2, pp.10–11; §6, pp.12–13: Siegel's integration formula: the mean of E f over the space of unimodular lattices equals ∫f; the constant is fixed by a limiting argument or by the Eisenstein-series proof of §15. Alex Eskin (EskinLuminy), §1, p.4: States that the proof of Siegel's formula shows the average of the primitive sum is (1/ζ(n))∫f.

### 4.17 Arithmetic packets for equidistribution

The objects whose equidistribution Duke-type theorems assert: CM points of negative discriminants, oriented closed geodesics of indefinite forms with their lengths, the Weyl sums of spherical harmonics over lattice points on spheres, and Weyl's criterion on the sphere. The equidistribution theorems on the modular surface rest on spectral inputs above this layer and are proposed for the toral-packets Part II.

<a id="cm-point-packet"></a>
#### The packet of CM points of a negative discriminant

`GN.4/cm-point-packet` · construction

Let D < 0 be a discriminant (D ≡ 0, 1 mod 4). For a positive definite integral binary form Q = [a, b, c] (a > 0) of discriminant b² − 4ac = D let z_Q = (−b + i√|D|)/(2a) ∈ ℍ, its CM point. z_{Q∘γ} = γ⁻¹·z_Q for γ ∈ SL₂(ℤ), so the classes of primitive forms of discriminant D give a finite set Λ_D of points of the modular curve SL₂(ℤ)\ℍ, of cardinality h(D), the number of proper classes; each point carries the weight 1/ω_Q, ω_Q the order of the stabiliser of z_Q in PSL₂(ℤ) (ω = 3, 2, 1 for D = −3, −4, D < −4). The normalised counting measure of the packet is ν_D = (Σ_Q 1/ω_Q)^{−1}Σ_Q ω_Q^{−1}δ_{z_Q}.

*Hypotheses.*

- Primitive forms (gcd(a, b, c) = 1); for fundamental D every form of discriminant D is primitive.
- Reduced representatives (|b| ≤ a ≤ c) give the points of Λ_D in the standard fundamental domain.

*Uses.*

- Duke 1988, Theorem 1(i), p.75: equidistribution of Λ_D as D → −∞ through fundamental discriminants
- Duke–Imamoḡlu–Tóth 2016, (4.5), p.961: genus version of the CM equidistribution
- GeometryOfNumbersPartIIToralJoinings (proposed): joint equidistribution of CM points (Khayutin)

*API.*

- `cmPoint` (constructor): cmPoint Q : ℍ = (−b + i√|D|)/(2a) for Q positive definite.
- `cmPoint_smul` (functoriality): cmPoint (Q ∘ γ) = γ⁻¹ • cmPoint Q for γ ∈ SL(2, ℤ).
- `cmPointPacket` (constructor): cmPointPacket D : Finset (SL(2,ℤ)-orbits in ℍ), the images of cmPoint over primitive forms of discriminant D.
- `card_cmPointPacket` (characterisation): (cmPointPacket D).card = the number of proper classes of primitive positive definite forms of discriminant D.
- `cmWeight` (data): cmWeight Q = 1 / #(stabiliser of cmPoint Q in PSL(2,ℤ)).
- `cmMeasure` (data): The normalised weighted counting measure ν_D on SL(2,ℤ)\ℍ.
- `cmMeasure_isProbability` (instance): ν_D is a probability measure for a negative discriminant D ≡ 0 or 1 mod 4, using the nonempty finite class set from IntegralLattices.

*Unit tests.*

- `cmPoint_minus_four` (computation): For Q = [1, 0, 1], cmPoint Q = i and its PSL(2,ℤ)-stabiliser has order 2.
- `cmPoint_minus_three` (computation): For Q = [1, 1, 1], cmPoint Q = (−1 + i√3)/2 with stabiliser of order 3.
- `card_cmPointPacket_minus_twenty` (computation): card (cmPointPacket (−20)) = 2, from the reduced forms [1, 0, 5] and [2, 2, 3] with CM points i√5 and (−1 + i√5)/2.
- `cmPointPacket_not_imprimitive` (non-example): The imprimitive form [2, 0, 2] of discriminant −16 is excluded: Λ_{−16} = {2i} from [1, 0, 4] only, although z_{[2,0,2]} = i.

*Proof sketch.*

1. z_Q is the root in ℍ of Q(z, 1) = 0; the transformation law follows from Q(γ(x, y)) and the action of γ on the root.
2. Proper equivalence classes of forms correspond to SL₂(ℤ)-orbits of CM points of discriminant D; there are h(D) of them (finiteness of the form class number, TauCetiRoadmap IntegralLattices binary forms).
3. The stabiliser of z_Q in PSL₂(ℤ) is the image of the automorph group of Q, of order 3, 2 or 1.

*Checks.*

- D = −4: Λ_D = {i} with ω = 2.
- D = −3: Λ_D = {e^{2πi/3}} with ω = 3.
- D = −20: h = 2; the reduced forms [1, 0, 5] and [2, 2, 3] give i√5 and (−1 + i√5)/2.

*Needs:* `UpperHalfPlane` (Mathlib); `ModularGroup.fd` (Mathlib); `UpperHalfPlane.SLAction` (Mathlib).

*Source:* W. Duke, Ö. Imamoḡlu, Á. Tóth (DIT2016), §4, pp.960–961, (4.5), and §5, line after (5.12), p.963 (Ann. of Math. 184 (2016)): Associates to each ideal class of a negative fundamental discriminant a CM point z_A ∈ F and weights 1/ω_D with ω_D = 3, 2, 1 for D = −3, −4, D < −4. W. Duke (Duke1988), §1, p.75 (Invent. Math. 92 (1988)): Defines the h(d) Heegner points z_Q = (−b + √d)/(2a) of a negative discriminant in the fundamental region.

<a id="oriented-closed-geodesic"></a>
#### The oriented closed geodesic of an indefinite form

`GN.4/oriented-closed-geodesic` · construction

Let D > 0 be a nonsquare discriminant and Q = [a, b, c] a primitive integral form of discriminant D. Its roots w = (−b + √D)/(2a) and w' = (−b − √D)/(2a) are the endpoints of the hyperbolic geodesic S_Q = {z ∈ ℍ : a|z|² + b Re z + c = 0}. Let γ_Q ∈ SL₂(ℤ) be the generator of the automorph group of Q with attracting fixed point w (pell-automorph). The oriented closed geodesic C_Q is the image in SL₂(ℤ)\ℍ of the arc of S_Q from z to γ_Qz, oriented from w' towards w; for a continuous SL₂(ℤ)-invariant function f, ∫_{C_Q} f ds is the integral along that arc (hyperbolic arclength), and for an invariant 1-form ω, ∫_{C_Q} ω the integral along the oriented arc. Both are independent of z ∈ S_Q and depend only on the proper class of Q; C_{nQ} = C_Q for n ∈ ℤ_{>0}.

*Hypotheses.*

- Nonsquare D, so the roots are irrational and γ_Q is hyperbolic.
- Orientation from w' to w, i.e. clockwise on S_Q when a > 0.

*Uses.*

- Duke 1988, Theorem 1(ii), p.75: equidistribution of the closed geodesics of discriminant d as d → ∞
- Duke–Imamoḡlu–Tóth 2016, (4.4) and §5, (5.12): genus Weyl sums Σχ(A)∫_{C_A}u ds
- FuchsianOrbifoldsPartII (proposed): C_A is the boundary of the Nielsen core F_A

*API.*

- `geodesicOfForm` (constructor): geodesicOfForm Q = {z : ℍ | a * normSq z + b * re z + c = 0}.
- `closedGeodesicIntegral` (constructor): closedGeodesicIntegral Q f = ∫ over the arc of geodesicOfForm Q from z to γ_Q • z of f ds.
- `closedGeodesicIntegral_indep` (characterisation): The integral does not depend on the base point z ∈ geodesicOfForm Q, for f SL(2,ℤ)-invariant.
- `closedGeodesicIntegral_smul` (functoriality): closedGeodesicIntegral (Q ∘ γ) f = closedGeodesicIntegral Q f.
- `closedGeodesicIntegral_nsmul` (simp): closedGeodesicIntegral (n • Q) f = closedGeodesicIntegral Q f for n > 0.
- `closedGeodesicIntegral_one` (simp): closedGeodesicIntegral Q 1 = length of C_Q (closed-geodesic-length).
- `mem_geodesicOfForm_roots` (characterisation): The endpoints of geodesicOfForm Q on ℝ ∪ {∞} are the two real roots of Q(x, 1).

*Unit tests.*

- `geodesicOfForm_sqrt2` (computation): geodesicOfForm [1, 0, −2] = {z : |z| = √2}.
- `closedGeodesicIntegral_one_D8` (computation): For Q = [1, 0, −2], closedGeodesicIntegral Q 1 = 2 log(3 + 2√2).
- `closedGeodesicIntegral_zero` (degenerate): closedGeodesicIntegral Q 0 = 0.
- `geodesic_square_disc_excluded` (non-example): For D = 4 (a square) the form [1, 2, 0] = x(x + 2y) has rational roots, its automorph group is finite and there is no closed geodesic.

*Proof sketch.*

1. γ_Q fixes w and w' and preserves S_Q; it acts on S_Q as a translation towards its attracting fixed point w.
2. Changing z along S_Q changes the arc by a fundamental-domain shift of γ_Q, leaving integrals of invariant integrands unchanged; replacing Q by Q∘γ moves S_Q by γ⁻¹ and conjugates γ_Q.

*Checks.*

- Q = [1, 0, −2] (D = 8): S_Q is the semicircle |z| = √2 and γ_Q = ±[[3, 4],[2, 3]] (t = 6, u = 2 with t² − 8u² = 4).

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.3/pell-automorph`; `GeometryOfNumbersAndQuadraticArithmetic:GN.3/reduced-cycle-class-invariant`; `UpperHalfPlane` (Mathlib); `UpperHalfPlane.dist_eq` (Mathlib).

*Source:* W. Duke, Ö. Imamoḡlu, Á. Tóth (DIT2016), §2, (2.9) and the paragraph after it, pp.953–954 (read); §7 after Lemma 1, p.972, and §9, p.978 with footnote 8, as recorded in the reviewed extraction: Defines S_w, γ_w with attracting fixed point w and the clockwise orientation, the closed geodesic C_A as the reduction of the arc from z_0 to γ_w(z_0), integrals over C_A independent of z_0, and C_Q for forms of arbitrary nonsquare discriminant with C_{nQ} = C_Q. W. Duke (Duke1988), §1, p.75: Associates to a form of positive discriminant the primitive positively oriented closed geodesic through the roots.

<a id="closed-geodesic-length"></a>
#### The length of a closed geodesic

`GN.4/closed-geodesic-length` · theorem

Let D > 0 be a nonsquare discriminant, Q primitive of discriminant D and (t, u) the solution of t² − Du² = 4 with t, u ≥ 1 minimal. Then the hyperbolic length of C_Q (the arc from z to γ_Qz) is 2 log ε_D with ε_D = (t + u√D)/2, independent of Q. The length is the translation length of the parametrised cycle; it is not halved when C_Q retraces itself (reciprocal classes).

*Hypotheses.*

- Lengths are for the parametrised arc, counted with multiplicity.

*Proof sketch.*

1. γ_Q = ±[[(t − bu)/2, −cu], [au, (t + bu)/2]] has trace t (pell-automorph).
2. A hyperbolic element of trace t > 2 translates its axis by 2 arccosh(t/2) = 2 log((t + √(t² − 4))/2) = 2 log ε_D.

*Checks.*

- D = 5: t = 3, u = 1, ε = (3 + √5)/2 and length 2 log((3 + √5)/2) = 4 log((1 + √5)/2).
- D = 8: ε = 3 + 2√2.

*Needs:* [`oriented-closed-geodesic`](#oriented-closed-geodesic); `GeometryOfNumbersAndQuadraticArithmetic:GN.3/pell-automorph`; `UpperHalfPlane.dist_eq` (Mathlib); `Real.arcosh` (Mathlib).

*Source:* W. Duke, Ö. Imamoḡlu, Á. Tóth (DIT2016), (2.10) and (2.11), p.954: length(C_A) = 2 log ε_D, with γ_Q the automorph built from the minimal solution of t² − d₀u² = 4 and ε_D = (t + u√D)/2. W. Duke (Duke1988), §1, p.75: Records the length log ε_d or 2 log ε_d according as Q is or is not equivalent to −Q, for the set image of the primitive geodesic; the parametrised cycle of this node always has length 2 log ε_d.

<a id="geodesic-orientation-reversal"></a>
#### Reversing the orientation of a closed geodesic

`GN.4/geodesic-orientation-reversal` · theorem

For Q = [a, b, c] primitive of nonsquare discriminant D > 0, the geodesic of −Q = [−a, −b, −c] is S_Q traversed in the opposite direction: C_{−Q} has the same image as C_Q, ∫_{C_{−Q}} f ds = ∫_{C_Q} f ds for invariant functions and ∫_{C_{−Q}} ω = −∫_{C_Q} ω for invariant 1-forms. The reflected form [a, −b, c] has geodesic −S̄_Q (the mirror image in the imaginary axis).

*Hypotheses.*

- The statement is about forms; the narrow-class translation (−Q represents JA⁻¹ when Q represents A) belongs to the class-group dictionary (IntegralLattices binary forms, MultiquadraticPartII).

*Proof sketch.*

1. −Q has the same zero set, so S_{−Q} = S_Q; its attracting fixed point is w' since γ_{−Q} = γ_Q⁻¹ (the formula of pell-automorph with (a, b, c) ↦ (−a, −b, −c)).
2. Reflection z ↦ −z̄ maps the zero set of [a, b, c] to that of [a, −b, c].

*Checks.*

- Q = [1, 0, −2]: C_{−Q} runs along |z| = √2 counterclockwise.

*Needs:* [`oriented-closed-geodesic`](#oriented-closed-geodesic); `GeometryOfNumbersAndQuadraticArithmetic:GN.3/pell-automorph`.

*Source:* W. Duke, Ö. Imamoḡlu, Á. Tóth (DIT2016), §2, p.954, the sentence after (2.11) using (2.5), and (2.3), p.952: The closed geodesic of JA⁻¹ (represented by −Q) has the same image as C_A with opposite orientation; [a, −b, c] represents A⁻¹.

<a id="harmonic-weyl-sum"></a>
#### Weyl sums of spherical harmonics over lattice points on spheres

`GN.4/harmonic-weyl-sum` · definition

For n ≥ 1 let R_n = {m ∈ ℤ³ : |m|² = n} and r₃(n) = #R_n. For a harmonic polynomial u on ℝ³, homogeneous of degree ℓ, and n with r₃(n) > 0, the Weyl sum is W_u(n) = r₃(n)^{−1}Σ_{m∈R_n} u(m/√n). The theta series with harmonic coefficients is θ(z; u) = Σ_{m∈ℤ³} u(m)e^{2πiz|m|²}, z ∈ ℍ, whose n-th coefficient is a(n) = Σ_{m∈R_n}u(m) = n^{ℓ/2}r₃(n)W_u(n).

*Hypotheses.*

- u harmonic (Δu = 0) and homogeneous; ℓ = 0 gives W_1(n) = 1.
- In Lean harmonicWeylSum is totalised to 0 on an empty sphere; statements about counting probability measures assume n>0 and r₃(n)>0.

*Uses.*

- Duke 1988, §1, p.74: the spherical equidistribution reduces to W_u(n) → 0 for every harmonic u of degree ≥ 1
- duke-spherical-equidistribution (base packet): the Weyl-criterion route to the theorem

*API.*

- `latticeSphere` (constructor): latticeSphere n = {m : Fin 3 → ℤ | Σ m_i² = n} as a Finset.
- `harmonicWeylSum` (constructor): harmonicWeylSum u n = (latticeSphere n).card⁻¹ * Σ m ∈ latticeSphere n, u (m / √n).
- `harmonicWeylSum_one` (simp): harmonicWeylSum 1 n = 1 when latticeSphere n is nonempty.
- `harmonicWeylSum_odd` (relation): If u is odd (ℓ odd) then harmonicWeylSum u n = 0.
- `thetaHarmonic` (constructor): thetaHarmonic u z = Σ m : ℤ³, u m * exp (2πi z |m|²).
- `thetaHarmonic_coeff` (characterisation): For n>0 and u homogeneous of degree ℓ, the n-th Fourier coefficient of thetaHarmonic u is n^{ℓ/2} * r₃(n) * harmonicWeylSum u n (also 0 when r₃(n)=0).

*Unit tests.*

- `latticeSphere_card_three` (computation): (latticeSphere 3).card = 8 (all (±1, ±1, ±1)).
- `harmonicWeylSum_xy_three` (computation): For u = xy, harmonicWeylSum u 3 = 0.
- `latticeSphere_seven_empty` (degenerate): latticeSphere 7 = ∅. The Lean totalised harmonicWeylSum is 0 there; it represents a probability average only for nonempty spheres.
- `nonharmonic_not_mean_zero` (non-example): For n>0 with latticeSphere n nonempty, the average of x² is 1/3 by coordinate symmetry and Σx_i²=1. Both hypotheses are necessary (n=0 and n=7 are boundary tests).

*Proof sketch.*

1. W_u(n) is the integral of u against the normalised counting measure of R_n/√n ⊆ S².
2. Homogeneity gives u(m) = n^{ℓ/2}u(m/√n) for m ∈ R_n, hence the coefficient identity.
3. θ(z; u) converges absolutely on ℍ (polynomial growth against Gaussian decay); its modularity of weight 3/2 + ℓ on Γ₀(4) is the theta input recorded in the base packet's tier-move gap (MetaplecticAutomorphicForms MP.7).

*Checks.*

- u = x: W_u(n) = 0 for every n by the symmetry m ↦ −m.
- u = x² − y²: W_u(n) = 0 by the symmetry swapping coordinates.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-lattice-theta-series`; `MvPolynomial` (Mathlib).

*Source:* W. Duke (Duke1988), §1, p.74: Defines V_n = {m/|m| : |m|² = n}, the Weyl sums W_u(n) and the theta function θ(z; u) with coefficients a(n) = n^{ℓ/2}r₃(n)W_u(n).

<a id="spherical-weyl-criterion"></a>
#### Weyl's criterion on the sphere

`GN.4/spherical-weyl-criterion` · lemma

Let σ be the normalised rotation-invariant measure on S² and (V_k) a sequence of nonempty finite multisets in S² with counting probability measures ν_k. Then ν_k → σ weakly iff for every ℓ ≥ 1 and every harmonic polynomial u homogeneous of degree ℓ, ν_k(u) → 0.

*Hypotheses.*

- Weak convergence against continuous functions on S².

*Proof sketch.*

1. Restrictions to S² of harmonic homogeneous polynomials of degrees 0..L span the restrictions of all polynomials of degree ≤ L (harmonic decomposition p = h_L + |x|²p'), so their span is a subalgebra-generated dense subspace of C(S²) by Stone–Weierstrass.
2. For ℓ ≥ 1, σ(u) = 0 (u is orthogonal to constants; equivalently the mean value property at 0 for harmonic u).
3. Hence ν_k(f) → σ(f) for f in a dense subspace, and uniform boundedness of the ν_k extends this to C(S²).

*Checks.*

- For n = 3·4^j the set R_n/√n consists of the 8 points (±1, ±1, ±1)/√3, and for the harmonic u = Σx_i⁴ − 3Σ_{i<j}x_i²x_j² one gets W_u(n) = −2/3 for every j: these n are not square-free and are excluded from Duke's theorem.

*Needs:* [`harmonic-weyl-sum`](#harmonic-weyl-sum); `ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints` (Mathlib); `MeasureTheory.tendsto_of_forall_isOpen_le_liminf` (Mathlib).

*Source:* W. Duke (Duke1988), §1, p.74: Deduces the uniform distribution of V_n on S² from the bound on W_u(n) 'by the analogue of Weyl's criterion'.

## Dependencies

**Inside this roadmap.** `GN.0/covolume-dual` (GN.0 plan), `GN.0/covolume-projection` (GN.0 plan), `GN.0/covolume-square-gram` (GN.0 plan), `GN.0/dual-projection-comap` (GN.0 plan), `GN.0/orthonormal-coordinate-hadamard` (GN.0 plan), `GN.0/saturated-adapted-basis` (GN.0 plan), `GN.1/basis-from-minima` (GN.1 plan), `GN.1/integral-norm-minima-comparison` (GN.1 plan), `GN.1/minkowski-second-lower` (GN.1 plan), `GN.1/minkowski-second-upper` (GN.1 plan), `GN.1/successive-minimum` (GN.1 plan), `GN.1/successive-minimum-linear-equiv` (GN.1 plan), `GN.1/successive-minimum-partial-product` (GN.1 plan), `GN.1/successive-minimum-smul-body` (GN.1 plan), `GN.3/definite-lattice-theta-series` (GN.3 plan), `GN.3/pell-automorph` (GN.3 plan), `GN.3/reduced-cycle-class-invariant` (GN.3 plan), `GN.4/construction-a-real-lattice-interface` (base plan), `GN.4/covering-dual-transference` (base plan), `GN.4/covering-radius` (base plan), `GN.4/dual-transference-lower` (base plan), `GN.4/first-minimum-count` (base plan), `GN.4/henk-successive-minima-count` (base plan), `GN.4/howe-moore-mixing` (base plan), `GN.4/mahler-compactness` (base plan).

**Other roadmaps.** AdelicAlgebraicGroups:AA.2: Haar measure on SL_n(ℝ) for the real points of SL_n over ℚ, its unimodularity, and the quotient measure on SL_n(ℝ)/SL_n(ℤ) with the quotient integral formula. AdelicAlgebraicGroups:AA.3: SL_n(ℤ) is a lattice in SL_n(ℝ) (the S-arithmetic lattice theorem with S = {∞}, or real reduction by Siegel sets of finite Haar measure), and the analogous statement for the mirabolic P ∩ SL_n(ℤ) in P. tauceti:TauCetiRoadmap/GlobalNumberFields#layer-3-geometry-of-numbers-and-ray-class-ideal-counting: IsLipschitzParametrizable (milestone 3A): finitely many Lipschitz maps from [0,1]^d cover the set, with its closure properties; the fixed-lattice count with error O(c^{n−1}). tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem: Closed subgroups of SL_n(ℝ) are Lie groups with Lie algebras; connected Lie subgroups correspond to Lie subalgebras; the adjoint representation.

**Consumers.** ArithmeticStatistics ST.2 (Davenport's estimate, skew symmetric-rank counts), DiophantineApproximationAndTranscendence DT.0 (sup-norm covering for Kronecker's theorem), ProbabilisticAndMetricNumberTheory PM.4 (the space of lattices, its measure, the diagonal flow, Mahler's criterion, time-one mixing), SieveMethodsAndPrimePatterns SV.1–SV.2 and SV.5 (curvature classes, Widmer counts), HeightsRationalPointsAndObstructions Part II (Browning–Le Boudec–Sawin's counts), and the proposed toral-packets Part II (the carriers of §4.17).

## Acceptance tests

Every definition and construction above lists its unit tests and every theorem its checks. The decisive ones: the diagonal segment has volume 0 but projection sum 2; a shear stretches the first-coordinate projection while the count of the sheared box stays bounded by its rows; the closed unit ball has complexity (1, 2) and ℤ ⊂ ℝ has no finite complexity; Schmidt's count needs its constant term as Y → 0; the singular symmetric count reduces to Eskin–Katznelson at s = 1; Markoff fundamental sets have constant 1/48; Minkowski-constant transference is an equality for aℤ; the Construction A lattice of the extended Hamming code has minimal norm 4; SL₂(ℤ)\SL₂(ℝ)'s time-one diagonal map is mixing, and a mixing limit is μ(A)², not μ(A); polynomials of degree at most k ≥ 1 are (2k(k+1)^{1/k}, 1/k)-good; the average number of nonzero points of a random unimodular lattice in a disc of radius T is πT²; the discriminant −20 has two CM points; the closed geodesic of x² − 2y² has length 2 log(3 + 2√2); n = 3·4^j gives Weyl sum −2/3 for a degree-4 harmonic.

## Open inputs

- **Cylindrical algebraic decomposition is not at the pins.** The fibrewise cell count rests on cylindrical algebraic decomposition and on Tarski–Seidenberg. Both are on Tau Ceti main (TauCeti/Geometry/RealAlgebraic/CAD.lean and Semialgebraic/Image.lean, after the pin f790474) and are planned in TauCetiRoadmap RealAlgebraicGeometry Layer 6, a roadmap newer than the atlas snapshot and so not an atlas stage that a request can name. When the pin moves past those modules, cite them as baseline declarations; until then the dependency is recorded here and in the restructure entry on RT-AREA-algebraicnt-1/1.
- **Huxley exponent-sum method.** Huxley's bound x^{131/208}(log x)^{18637/8320} for C³ convex domains rests on the Bombieri–Iwaniec–Huxley discrete Hardy–Littlewood method (first and second spacing problems). Huxley, Proc. London Math. Soc. 87 (2003), is not freely available and was read only through the survey IKKN2004 §3.1; the method is not decomposed and no lower-tier roadmap plans it. The weaker θ > 2/3 route avoids this method; its claimed uniform curvature dependence is separately recorded as an open input below.
- **Primary sources read only through citing papers.** Davenport (1951/1963), Schmidt (1968), Eskin–Katznelson (1995) and Le Boudec (2018) remain cited through BW, BLS and BSW at the node locators. Their statements in those papers were checked; this review does not certify unseen primary proofs. Henk Theorem 1.5 was read directly. Blomer–Granville’s public author copy was also acquired, and its fundamental-discriminant hypothesis and error terms expose the separate representation-pair contract gap below.
- **General Howe–Moore and Ratner proofs.** Morris Theorem 3.2.9 and its proof, printed pp.103–105, were read. The SL₂ kernel/range argument has been corrected. General simple-group mixing still needs the Cartan/contracting-subgroup generation contract, or the base Howe–Moore result with its existing proof gap. Ratner’s general measure classification and orbit closure inputs retain the base packet’s open proof contracts.
- **Projection comparison in the semialgebraic family count.** BW Proposition 6.1 is essential: arbitrary orthogonal projection volumes must be bounded by coordinate projection sums uniformly in the definable family. Lemmas 2.2–2.4 alone do not do this. Plan a target for this comparison with its rectifiability/area and definable-section prerequisites, importing CAD from its existing owner; also account for the boundary argument of §7. This is target-level missing mathematics, not deferred lemma splitting.
- **Representation-pair count: false unrestricted range.** The former all-d statement is disproved by fixed K and d → ∞. The primary Blomer–Granville author copy, Theorem 2, p.5, assumes a fundamental discriminant and has extra error terms. Supply the precise restricted contract needed by GS Lemma 9.5 and its reduction to that theorem, including nonfundamental discriminants if needed. Merely imposing d ≤ K is not certified as sufficient by this review.
- **Quantitative nondivergence covering and marking inputs.** Specify the bounded-multiplicity cover for the prescribed balls in KM §4, and a key target for the marked-poset estimate Theorem 4.1 with its length and local finiteness hypotheses. Mathlib Besicovitch.exists_disjoint_closedBall_covering_ae is an AE disjoint arbitrarily-small-ball cover and is not this statement. Connect primitive exterior-power sup norms through wedge inequality (5.1), not a bare appeal to Minkowski.
- **Oppenheim auxiliary proof contracts.** Borel density needs the algebraic-group invariant-line/stabilizer input used in Morris Theorem 4.5.2 and Proposition 4.7.1 (printed pp.139–142); the LieGroups Layer 2 contract does not provide it. The SO(2,1) maximality proof needs irreducibility of the five-dimensional quotient representation sl₃/so(2,1), not merely a dimension count. These are key inputs that must be owned or imported before closure. The separate ternary reduction has been corrected using the irrational-value-ratio argument of Exercise 1.2#15, not openness of irrationality.
- **Uniform unipotent Davenport proof.** The source states the unipotent estimate, but the proposed replacement induction has not established the uniform complexity of all superlevel sets it uses. One-dimensional semialgebraic fibre lengths can be handled by endpoints; iterated higher-dimensional fibre volumes need not be semialgebraic. State precisely the family retained at each induction step and prove the uniform interval/variation bound, or give a complete alternative proof. E401 is rejected as an established paper erratum; this remains an atlas proof gap.
- **Uniform planar estimate and primitive-ball range.** The IKKN survey gives fixed-domain asymptotics; the proposed uniform dependence solely on maximal curvature over all integral ellipses needs a precise quantitative primary-source contract (the Huxley method is already open). For the primitive-ball target, derive the asserted Y-uniform logarithmic error from the cited BLS application or a primary statement: the application alone does not certify the full generalisation. These claims remain targets, not closed prerequisites.

## Notes on the sources

- **E401 — rejected.** The shear example disproves applying the unsheared projection bound naively to uR, not the source assertion that Davenport’s proof adapts. It establishes neither a paper error nor adequacy of the proposed replacement induction. The latter is recorded as an atlas closure gap.
- **E402 — confirmed.** At printed p.103 the arXiv statement uses L² norms; indicator functions and a negative constant contradict that formula. The proof and Remark 3.2.8 give the product of integrals. Also checked the current author-hosted edition, Theorem 3.2.9, printed p.109, which retains the display; this finding is scoped to those copies, not an uncollated printed edition.
- The strip correction in the Markoff R⁺ count was independently checked: 1/36 − 1/144 = 1/48. This supports the inherited correction without treating the printed 1/36 as the corrected target.
- Published-numbering corrections from the BSW extraction remain attributed to that extraction; this review read its arXiv §5. No independent collation of the published BSW version is claimed.
