# Geometry of numbers, quadratic forms and homogeneous arithmetic — GN.4 continuation

This is the second revision of the GN.4 continuation, after the independent review of the first 65 targets. It retains every original node id and adds eleven key targets. The finished planning pass contains 76 targets, 123 API items, 71 definition/construction tests and six planets. The packet is complete as a planning pass; the stage is planned, with the four open-input groups stated below. These statuses do not assert mathematical closure or formalisation. The historical nonaccepting review stays in the packet for the next independent reviewer to replace.

## Scope and boundaries

The continuation owns lattice-uniform counting estimates, the homogeneous-space and nondivergence adapters, Oppenheim auxiliaries, Siegel unfolding and the arithmetic carriers listed below. It imports the base GN.0/GN.1/GN.3/GN.4 nodes by their existing ids: successive minima, covolume and Minkowski estimates, binary-form reduction, Henk bounds, Howe–Moore and Ratner endpoints. It supplies no new proof of the last two inherited inputs. The GN.1 continuation supplies the separate Gaussian covering chain.

Existing upstream roadmaps remain owners. GlobalNumberFields Layer 3A supplies Lipschitz parametrisation; IntegralLattices supplies binary forms and their ideal/class dictionary; AlgebraicCodingTheory supplies Construction A. AdelicAlgebraicGroups AA.2–AA.3 supplies homogeneous quotient measure and the lattice property. LieGroups Layer 2 supplies the Lie-subgroup correspondence. ReductiveGroups Layers 3–4 and LieHighestWeight Layer 0 supply the algebraic stabilizer, functorial Jordan and standard highest-weight module inputs used below. Their current implementations postdate the pinned Tau Ceti commit and are exact supplier requests, not baseline declarations.

RealAlgebraicGeometry Layers 6–7 are checked against current upstream main. GN.4 uses CAD, choice, dimensions, fibrewise closure and a finite C¹ partition, rather than developing their theory again. The current Layer 7 does not itself promise the last interface: the requested extension is stated under owner notes. RealAlgebraicGeometry is absent from the atlas snapshot stage registry, so its imports end at an explicit owner-interface gap; assembly must register the owner before adding formal supplier requests.

The higher-tier spectral equidistribution of CM and geodesic packets, its genus refinements and S-arithmetic joinings belong to the proposed toral-packets Part II. GN.4 supplies their carriers. The geometric sieve belongs to ArithmeticStatistics ST.2; the Markoff class-number identification belongs to ClassicalArithmeticCompletion CA.4. The assembly proposals below preserve these boundaries.

## Conventions

**Lattices.** A lattice of rank R in a real inner-product space is a discrete subgroup spanning an R-dimensional subspace; its covolume `det Λ` and successive minima `λ_1 ≤ ⋯ ≤ λ_R` are taken in that span for the closed unit ball. In this document minima are indexed from 1, as in the sources; the GN.1 nodes index them from 0. A full lattice of ℝⁿ is a `ZLattice`. The polar or dual lattice is `Λ* = {y : ⟨y, x⟩ ∈ ℤ for all x ∈ Λ}`.

**Projection volumes.** `V_J(Z)` is the outer measure of the projection of `Z ⊆ ℝⁿ` onto the coordinates in `J`, `V_j` the sum over `|J| = j`, `V_0 = 1`.

**Semialgebraic complexity.** A set has complexity at most `(k, ℓ)` if it is cut out by a sign condition on at most `k` polynomials of degree at most `ℓ`; multisets are counted with multiplicity.

**The space of lattices.** `X_n = SL_n(ℝ)/SL_n(ℤ)` with left cosets, identified with unimodular lattices by `gΓ ↦ gℤⁿ` (columns). Sources written in the row convention `Γ\G` are translated by `Γg ↦ gᵀΓ`. `μ_n` is the invariant probability.

**Implied constants.** `≪_{a,b}` means up to a constant depending only on `a, b`; every constant named in a statement is explicit or its dependence is listed.


## Sources

Each target cites the result or proof it uses, with theorem/section and page numbers. All descriptions and proofs below are the atlas’s own formulations. Indirect inputs are identified as such. The new arguments are adaptations of the cited primary formulas, not claims that those papers state the adaptations verbatim.

- **BW2014** — Fabrizio Barroero, Martin Widmer, [*Counting lattice points and o-minimal structures*](https://arxiv.org/pdf/1210.5943). arXiv:1210.5943v2, 22-page PDF retrieved 2026-10-16 (IMRN 2014) Theorem 1.1 p.2, Theorem 1.3 p.5; §2 pp.7–8; §3 Proposition 3.12 and Corollary 3.13 p.12; §4 p.13; §§5–7 pp.14–21, including Lemma 5.8, Proposition 6.1 and Lemma 6.2. Retrieved PDF has 22 pages.
- **BhargavaShankar2010** — Manjul Bhargava, Arul Shankar, [*Binary quartic forms having bounded invariants, and the boundedness of the average rank of elliptic curves*](https://arxiv.org/pdf/1006.1002v2). arXiv:1006.1002v2, 50 pages Physical p.14: Proposition 2.5 and the paragraph after it (the unipotent extension asserted without proof)
- **BLS2020** — Tim Browning, Pierre Le Boudec, Will Sawin, [*The Hasse principle for random Fano hypersurfaces*](https://arxiv.org/pdf/2006.02356v1). arXiv:2006.02356v1 (Ann. of Math. 197 (2023)); arXiv v1 read §2 (2.6) p.4; §3.1 Definition 3.2 and Lemmas 3.1, 3.3–3.6 pp.7–11; §3.4 Definition 3.17 and Lemmas 3.18–3.20 pp.19–21; §4.2 (4.1)–(4.2), Lemmas 4.2–4.3 and proofs pp.27–30; §4.5 (4.24)–(4.26), Lemma 4.8 pp.34–35.
- **BSW2025** — Manjul Bhargava, Arul Shankar, Xiaoheng Wang, [*Squarefree values of polynomial discriminants II*](https://arxiv.org/pdf/2207.05592). Forum of Mathematics, Pi 13 (2025), e17 (open access); arXiv:2207.05592v1 read for §5, whose equation numbers are one lower than the published ones from (20) on arXiv v1 §5 in full: (20)–(27), Theorem 5.1, Proposition 5.2, Theorem 5.3, Propositions 5.4–5.5, Lemma 5.6, Proposition 5.7, proof of Theorem 5.1 Published locators and the confirmed corrections E14, E15, E18 are those of the reviewed extraction PAPER-BHARGAVA-SHANKAR-WANG-25 (which read the published text)
- **EvertseGeometry** — Jan-Hendrik Evertse, [*Diophantine approximation, Chapter 2: Geometry of numbers*](https://pub.math.leidenuniv.nl/~evertsejh/dio19-2.pdf). Mastermath lecture notes, dio19-2.pdf (printed = PDF + 10) §2.3 basis/minima proof, printed pp.24–25; §2.4 Theorem 2.20 and Corollary 2.21 with proofs, printed pp.32–34 (PDF pp.22–24).
- **Widmer2010** — Martin Widmer, [*Counting primitive points of bounded height*](https://arxiv.org/pdf/1204.0927). arXiv:1204.0927 (Trans. Amer. Math. Soc. 362 (2010), 4793–4829) §5 Theorem 5.4 and proof pp.17–18; surrounding lattice-basis estimates p.16.
- **KM2021** — Peter Koymans, Djordjo Milovic, [*Joint distribution of spins*](https://arxiv.org/pdf/1809.09597v1). arXiv:1809.09597v1 Proof of Lemma 3.1, (3.9)–(3.10), p.11
- **Khayutin2019** — Ilya Khayutin, [*Joint equidistribution of CM points*](https://arxiv.org/pdf/1710.04557v3). arXiv:1710.04557v3 (Ann. of Math. 189 (2019)) §9, the class L(C_l, θ_l) and Remark 9.5, p.69; Theorem 9.7 statement, p.70 §10.3, Definition 10.8 and the sentence after it, p.90
- **IKKN2004** — Aleksandar Ivić, Ekkehard Krätzel, Manfred Kühleitner, Werner Georg Nowak, [*Lattice points in large regions and related arithmetic functions: recent developments in a very classic topic*](https://arxiv.org/pdf/math/0410522). arXiv:math/0410522 §3.1 'Lattice points in plane convex domains', van der Corput's and Huxley's estimates, pp.9–10
- **GS2022** — Amit Ghosh, Peter Sarnak, [*Integral points on Markoff type cubic surfaces*](https://arxiv.org/pdf/1706.06712v3). arXiv:1706.06712v3 (Invent. Math. 229 (2022)) §7 Lemmas 7.1–7.3 and proof pp.21–22; Lemma 9.5 and representation-pair application p.29. The strip correction yielding 1/48 was independently recomputed.
- **LWZB2024** — Yuan Liu, Melanie Matchett Wood, David Zureick-Brown, [*A predicted distribution for Galois groups of maximal unramified extensions*](https://arxiv.org/abs/1907.05002). arXiv:1907.05002v2 (Invent. Math. 237 (2024)) Lemma 12.8 and Corollary 12.9 with proof, printed pp.51–52.
- **XKV2025** — Jiajie Xue, Brian M. Kurkoski, Emanuele Viterbo, [*Construction A lattice design based on the truncated union bound*](https://arxiv.org/pdf/2502.10728v1). arXiv:2502.10728v1 §II Definition 2 and (6)–(9), printed p.2: binary Construction A, covolume and squared minimum.
- **MorrisRatner** — Dave Witte Morris, [*Ratner's theorems on unipotent flows*](https://arxiv.org/pdf/math/0310402). arXiv:math/0310402 (Chicago Lectures in Mathematics, 2005); printed = physical − 10 §1.2 Theorem 1.2.2 and ternary proof printed pp.13–15; §3.2 Mautner and mixing, printed pp.102–105; §4.7 Proposition 4.7.1 and proof printed pp.139–142; §4.8 Corollary 4.8.5 printed pp.144–145. Exercise 1.2#15 is an assigned reduction, not a supplied proof. Theorem 4.5.2 and proof, printed pp.133–134; Corollary 4.3.6, printed p.126; Lemma 4.7.5 and the projective recurrence proof, printed pp.141–142.
- **KM1998** — Dmitry Kleinbock, Gregory Margulis, [*Flows on homogeneous spaces and Diophantine approximation on manifolds*](https://arxiv.org/pdf/math/9810036). arXiv:math/9810036 (Ann. of Math. 148 (1998)) §3 (3.1), Lemma 3.1, Proposition 3.2 and interpolation proof pp.6–7; §4 marking argument, Theorem 4.1 and proof pp.9–13; §5 (5.1), Theorems 5.2–5.3 and proofs pp.13–15.
- **Miller2020** — Stephen D. Miller, [*The geometry of numbers: an automorphic perspective*](https://ow3.math.rutgers.edu/~sdmiller/Miller_automorphic_lattice_course.pdf). Rutgers graduate course notes, Spring 2020 §4 printed pp.10–11 (PDF pp.4–5); §6 printed pp.12–14 (PDF pp.6–8), including mirabolic unfolding and the explicit warning that measure normalisations still need comparison.
- **EskinLuminy** — Alex Eskin, [*Counting problems in moduli space (Luminy lecture notes)*](https://math.uchicago.edu/~eskin/luminy.pdf). author-hosted lecture notes, luminy.pdf §1, Siegel's formula and its primitive version, pp.3–4
- **DIT2016** — W. Duke, Ö. Imamoḡlu, Á. Tóth, [*Geometric invariants for real quadratic fields*](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Ann. of Math. 184 (2016), 949–990 (free from the Annals site) §2 (2.3)–(2.11) pp.951–954; §4 (4.3)–(4.5) pp.959–961; CM weight after (5.12) p.963; §7 p.972 and §9 p.978, footnote 8.
- **Duke1988** — W. Duke, [*Hyperbolic distribution problems and half-integral weight Maass forms*](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf). Published-layout author copy, Invent. Math. 92 (1988), 73–90 §1, pp.73–76: Weyl sums W_u(n), the theta series with harmonic coefficients, Heegner points and closed geodesics, Theorem 1
- **Henk2002** — Martin Henk, [*Successive Minima and Lattice Points*](https://arxiv.org/pdf/math/0204158v1). arXiv:math/0204158v1 Theorem 1.5, ceiling convention and (1.3), pp.2–3 (arXiv:math/0204158v1).
- **MST2022** — Davesh Maulik, Ananth N. Shankar, Yunqing Tang, [*Picard ranks of K3 surfaces over function fields and the Hecke orbit conjecture*](https://arxiv.org/abs/2011.08887). arXiv:2011.08887 (Invent. Math. 228 (2022)) §7 Definition 7.8 and Lemma 7.9, Corollary 7.10, Proposition 7.11 and proof, pp.28–29 (arXiv:2011.08887v1); the count explicitly includes the constant term.
- **SSTT2022** — Ananth N. Shankar, Arul Shankar, Yunqing Tang, Salim Tayou, [*Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields*](https://arxiv.org/abs/1909.07473). arXiv:1909.07473v3 (Forum Math. Pi 10 (2022)) Proof of Proposition 7.7 and footnote 32, p.37 in the retrieved arXiv:1909.07473v3 (the inherited p.40 locator was incorrect for this PDF).
- **RegevTransference** — Oded Regev; scribe Elad Verbin, [*Transference Theorems, Lattices in Computer Science, Lecture 11*](https://cims.nyu.edu/~regev/teaching/lattices_fall_2004/ln/transference.pdf). Fall 2004 lecture notes Theorem 4 and Gaussian proof, especially Lemmas 7–9, pp.5–6.
- **Benoist2019** — Yves Benoist, [*Arithmeticity of discrete subgroups*](https://www.imo.universite-paris-saclay.fr/~yves.benoist/prepubli/19ArithmeticityLectures.pdf). Author notes for 2018/2019 lectures Lattice space, Mahler compactness and Fact 1.5, physical pp.5–7.
- **NV2021** — Paul D. Nelson, Akshay Venkatesh, [*The orbit method and analysis of automorphic forms*](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf). Acta Math. 226 (2021), 1–209 Published archive copy: §27, Lemma 27.8 and proof, pp.184–185; context p.183. This is an application of Morris Proposition 4.7.1, not a substitute proof of Borel density.
- **BG2006** — Valentin Blomer, Andrew Granville, [*Estimates for representation numbers of quadratic forms*](https://dms.umontreal.ca/~andrew/PDF/quadraticforms.pdf). Author-hosted journal proof layout, Duke Math. J. 135 (2006), no.2 §1.1 fundamental-discriminant convention pp.2–3; Theorem 2 p.5. This source does not directly imply the former all-d representation-pair target.
- **LeBoudec2020** — Pierre Le Boudec, [*Height of rational points on random Fano hypersurfaces*](https://arxiv.org/pdf/2006.02288v1). arXiv:2006.02288v1, 3 June 2020 §2.1, Lemmas 1–3 and proofs, printed pp.5–7; all radii and constants checked in Lemma 3.
- **Toma2020** — Radu Toma, [*Estimates for representation numbers of binary quadratic forms and Apollonian circle packings*](https://radustoma.github.io/articole/Estimates-BQFs-ACPs.pdf). Author-hosted article, Journal of Number Theory 214 (2020), 399–413; PDF pagination 1–15 Theorem 1, PDF pp.3–4; Theorem 3 and its proof, pp.4–7; §3 conductor descent and proof of Theorem 1, pp.8–9.
- **BCR1998** — Jacek Bochnak, Michel Coste, Marie-Françoise Roy, *Real Algebraic Geometry*. Springer, Ergebnisse 36, 1998; maintainer-cleared private reading copy Theorem 2.8.8, pp.52–53; Proposition 2.8.13, p.53; Proposition 2.8.14, p.54; inverse and implicit function results 2.9.7–2.9.8, pp.56–57; smooth semialgebraic partition Proposition 2.9.10 and proof, p.57. Read in the maintainer-cleared library; the file and source passages are not reproduced.
- **KN2004** — Ekkehard Krätzel and Werner Georg Nowak, [*Effektive Abschätzungen für den Gitterrest gewisser ebener und dreidimensionaler Bereiche*](https://arxiv.org/pdf/math/0405215v1). arXiv:math/0405215v1, 12 May 2004; Monatsh. Math. 146 (2005), 21–35 §3 smoothing bracket and Poisson formula (3.4), pp.4–5; Satz 2, formula (3.18)–(3.20) and proof sketch, pp.8–9. The source’s G₀,G₁-dependent numerical count is not silently treated as a uniform-shape theorem.

## How the targets fit together

The unipotent estimate changes the lattice to u⁻¹ℤⁿ, whose successive minima are at least one; it never integrates a semialgebraic fibre-volume function. The Barroero–Widmer chain passes from coordinate multiplicity to Hausdorff measure, then to definable sections and orthogonal projections, and finally handles fibre closure and boundary. The primitive-ball logarithmic error comes from a Möbius split at T/Y.

The representation-pair estimate has the restricted range 16d² ≤ K and uses Toma’s conductor formula for nonfundamental discriminants. The ellipse route has an absolute constant at exponent 2/3, obtained from the primary Fourier formula with thin ellipses separated. The improved Huxley range is conditional on the separate uniform-shape input stated explicitly below.

The nondivergence chain uses the pinned prescribed-ball Besicovitch theorem, the marked-poset estimate and primitive flags with the maximum Plücker norm. Borel density uses projective recurrence and the existing Chevalley stabilizer theorem. The intermediate-subgroup lemma uses a concrete five-dimensional matrix module and the existing irreducibility theorem. Homogeneous mixing consumes the base Howe–Moore theorem with its inherited proof gap.

## Targets

### 4.6 Davenport's principle and semialgebraic regions

The bounded-complexity family includes all coefficient and sign choices and all linear maps, with a bounding-ball parameter. All fibres of the retained family are bounded. Multiset estimates apply layer by layer to superlevel sets.

<a id="coordinate-projection-volumes"></a>
#### Volumes of coordinate projections

`GN.4/coordinate-projection-volumes` · definition

Let n ≥ 1 and Z ⊆ ℝⁿ (ℝⁿ = Fin n → ℝ with Lebesgue measure). For J ⊆ Fin n let π_J : ℝⁿ → ℝ^J be the coordinate projection and V_J(Z) = vol_J(π_J(Z)) ∈ [0, ∞] its outer Lebesgue measure on ℝ^J. For 0 ≤ j ≤ n put V_j(Z) = Σ_{|J| = j} V_J(Z), with the convention V_0(Z) = 1, so V_n(Z) = vol(Z). The projection maximum of Bhargava–Shankar is Vol(Z̄) = max{V_J(Z) : 1 ≤ |J| ≤ n − 1}, which is 0 when n = 1.

**Hypotheses.**

- n ≥ 1; Z arbitrary (outer measure, so no measurability is assumed). V_0 = 1 is a convention for the constant term of the error, not the measure of a point; it is used even for Z = ∅ only inside error bounds, which are then trivially true.

**Uses.**

- Davenport 1951 / Barroero–Widmer Theorem 1.1, p.2: the error term Σ h^{n−j} V_j(Z) of Davenport's principle
- Bhargava–Shankar Proposition 2.5, physical p.14: the error O(max(Vol(R̄), 1)) for semialgebraic multisets
- Barroero–Widmer Theorem 1.3, p.5: the error Σ_j V_j(Z_T)/(λ_1⋯λ_j) for definable families
- ArithmeticStatistics:ST.2 (Davenport request): consumers estimate projection volumes of fundamental-domain pieces

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.coordProjVolume` (constructor): coordProjVolume Z J = volume (π_J '' Z) in ℝ≥0∞, for J : Finset (Fin n).
- `TauCeti.GeometryOfNumbersPlan.coordProjVolumeSum` (data): coordProjVolumeSum Z j = Σ_{J.card = j} coordProjVolume Z J for 1 ≤ j, and = 1 for j = 0.
- `TauCeti.GeometryOfNumbersPlan.projMaxVolume` (data): projMaxVolume Z = ⨆ over J with 1 ≤ J.card ≤ n − 1 of coordProjVolume Z J (0 when n = 1).
- `TauCeti.GeometryOfNumbersPlan.coordProjVolume_univ` (simp): coordProjVolume Z univ = volume Z.
- `TauCeti.GeometryOfNumbersPlan.coordProjVolumeSum_zero` (simp): coordProjVolumeSum Z 0 = 1.
- `TauCeti.GeometryOfNumbersPlan.coordProjVolume_mono` (structure): Z ⊆ Z' → coordProjVolume Z J ≤ coordProjVolume Z' J.
- `TauCeti.GeometryOfNumbersPlan.coordProjVolume_vadd` (relation): coordProjVolume (v +ᵥ Z) J = coordProjVolume Z J.
- `TauCeti.GeometryOfNumbersPlan.coordProjVolume_smul` (relation): coordProjVolume (c • Z) J = ‖c‖₊^{J.card} * coordProjVolume Z J.
- `TauCeti.GeometryOfNumbersPlan.coordProjVolume_unipotent_final` (relation): For u upper triangular unipotent and J = {k, …, n − 1}, coordProjVolume (u '' Z) J = coordProjVolume Z J.
- `TauCeti.GeometryOfNumbersPlan.coordProjVolume_le_of_proj` (compatibility): For J' ⊆ J, π_{J'} factors through π_J, and coordProjVolume of a set equals the volume of its image in ℝ^J composed with the further projection.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.coordProjVolume_unitCube` (computation): For Z = [0,1]ⁿ, coordProjVolume Z J = 1 for every J and coordProjVolumeSum Z j = Nat.choose n j.
- `TauCeti.GeometryOfNumbersPlan.coordProjVolume_box` (computation): For Z = [0,a] × [0,b] ⊂ ℝ² with a, b ≥ 0: coordProjVolumeSum Z 1 = a + b and coordProjVolumeSum Z 2 = a·b.
- `TauCeti.GeometryOfNumbersPlan.coordProjVolume_empty` (degenerate): coordProjVolume ∅ J = 0 for J nonempty, while coordProjVolumeSum ∅ 0 = 1.
- `TauCeti.GeometryOfNumbersPlan.coordProjVolume_diagonal` (non-example): The diagonal segment {(t,t) : 0 ≤ t ≤ 1} ⊂ ℝ² has volume 0 but coordProjVolumeSum 1 = 2: the volume alone does not control the projections.
- `TauCeti.GeometryOfNumbersPlan.proj_volume_shear` (non-example): For u(x,y) = (x + 10y, y) and Z = [0,1]², the projection of u '' Z onto the first coordinate has length 11 while that of Z has length 1: only final-segment projections are unipotent-invariant.

**Proof plan.**

1. V_J is the composite of the image under the measurable linear map π_J with the outer measure on ℝ^J; V_{Fin n} = vol because π_{Fin n} is the identity up to the canonical equivalence ℝⁿ ≃ ℝ^{Fin n}.
2. Monotonicity, translation invariance and the scaling law |c|^{|J|} follow from the same properties of Lebesgue measure on ℝ^J and from π_J(c·Z + v) = c·π_J(Z) + π_J(v).
3. For an upper triangular unipotent u (u_ii = 1, u_ij = 0 for i > j) and a final segment J = {k, …, n − 1}, π_J ∘ u = u_J ∘ π_J with u_J the unipotent lower-right block, so V_J(uZ) = V_J(Z); for other J this fails (test proj_volume_shear).

**Acceptance checks.**

- The unit cube has V_J = 1 for every J and V_j = C(n, j).
- For the box [0, a] × [0, b] ⊂ ℝ²: V_1 = a + b, V_2 = ab.

**Intended library:** `TauCeti/GeometryOfNumbers/DavenportPrinciple`; namespace `TauCeti.GeometryOfNumbersPlan`; target `coordProjVolume`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:MeasureTheory.Measure.pi`
- `mathlib:MeasureTheory.Measure.addHaar_image_linearMap`
- `mathlib:MeasureTheory.Measure.addHaar_smul`

**Source locators.**

- **BW2014**, Theorem 1.1, p.2 (arXiv:1210.5943): Defines V_j as the sum of the j-dimensional volumes of the projections onto the coordinate subspaces obtained by setting n − j coordinates to zero, with V_0 = 1; this node is that quantity with outer measure.
- **BhargavaShankar2010**, Proposition 2.5, physical p.14 (arXiv:1006.1002v2): Vol(R̄) is the largest volume of a projection of R onto a coordinate subspace of dimension 1 to n − 1; recorded here as the projection maximum.

<a id="davenport-principle"></a>
#### Davenport's principle for coordinate-convex regions

`GN.4/davenport-principle` · theorem

Let n ≥ 1, h ≥ 1 and Z ⊆ ℝⁿ compact. Suppose (1) every line parallel to a coordinate axis meets Z in the empty set or a union of at most h closed intervals (single points allowed), and (2) for every J ⊆ Fin n with 1 ≤ |J| ≤ n − 1 the projection π_J(Z) ⊆ ℝ^J has the same property for lines parallel to the axes of ℝ^J. Then |#(Z ∩ ℤⁿ) − vol(Z)| ≤ Σ_{j=0}^{n−1} h^{n−j} V_j(Z), with V_j as in coordinate-projection-volumes (V_0 = 1).

**Hypotheses.**

- Compactness makes every projection compact, hence measurable, and every interval of a line section closed.
- The constant is explicit; no uniformity in a family is claimed here (that is semialgebraic-interval-condition).

**Proof plan.**

1. n = 1: Z is a union of at most h closed intervals I and |#(I ∩ ℤ) − len I| ≤ 1 for each.
2. n > 1: write N(Z) = Σ_{t∈ℤ} N(Z^{(t)}) over the slices Z^{(t)} = {y ∈ ℝ^{n−1} : (t, y) ∈ Z}. Each slice satisfies (1)–(2) in dimension n − 1, since the projections of a slice are slices of projections of Z and lines in a slice are lines in ℝⁿ; apply the induction hypothesis.
3. Main term: by Tonelli, Σ_{t∈ℤ} vol_{n−1}(Z^{(t)}) = ∫_{ℝ^{n−1}} #{t ∈ ℤ : (t, y) ∈ Z} dy, and the integrand differs from the length of the fibre over y by at most h, so the sum is vol(Z) + O(h·V_{n−1}-term of the projection forgetting the first coordinate).
4. Error terms: Σ_t V_J(Z^{(t)}) for J ⊆ {2, …, n} is again a lattice sum of slice volumes of π_{{1}∪J}(Z), estimated by the same Tonelli step; collecting the powers of h gives the stated bound (Davenport's induction, as reproduced by Barroero–Widmer).

**Acceptance checks.**

- Z = [0, N]ⁿ with N ∈ ℕ: #(Z ∩ ℤⁿ) − vol Z = (N+1)ⁿ − Nⁿ ≤ Σ_{j<n} C(n,j) N^j, the bound with h = 1.
- A finite set of h points on the x-axis in ℝ¹ has volume 0 and at most h lattice points: the bound h·V_0 = h is attained.

**Intended library:** `TauCeti/GeometryOfNumbers/DavenportPrinciple`; namespace `TauCeti.GeometryOfNumbersPlan`; target `abs_card_inter_sub_volume_le_davenport`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/coordinate-projection-volumes`
- `mathlib:MeasureTheory.lintegral_prod`
- `mathlib:MeasureTheory.Measure.prod_apply`
- `mathlib:Real.volume_Icc`
- `mathlib:IsCompact.image`

**Source locators.**

- **BW2014**, Theorem 1.1, p.2 (arXiv:1210.5943), quoting Davenport, J. London Math. Soc. 26 (1951), 179–183: States exactly this inequality for compact sets satisfying the two interval conditions, with V_0 = 1.
- **BW2014**, §2, Lemma 2.1, p.7: Applies the principle after a linear change of variables taking a lattice to ℤⁿ, the form used in semialgebraic-family-lattice-count.

<a id="semialgebraic-complexity"></a>
#### Semialgebraic sets and multisets of bounded complexity

`GN.4/semialgebraic-complexity` · definition

Let n, k, ℓ ∈ ℕ. A set S ⊆ ℝⁿ has description complexity at most (k, ℓ) if there are polynomials f_1, …, f_k ∈ ℝ[x_1, …, x_n] of total degree ≤ ℓ and a set Σ ⊆ {−1, 0, 1}^k of sign vectors with S = {x : (sign f_1(x), …, sign f_k(x)) ∈ Σ}. A bounded semialgebraic multiset of maximal multiplicity m and complexity (k, ℓ) is a function μ : ℝⁿ → {0, …, m} with bounded support such that each superlevel set {μ ≥ i}, 1 ≤ i ≤ m, has complexity at most (k, ℓ); its lattice count is Σ_{x∈ℤⁿ} μ(x) and its volume is ∫ μ. Every set given by a Boolean combination of at most k polynomial equalities and inequalities of degree ≤ ℓ has complexity at most (k, ℓ).

**Hypotheses.**

- The sign vector set Σ is arbitrary, so complements, intersections and unions are covered without changing the polynomials.
- A multiset counts lattice points with multiplicity; a set is the case m = 1.

**Uses.**

- Bhargava–Shankar Proposition 2.5, physical p.14: the class of regions whose lattice points are counted
- Bhargava–Shankar–Wang 2025, Proposition 4.1: fundamental-domain pieces of binary-form spaces are semialgebraic multisets
- ArithmeticStatistics:ST.2 consumers: apply the estimate to (R − v₀)/m, so the complexity must be invariant under affine changes of variables
- semialgebraic-interval-condition (this packet): uniform interval counts on lines from the complexity alone

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.HasComplexity` (constructor): HasComplexity k ℓ S ↔ ∃ f : Fin k → MvPolynomial (Fin n) ℝ, (∀ i, (f i).totalDegree ≤ ℓ) ∧ ∃ Σ : Set (Fin k → SignType), S = {x | (fun i ↦ SignType.sign (eval x (f i))) ∈ Σ}.
- `TauCeti.GeometryOfNumbersPlan.HasComplexity.compl` (structure): HasComplexity k ℓ S → HasComplexity k ℓ Sᶜ.
- `TauCeti.GeometryOfNumbersPlan.HasComplexity.inter` (structure): HasComplexity k ℓ S → HasComplexity k' ℓ' T → HasComplexity (k + k') (max ℓ ℓ') (S ∩ T).
- `TauCeti.GeometryOfNumbersPlan.HasComplexity.union` (structure): The same bound for S ∪ T.
- `TauCeti.GeometryOfNumbersPlan.HasComplexity.mono` (structure): k ≤ k' → ℓ ≤ ℓ' → HasComplexity k ℓ S → HasComplexity k' ℓ' S.
- `TauCeti.GeometryOfNumbersPlan.HasComplexity.image_affine` (functoriality): For an invertible affine map e of ℝⁿ, HasComplexity k ℓ S → HasComplexity k ℓ (e '' S).
- `TauCeti.GeometryOfNumbersPlan.HasComplexity.preimage_affine` (functoriality): For an affine map a : ℝ^d → ℝⁿ, HasComplexity k ℓ S → HasComplexity k ℓ (a ⁻¹' S).
- `TauCeti.GeometryOfNumbersPlan.HasComplexity.isSemialgebraic` (compatibility): Every HasComplexity set is semialgebraic in the sense of Tau Ceti's IsSemialgebraic (on Tau Ceti main, not at the pin): a finite Boolean combination of zero sets and positivity sets.
- `TauCeti.GeometryOfNumbersPlan.exists_hasComplexity` (equivalence): Every semialgebraic S ⊆ ℝⁿ has HasComplexity k ℓ S for some k, ℓ.
- `TauCeti.GeometryOfNumbersPlan.SemialgebraicMultiset` (structure): A structure with μ : ℝⁿ → ℕ, μ ≤ m, bounded support, and HasComplexity k ℓ {x | i ≤ μ x} for 1 ≤ i ≤ m.
- `TauCeti.GeometryOfNumbersPlan.SemialgebraicMultiset.latticeCount` (data): Σ_{x ∈ ℤⁿ} μ x (finite by boundedness).
- `TauCeti.GeometryOfNumbersPlan.SemialgebraicMultiset.volume` (data): ∫ μ = Σ_{i=1}^m vol {μ ≥ i}.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.hasComplexity_closedBall` (computation): HasComplexity 1 2 (Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1), via f = 1 − Σ x_i² and Σ = {0, 1}.
- `TauCeti.GeometryOfNumbersPlan.hasComplexity_Icc` (computation): For a ≤ b in ℝ, HasComplexity 1 2 (Set.Icc a b) via (x − a)(b − x).
- `TauCeti.GeometryOfNumbersPlan.hasComplexity_empty_univ` (degenerate): HasComplexity 0 0 ∅ and HasComplexity 0 0 univ (Σ = ∅, resp. Σ = all of the singleton set of sign vectors).
- `TauCeti.GeometryOfNumbersPlan.not_hasComplexity_integers` (non-example): ℤ ⊆ ℝ has no complexity (k, ℓ): a set of complexity (k, ℓ) in ℝ has at most kℓ + 1 connected components.
- `TauCeti.GeometryOfNumbersPlan.multiset_count_double` (characterisation): For μ = 2·1_{[0,N]} on ℝ (m = 2) the lattice count is 2(N + 1) and the volume is 2N; forgetting multiplicity would give N + 1.

**Proof plan.**

1. Closure properties: complement replaces Σ by its complement; intersection and union of complexity (k, ℓ) and (k', ℓ') sets have complexity (k + k', max(ℓ, ℓ')).
2. Invertible affine changes of variables x ↦ Ax + b preserve total degree, so u(S), S − v and S/m have the same complexity; restriction to an affine subspace parametrised affinely by ℝ^d gives a set of complexity (k, ℓ) in ℝ^d.
3. Each complexity-(k, ℓ) set is semialgebraic (a finite Boolean combination of zero and positivity sets of polynomials); conversely a semialgebraic set has some complexity (finitely many polynomials occur in any description).

**Acceptance checks.**

- The closed unit ball has complexity (1, 2).
- A finite union of h points of ℝ has complexity (1, h).

**Intended library:** `TauCeti/GeometryOfNumbers/Semialgebraic`; namespace `TauCeti.GeometryOfNumbersPlan`; target `HasComplexity`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:MvPolynomial`
- `mathlib:MvPolynomial.totalDegree`
- `mathlib:MvPolynomial.eval`
- `mathlib:SignType.sign`

**Source locators.**

- **BhargavaShankar2010**, Proposition 2.5, physical p.14 (arXiv:1006.1002v2): Bounded semialgebraic multisets with maximal multiplicity m defined by at most k polynomial inequalities of degree at most ℓ; the constant of the Davenport estimate depends only on (n, m, k, ℓ).
- **BW2014**, §1, p.3 and §3, pp.11–13 (arXiv:1210.5943): Semialgebraic sets as the definable sets of the o-minimal structure of real semialgebraic sets, the setting of the family count.

<a id="semialgebraic-uniform-components"></a>
#### Uniform bound on connected components in semialgebraic families

`GN.4/semialgebraic-uniform-components` · theorem

Let S ⊆ ℝ^{m+n} be semialgebraic and for a ∈ ℝ^m let S_a = {x ∈ ℝⁿ : (a, x) ∈ S}. There is M_S ∈ ℕ such that every fibre S_a is a disjoint union of at most M_S cells (in the cylindrical sense), and in particular has at most M_S connected components. Consequently, for all n, k, ℓ there is B(n, k, ℓ) such that every set of complexity at most (k, ℓ) in ℝⁿ has at most B(n, k, ℓ) connected components.

**Hypotheses.**

- S semialgebraic; the bound M_S depends on S only, not on a.
- The consequence uses, for each of the finitely many sign-vector sets Σ ⊆ {−1,0,1}^k, the family parametrised by the coefficient vectors of k polynomials of degree ≤ ℓ.

**Proof plan.**

1. Take a cylindrical decomposition of ℝ^{m+n} adapted to S (cylindrical algebraic decomposition). Its restriction to each fibre over a ∈ ℝ^m is a decomposition of ℝⁿ into at most as many cells, partitioning S_a.
2. Cells are connected, so S_a has at most M_S = (number of cells of the decomposition) connected components.
3. For the consequence: the set {(c, x) : x lies in the complexity-(k, ℓ) set with coefficient vector c and sign set Σ} is semialgebraic in ℝ^{N+n}, N the number of coefficients; take B = the maximum of the M_S over the finitely many Σ.

**Acceptance checks.**

- For k = 1, ℓ = 2 in ℝ¹ (sets {sign(ax² + bx + c) ∈ Σ}) every such set has at most 3 components.
- The fibres of S = {(a, x) : x² < a} are empty or one interval: M_S = 1 suffices for the component count.

**Intended library:** `TauCeti/GeometryOfNumbers/Semialgebraic`; namespace `TauCeti.GeometryOfNumbersPlan`; target `exists_card_components_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-complexity`
- `mathlib:IsPreconnected`

**Source locators.**

- **BW2014**, §3, Proposition 3.12 and Corollary 3.13, p.12 (arXiv:1210.5943), quoting van den Dries, Tame topology and o-minimal structures, Ch. 3, (3.5): Corollary 3.13: a definable family has a uniform bound M_S on the number of cells partitioning each fibre, hence on the number of connected components; semialgebraic families are definable.

<a id="semialgebraic-interval-condition"></a>
#### Davenport's interval condition for semialgebraic regions

`GN.4/semialgebraic-interval-condition` · lemma

For fixed n, k, ℓ there is h(n,k,ℓ) such that every set Z ⊆ ℝⁿ with complexity at most (k,ℓ), each of its coordinate projections, and every axis-parallel line section of those projections have at most h connected components (intervals, allowing points and open or half-open endpoints). More generally, for a fixed semialgebraic family Z ⊆ ℝ^{m+n} there is h_Z working simultaneously for every linear image Ψ(Z_T), every parameter T, and all its coordinate projections.

**Hypotheses.**

- Linear maps Ψ are unrestricted and need not be invertible. No fibre-volume function or iterated superlevel family is part of this assertion.

**Proof plan.**

1. Encode the coefficients of Ψ and the parameter T in W={(Ψ,T,y): ∃x, (T,x)∈Z and y=Ψx}. This is a single semialgebraic family by projection closure; its description does not change with Ψ.
2. For each coordinate set J and axis i∈J, encode the remaining fixed coordinates of the line as more parameters. Apply semialgebraic-uniform-components to the resulting family of subsets of ℝ. There are only finitely many choices of J,i; take the maximum of their bounds.
3. For bounded complexity, use a universal coefficient family of k polynomials of degree at most ℓ and a sign selector. A selector is a subset of the finite set {−1,0,1}^k, so finitely many universal families suffice. The maximum of their constants depends only on n,k,ℓ.

**Acceptance checks.**

- For the open unit disc in ℝ² every axis-parallel line section is one interval and each projection is (−1, 1): h = 1 works.
- For a set of complexity (1, ℓ) in ℝ¹, h = ℓ + 1 works.

**Intended library:** `TauCeti/GeometryOfNumbers/Semialgebraic`; namespace `TauCeti.GeometryOfNumbersPlan`; target `hasComplexity_interval_condition`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-complexity`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-uniform-components`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/coordinate-projection-volumes`
- `mathlib:IsPreconnected.image`
- `mathlib:isPreconnected_iff_ordConnected`

**Source locators.**

- **BW2014**, §4 'The Davenport constant', p.13, and Corollary 3.13, p.12 (arXiv:1210.5943): Shows that a definable family has a uniform Davenport constant: the number of connected components of the intersection of a line with a projection of a fibre is uniformly bounded; this lemma is the semialgebraic case with the bound depending on (n, k, ℓ).
- **BhargavaShankar2010**, Proposition 2.5 and the paragraph after it, physical p.14: Asserts that Davenport's argument applies to bounded semialgebraic multisets with a constant depending only on (n, m, k, ℓ); the interval condition is the input that makes this so.

<a id="unipotent-davenport-transfer"></a>
#### Davenport's estimate for triangular unipotent images

`GN.4/unipotent-davenport-transfer` · lemma

For n≥1 and k,ℓ∈ℕ there is C(n,k,ℓ) such that for every bounded semialgebraic Z⊆ℝⁿ of complexity at most (k,ℓ) and every upper or lower triangular unipotent real matrix u, |#(uZ∩ℤⁿ)−vol(Z)| ≤ C(n,k,ℓ) Σ_{j=0}^{n−1} V_j(Z). The volumes are those of Z. For a semialgebraic multiset with multiplicity at most m and with each multiplicity superlevel set of complexity at most (k,ℓ), the same estimate holds with constant m C(n,k,ℓ) and the corresponding sum of projection volumes of those sets.

**Hypotheses.**

- No integrality of u is needed. The multiplicity-zero exterior is excluded from the superlevel decomposition.

**Proof plan.**

1. Put Λ=u⁻¹ℤⁿ. Its covolume is one and x↦ux is a bijection Z∩Λ→uZ∩ℤⁿ.
2. For z∈ℤⁿ nonzero, choose its last nonzero coordinate i when u is upper triangular. The i-th coordinate of u⁻¹z equals the nonzero integer z_i, since all subsequent z_j vanish. Thus ‖u⁻¹z‖∞≥1 and ‖u⁻¹z‖₂≥1. Every Euclidean successive minimum of Λ is therefore at least one. For lower triangular u use the first nonzero coordinate.
3. Apply semialgebraic-family-lattice-count to Z and Λ. For each sign selector use the universal polynomial-coefficient family intersected with a closed Euclidean ball whose radius is another parameter. All fibres of this enlarged family are bounded, as BW Theorem 1.3 requires; every bounded complexity-(k,ℓ) set occurs unchanged by taking a sufficiently large radius. There are finitely many sign selectors, so the maximum constant depends only on n,k,ℓ. Drop the minima denominators, which are at least one. No fibre-volume function is integrated.
4. For a multiset, sum the estimate over the m nonempty multiplicity superlevel sets. This also proves the base packet’s Bhargava–Shankar multiset clause after bounding the finite projection sum by a dimension constant times max(1, largest proper coordinate projection volume).

**Acceptance checks.**

- u = identity recovers davenport-principle up to the constant.
- n = 2, Z = [0, ε] × [0, T], u(x, y) = (x + ay, y): the count is at most 2(⌊T⌋ + 1) for every a, within C·(1 + ε + T) as the lemma predicts, although the projection of uZ to the first axis has length ε + aT.

**Intended library:** `TauCeti/GeometryOfNumbers/DavenportPrinciple`; namespace `TauCeti.GeometryOfNumbersPlan`; target `abs_card_unipotent_image_inter_sub_volume_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-family-lattice-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-complexity`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/coordinate-projection-volumes`

**Source locators.**

- **BhargavaShankar2010**, Proposition 2.5 and following paragraph, physical p.14: The asserted triangular unipotent estimate is recovered with the original projection volumes. The proof here uses a different route and makes no source-error claim.
- **BW2014**, Theorem 1.3, p.5; Lemma 4.1, pp.13–14: The lattice-uniform theorem applied to u⁻¹ℤⁿ, together with the elementary last-coordinate argument, gives the estimate.

### 4.7 Counting by successive minima

All lattice constants and parameter ranges are stated explicitly. The four projection-comparison targets expose the key BW inputs that were missing from the previous proof sketch.

<a id="ball-count-successive-minima"></a>
#### Lattice points in a ball, by successive minima

`GN.4/ball-count-successive-minima` · theorem

Let Λ is a discrete subgroup of a finite-dimensional real inner-product space E, of rank R ≥ 1, viewed as a full lattice in V = span_ℝ Λ with its induced inner product; λ_1 ≤ … ≤ λ_R are its successive minima for the closed unit ball of V (GN.1 successive-minimum, one-based here) and det Λ its covolume in V. Then for every T > 0, #(Λ ∩ B̄(0, T)) ≤ 2^{3R−1}·Σ_{j=0}^{R} T^j/(λ_1⋯λ_j), the j = 0 term being 1. In particular #(Λ ∩ B̄(0, T)) ≤ 2^{3R−1}(R + 1)·max_{0≤j≤R} T^j/(λ_1⋯λ_j).

**Hypotheses.**

- No lower bound on T is needed; for T < λ_1 the count is 1 and only the j = 0 term matters.
- The constant is explicit; the ambient dimension of E plays no role.

**Proof plan.**

1. Transport Λ isometrically to a full lattice in ℝ^R (GN.1 successive-minimum-linear-equiv); the minima are unchanged.
2. Apply Henk Theorem 1.5 (pp.2–3) with its ceiling factors: for R ≥ 2 the count is < 2^{R−1}∏_i ceil(2T/λ_i + 1). For R = 1 use the direct interval count ≤ 1 + 2T/λ_1.
3. Since ceil(2x+1) ≤ 2(1+x) for x ≥ 0, expand the product. For each subset I of size j, ∏_{i∈I} λ_i ≥ λ_1⋯λ_j; hence the bound is ≤ 2^{2R−1}Σ_j binom(R,j)T^j/(λ_1⋯λ_j) ≤ 2^{3R−1}Σ_j T^j/(λ_1⋯λ_j). The rank-one interval bound also satisfies the displayed estimate.

**Acceptance checks.**

- Λ = ℤ^R, T = 1: the count is 2R + 1 and the bound is 2^{3R−1}(R + 1).
- Λ = aℤ with a > 2T: the count is 1, the j = 0 term.

**Intended library:** `TauCeti/GeometryOfNumbers/SuccessiveMinimaCount`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_inter_closedBall_le_successiveMinima`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/henk-successive-minima-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/first-minimum-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-smul-body`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-linear-equiv`

**Source locators.**

- **BLS2020**, Lemma 3.5, first bound, p.9 (arXiv:2006.02356v1), citing Schmidt, Duke Math. J. 35 (1968), Lemma 2: The count of lattice points of a rank-R lattice in a ball of radius T ≥ 1 is ≪_R Σ_i T^{R−i}/(λ_1⋯λ_{R−i}).
- **Henk2002**, Theorem 1.5 and inequality (1.3), pp.2–3: The product bound used in the proof, with explicit constant.
- **BSW2025**, Proposition 5.2, p.22 (published numbering): The same estimate for a bounded domain, quoted from Schmidt; see bounded-domain-count.

<a id="ball-count-intermediate-minimum"></a>
#### Ball count past an intermediate minimum

`GN.4/ball-count-intermediate-minimum` · lemma

Let Λ is a discrete subgroup of a finite-dimensional real inner-product space E, of rank R ≥ 1, viewed as a full lattice in V = span_ℝ Λ with its induced inner product; λ_1 ≤ … ≤ λ_R are its successive minima for the closed unit ball of V (GN.1 successive-minimum, one-based here) and det Λ its covolume in V. If 1 ≤ i₀ ≤ R and T ≥ λ_{i₀}, then #(Λ ∩ B̄(0, T)) ≤ C_R·T^R/(λ_1⋯λ_{i₀−1}·λ_{i₀}^{R−i₀+1}), with C_R = 2^{3R−1}(R + 1).

**Hypotheses.**

- T ≥ λ_{i₀} is required: for smaller T the right-hand side can be smaller than 1.

**Proof plan.**

1. Start from ball-count-successive-minima. For j ≤ i₀ − 1 bound T^j/(λ_1⋯λ_j) by T^R/(λ_1⋯λ_{i₀−1}λ_{i₀}^{R−i₀+1}) using T ≥ λ_{i₀} ≥ λ_i (i ≤ i₀); for j ≥ i₀ use λ_i ≥ λ_{i₀} for i ≥ i₀.
2. Sum the R + 1 terms.

**Acceptance checks.**

- i₀ = R: the bound reads T^R/(λ_1⋯λ_R) ≍ T^R/det Λ, the volume order.
- i₀ = 1: T^R/λ_1^R.

**Intended library:** `TauCeti/GeometryOfNumbers/SuccessiveMinimaCount`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_inter_closedBall_le_of_minimum_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ball-count-successive-minima`

**Source locators.**

- **BLS2020**, Lemma 3.5, second bound and its proof, pp.9–10: For i₀ ∈ {1, …, R} and T ≥ λ_{i₀}, the count is ≪_R T^R/(λ_1⋯λ_{i₀−1}λ_{i₀}^{R−i₀+1}).

<a id="bounded-domain-count"></a>
#### Schmidt's count in a dilated bounded domain

`GN.4/bounded-domain-count` · theorem

Let Λ be a lattice of rank k in ℝ^m with Euclidean successive minima μ_1 ≤ … ≤ μ_k, and D ⊆ ℝ^m bounded. There is C = C(k, D) with #(Y·D ∩ Λ) ≤ C·max_{0≤j≤k} Y^j/(μ_1⋯μ_j) for every Y > 0; the j = 0 term is 1. Without the j = 0 term the bound is false whenever 0 ∈ D: the origin is always counted while every other term tends to 0 as Y → 0.

**Hypotheses.**

- The j = 0 term is necessary: for 0 ∈ D the origin is always counted.

**Proof plan.**

1. Choose r with D ⊆ B̄(0, r); then #(YD ∩ Λ) ≤ #(Λ ∩ B̄(0, rY)).
2. Apply ball-count-successive-minima and bound (rY)^j by max(1, r)^k Y^j.

**Acceptance checks.**

- Λ = ℤ^k, D = (−1, 1)^k, Y → 0: the count is 1 = the j = 0 term while every other term tends to 0.

**Intended library:** `TauCeti/GeometryOfNumbers/SuccessiveMinimaCount`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_smul_inter_le_max`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ball-count-successive-minima`

**Source locators.**

- **BSW2025**, Proposition 5.2, (22), p.22 (published Forum Math. Pi version; (21) in arXiv v1): States the bound with the maximum over 1 ≤ j ≤ k; the corrected range 0 ≤ j ≤ k is PAPER-BHARGAVA-SHANKAR-WANG-25/E14 (confirmed).
- **BLS2020**, Lemma 3.5, p.9: The ball case.

<a id="quadratic-norm-count-by-minima"></a>
#### Counting vectors of bounded norm in a definite quadratic lattice

`GN.4/quadratic-norm-count-by-minima` · theorem

Let (L, Q) be a free ℤ-module of rank r ≥ 1 with a positive definite quadratic form Q (real-valued). Let μ_i = inf{y > 0 : L contains i linearly independent vectors v with Q(v) ≤ y²} and a_i = μ_1⋯μ_i (a_0 = 1), as in GN.1 successive-minimum-partial-product. Then for every Y > 0, #{v ∈ L : Q(v) ≤ Y} ≤ 2^{3r−1}Σ_{i=0}^{r} Y^{i/2}/a_i; the nonzero count vanishes for Y < μ_1².

**Hypotheses.**

- Q positive definite on L ⊗ ℝ; the minima are in the square-root normalisation of Eskin–Katznelson.

**Proof plan.**

1. Give L ⊗ ℝ the inner product with ‖v‖² = Q(v); then L is a full lattice whose Euclidean minima are the μ_i.
2. Apply ball-count-successive-minima with T = √Y.

**Acceptance checks.**

- L = ℤ^r with Q = sum of squares: μ_i = 1, a_i = 1 and the bound is a polynomial in √Y of degree r, matching the order Y^{r/2} of the true count.

**Intended library:** `TauCeti/GeometryOfNumbers/SuccessiveMinimaCount`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_quadraticForm_le_le_partialProduct`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ball-count-successive-minima`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum-partial-product`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/integral-norm-minima-comparison`

**Source locators.**

- **MST2022**, Proof of Propositions 7.11 and 7.13 (accepted version of 25 December 2021), quoting Eskin–Katznelson, Lemma 2.4 and (5)–(6): Counts vectors of bounded Q in the lattices L_n by Σ_i Y^{i/2}/a_i with a constant depending on the rank only.
- **SSTT2022**, Proof of Proposition 7.7 and footnote 32, p.37 (retrieved PDF) (arXiv:1909.07473v3): The count of nonzero v with Q(v) < X is ≪_r Σ_i X^{i/2}/a_i.

<a id="small-vector-count"></a>
#### Counting nonzero vectors below the last minimum

`GN.4/small-vector-count` · theorem

Let Λ is a discrete subgroup of a finite-dimensional real inner-product space E, of rank R ≥ 1, viewed as a full lattice in V = span_ℝ Λ with its induced inner product; λ_1 ≤ … ≤ λ_R are its successive minima for the closed unit ball of V (GN.1 successive-minimum, one-based here) and det Λ its covolume in V. Let M > 0 with M < λ_1 and Y ≥ λ_R. (a) For 0 ≤ R₀ ≤ R − 1 and 0 < T ≤ Y: #((Λ ∖ {0}) ∩ B̄(0, T)) ≤ C_R·(T^{R−R₀}Y^{R₀}/det Λ + (T/M)^{R−R₀−1}). (b) If moreover 0 ≤ j₀ ≤ R − 1, J ≥ M with J < λ_{j₀+1}, and 0 ≤ R₀ ≤ R − 1 − j₀, then #((Λ ∖ {0}) ∩ B̄(0, T)) ≤ C_R·(T^{R−R₀}Y^{R₀}/det Λ + (T/M)^{j₀}·((T/J)^{R−R₀−1−j₀} + 1)).

**Hypotheses.**

- C_R depends only on R.
- If T ≤ M the left side is 0, so only T > M matters.

**Proof plan.**

1. (a) is (b) with j₀ = 0, J = M.
2. For T > M write the count via ball-count-successive-minima and split the sum at R₀: the terms with many minima use λ_{R−i+1}⋯λ_R ≤ Y^i and Minkowski's second theorem λ_1⋯λ_R ≍ det Λ; the others use λ_i > M for i ≤ j₀ and λ_i > J for i > j₀.
3. Sum the geometric series in T/J (T > M) as in the source.

**Acceptance checks.**

- Λ = ℤ^R, M = 1/2, Y = 1, T = 1/4: the count is 0.
- R = 1: (a) with R₀ = 0 gives a bound C(T/det Λ + 1).

**Intended library:** `TauCeti/GeometryOfNumbers/SuccessiveMinimaCount`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_ne_zero_inter_closedBall_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ball-count-successive-minima`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-lower`

**Source locators.**

- **BLS2020**, Lemma 3.6 and its proof, pp.10–11: States both bounds with implied constants depending at most on R and proves them from Lemma 3.5 and Minkowski's second theorem.

<a id="adapted-basis-coordinates"></a>
#### A basis adapted to the successive minima, with coordinate bounds

`GN.4/adapted-basis-coordinates` · theorem

Let Λ be a full lattice in an R-dimensional real inner-product space E (R ≥ 1) with successive minima λ_1 ≤ … ≤ λ_R. There is a ℤ-basis b_1, …, b_R of Λ with ‖b_j‖ ≤ j·λ_j for every j, and every x = Σ_j t_j b_j ∈ E satisfies |t_j| ≤ c_R‖x‖/λ_j for every j, where c_R = 2^R·R!/V_R and V_R is the volume of the unit ball.

**Hypotheses.**

- The coordinate bound holds for all real x, not only lattice points.
- The basis need not realise the minima.

**Proof plan.**

1. The basis comes from GN.1 basis-from-minima: b_j lies in (λ_1 + ⋯ + λ_j)·B̄, so ‖b_j‖ ≤ jλ_j.
2. Cramer's rule: t_j = det(b_1, …, x, …, b_R)/det(b_1, …, b_R), x in place j; Hadamard's inequality bounds the numerator by ‖x‖∏_{i≠j}‖b_i‖ ≤ ‖x‖∏_{i≠j} iλ_i.
3. det(b) = det Λ ≥ V_R λ_1⋯λ_R/2^R by Minkowski's second theorem; combine.

**Acceptance checks.**

- E = ℝ^R, Λ = ℤ^R: the standard basis satisfies both bounds with t_j = x_j.
- R = 1, Λ = aℤ: b_1 = a and t_1 = x/a.

**Intended library:** `TauCeti/GeometryOfNumbers/SuccessiveMinimaCount`; namespace `TauCeti.GeometryOfNumbersPlan`; target `exists_basis_abs_repr_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/basis-from-minima`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.0/orthonormal-coordinate-hadamard`
- `mathlib:Matrix.cramer`
- `mathlib:Module.Basis.det`

**Source locators.**

- **BLS2020**, Proofs of Lemmas 3.21 (pp.22–23) and 3.23 (p.24), citing Davenport, Proc. Roy. Soc. A 272 (1963), Lemma 5: Uses a basis with ‖b_j‖ ≍ λ_j in which every vector x of the lattice has coordinates of size ≪ ‖x‖/λ_j.
- **BW2014**, §2, p.7, citing Cassels, An introduction to the geometry of numbers, Lemma 8, p.135: A basis with |v_i| ≤ iλ_i, used to map the lattice to ℤⁿ before applying Davenport's principle.
- **EvertseGeometry**, §2.3, Exercise 2.8, printed p.24: The basis-from-minima input.

<a id="widmer-lipschitz-count"></a>
#### Widmer's lattice-point count for Lipschitz boundaries

`GN.4/widmer-lipschitz-count` · theorem

Let D ≥ 1, Λ a full lattice in ℝ^D with Euclidean successive minima λ_1 ≤ … ≤ λ_D, and S ⊆ ℝ^D bounded whose boundary ∂S is covered by the images of M maps [0,1]^{D−1} → ℝ^D, each Lipschitz with constant L (∂S is Lipschitz parametrisable in dimension D − 1 with these data). Then S is Lebesgue measurable and |#(S ∩ Λ) − vol(S)/det Λ| ≤ c₀(D)·M·max_{0≤i<D} L^i/(λ_1⋯λ_i), where the i = 0 term is 1 and c₀(D) = D^{3D²/2}.

**Planet:** Widmer's lattice-point count.

**Hypotheses.**

- The bound is uniform in Λ: it depends on Λ only through its minima, unlike the fixed-lattice count of GlobalNumberFields Layer 3.
- For D = 1 the boundary is a finite set of at most M points.

**Proof plan.**

1. Measurability: ∂S is a finite union of Lipschitz images of a (D−1)-cube, hence Lebesgue null.
2. Choose a basis with minimal orthogonality defect (adapted-basis-coordinates) and its fundamental parallelepiped P; #(S ∩ Λ) differs from vol(S)/det Λ by at most the number of translates of P meeting ∂S.
3. Cover each Lipschitz image by subcubes of side 1/m; each subimage has diameter ≤ L√(D−1)/m and meets a number of translates bounded by ∏_i(κL/(mλ_i) + 2) with κ the orthogonality constant; optimise m to get the maximum over i.

**Acceptance checks.**

- Λ = ℤ^D, S = [0, N]^D: the error is (N + 1)^D − N^D ≤ c₀(D)·2D·N^{D−1}, consistent with M = 2D faces of Lipschitz constant ≍ N.
- Λ = εℤ ⊕ ℤ^{D−1} with ε → 0 and S fixed: the bound grows like L/ε, the i = 1 term.

**Intended library:** `TauCeti/GeometryOfNumbers/WidmerCount`; namespace `TauCeti.GeometryOfNumbersPlan`; target `abs_card_inter_sub_volume_div_covolume_le_widmer`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/adapted-basis-coordinates`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-3-geometry-of-numbers-and-ray-class-ideal-counting`
- `mathlib:ZLattice.covolume`
- `mathlib:ZSpan.fundamentalDomain`

**Source locators.**

- **Widmer2010**, Theorem 5.4 and its proof, p.17 (arXiv:1204.0927; Trans. Amer. Math. Soc. 362 (2010)): For a lattice in ℝ^D with minima λ_i and bounded S whose boundary lies in Lip(D, 1, M, L), S is measurable and the count differs from vol S/det Λ by at most c₀(D)M max_{0≤i<D} L^i/(λ_1⋯λ_i), with c₀(D) = D^{3D²/2}.
- **KM2021**, Proof of Lemma 3.1, (3.10), p.11 (arXiv:1809.09597v1): Applies Widmer's Theorem 5.4 to dilated cubes in a family of lattices Λ_g, uniformly in g.

<a id="rectifiable-coordinate-measure-bound"></a>
#### Coordinate multiplicities control the measure of a smooth-stratified set

`GN.4/rectifiable-coordinate-measure-bound` · theorem

For 0≤j≤n and a Borel A⊆ℝⁿ that is a countable union of C¹ submanifolds of dimension at most j, H^j(A) ≤ C_{n,j} Σ_{|I|=j} ∫_{ℝ^I} #({x∈A:π_I x=y}) dy, where counts may be infinite and the nonnegative integrals are outer integrals (ordinary Lebesgue integrals for the semialgebraic application), and H^j is Mathlib’s normalized Euclidean Hausdorff measure. One may take C_{n,0}=1 and C_{n,j}=(2√binom(n,j))^j for j>0. In particular, a semialgebraic set of dimension less than j has H^j measure zero.

**Proof plan.**

1. First treat a j-dimensional C¹ manifold. At a tangent j-plane choose an orthonormal basis. Cauchy–Binet makes the sum of squares of its coordinate j-minors one, so one projection π_I has determinant at least binom(n,j)^{-1/2}. Every singular value is at most one, so the inverse differential has norm at most √binom(n,j).
2. The inverse function theorem and continuity give a neighborhood represented over a convex open subset of ℝ^I by an inverse section with Lipschitz constant at most 2√binom(n,j). Second countability supplies countably many such charts. Partition A into disjoint Borel pieces subordinate to them and group pieces by I.
3. On each piece, apply the Lipschitz image inequality to its inverse section. H^j on the coordinate plane is its Lebesgue measure by the normalization baseline. For a fixed I, summing projected-piece measures equals the integral of their multiplicity; disjointness of the original pieces bounds this by the number of points of each π_I-fibre of A. Countable additivity gives the bound. This deliberately uses a dimension constant, rather than assuming Federer’s general area formula.
4. For a lower-dimensional C¹ chart, exhaust its parameter domain by countably many bounded compact pieces on which its derivative is bounded. A k-dimensional box, k<j, has zero H^j content: cover it by O(δ^{-k}) cubes of diameter O(δ) and let δ→0. Lipschitz image bounds and countable unions prove nullity. At j=0 the assertion is just counting measure.

**Acceptance checks.**

- For a j-coordinate box the only nonzero full-rank projection contributes its volume; lower-rank projections have infinite fibres on null sets, whose nonnegative integrals are zero.
- A finite set has H^j=0 for j>0 and H^0 equal to its cardinality.
- A sloping line segment has length bounded by a dimension constant times the sum of its two coordinate lengths.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `rectifiable_coordinate_measure_bound`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:MeasureTheory.Measure.euclideanHausdorffMeasure`
- `mathlib:InnerProductSpace.euclideanHausdorffMeasure_eq_volume`
- `mathlib:Isometry.euclideanHausdorffMeasure_image`
- `mathlib:LipschitzOnWith.hausdorffMeasure_image_le`

**Source locators.**

- **BW2014**, §5, Definition 5.5, Proposition 5.6 and Theorem 5.7, pp.15–16: Identifies the needed rectifiability/coordinate-fibre measure comparison. The stated weaker dimension-constant comparison is proved here by local coordinate charts instead of importing the general Federer theorem.
- **BCR1998**, Proposition 2.9.10, p.57; Proposition 2.8.14, p.54: Supplies smooth semialgebraic strata and agreement of dimensions through the existing owner request.

<a id="semialgebraic-hausdorff-bound"></a>
#### Uniform Hausdorff bound in families of small dimension

`GN.4/semialgebraic-hausdorff-bound` · theorem

Let S⊆ℝ^{m+n} be a fixed semialgebraic family, every fibre S_a bounded with dim S_a≤j≤n. There is c_S such that H^j(S_a) ≤ c_S Σ_{|I|=j}vol_j(π_I S_a) for every a. For j=0 use the cardinality of the finite fibre and the convention that the projection of a nonempty set to ℝ⁰ has measure one.

**Proof plan.**

1. For each I the set of parameters (a,y) where the π_I-fibre has positive dimension is semialgebraic and, for fixed a, has dimension less than j by the requested fibre-dimension inequality. It has Lebesgue measure zero by the lower-dimensional clause of rectifiable-coordinate-measure-bound.
2. All remaining fibres are zero-dimensional semialgebraic sets, hence finite; semialgebraic-uniform-components bounds their cardinalities by one M for the single family (a,y)↦S_a∩π_I⁻¹(y). Take the maximum over the finitely many I.
3. Use the owner’s finite C¹ partition and the coordinate multiplicity theorem. Its right side is at most C_{n,j} M Σ_I vol(π_I S_a), since exceptional positive-dimensional fibres lie over a null set. The count of a finite zero-dimensional fibre is handled separately when j=0.

**Acceptance checks.**

- For j=n it reduces to H^n=volume with a harmless family constant.
- For j=1, n=2, a circle has length bounded by a fixed multiple of the sum of its two projection lengths.
- The constant depends on the family: N parallel copies of a segment require a factor growing with N.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `semialgebraic_hausdorff_bound`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/rectifiable-coordinate-measure-bound`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-uniform-components`

**Source locators.**

- **BW2014**, Lemma 5.8 and proof, pp.16–17: The finite-fibre multiplicity argument is specialized to semialgebraic sets, with the chart-based dimension constant replacing the sharp area comparison.

<a id="semialgebraic-boundary-null"></a>
#### Closures and boundaries of bounded semialgebraic fibres

`GN.4/semialgebraic-boundary-null` · theorem

For a fixed semialgebraic family Z⊆ℝ^{m+n} with bounded fibres, C_T=closure Z_T and B_T=frontier Z_T form semialgebraic families with compact fibres. Each B_T has n-dimensional volume zero, vol C_T=vol Z_T, and V_j(C_T)=V_j(Z_T), while V_j(B_T)≤V_j(C_T), for 1≤j≤n. For j=0 all error-bound conventions are one.

**Proof plan.**

1. Fibrewise closure and interior can be written with quantified distance inequalities; the requested owner projection/quantifier-elimination API makes the resulting families semialgebraic. A bounded fibre has compact closure.
2. By CAD dimension, dim frontier Z_T<n. Indeed frontier is the union of closure Z_T\Z_T and Z_T\interior Z_T; the former drops dimension, while the latter has no n-dimensional open cell. The lower-dimensional Hausdorff clause and H^n=volume give nullity and vol C_T=vol Z_T.
3. For any linear coordinate projection π, compactness gives π(closure Z_T)=closure(π Z_T): inclusion one way follows from continuity, and the other from taking a convergent subsequence in the bounded closure. The missing set between a semialgebraic set and its closure has dimension less than the target dimension, so its target-dimensional volume is zero. Sum over π_I; monotonicity treats B_T.

**Acceptance checks.**

- Open and closed boxes have the same volume and projection volumes although their lattice-point counts can differ.
- A planar line segment has zero planar volume; its frontier is the whole segment.
- Boundedness is necessary for π closure=closure π: the hyperbola xy=1 has a nonclosed coordinate projection.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `semialgebraic_boundary_null`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/rectifiable-coordinate-measure-bound`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/coordinate-projection-volumes`

**Source locators.**

- **BW2014**, §3 Proposition 3.15, p.13; Lemmas 5.3–5.4, p.15; §7, pp.20–21: Provides precisely the closure/frontier and projection-volume equalities used to remove compactness in Theorem 1.3.
- **BCR1998**, Proposition 2.8.13, p.53: The closure-minus-set dimension drop is consumed from the owner.

<a id="orthogonal-projection-comparison"></a>
#### Uniform comparison of orthogonal and coordinate projections

`GN.4/orthogonal-projection-comparison` · theorem

For a fixed semialgebraic family Z⊆ℝ^{m+n} with bounded fibres and 1≤j≤n, there is c_{Z,j} such that the j-volume of every orthogonal projection of Z_T to any j-plane is at most c_{Z,j} V_j(Z_T), uniformly in T and the plane. The same holds for closure Z_T.

**Proof plan.**

1. Parametrize the projection plane by φ∈O(n); let p:ℝⁿ→ℝ^j take the first j coordinates. The family of images pφ(closure Z_T) is semialgebraic. Apply the owner’s semialgebraic choice to the graph of (φ,T,x)↦pφx to select a semialgebraic section over each image. Its image S_{φ,T} lies in closure Z_T, has dimension at most j by injectivity of pφ on it, and has the same orthogonal projection as closure Z_T. No continuity of the selection is required.
2. Orthogonal projection is 1-Lipschitz; hence its j-volume is at most H^j(S_{φ,T}). Apply semialgebraic-hausdorff-bound to this single family of sections, obtaining a constant independent of φ,T.
3. Every coordinate projection of S_{φ,T} lies in the corresponding projection of closure Z_T. Bound their volumes by V_j(closure Z_T)=V_j(Z_T), using semialgebraic-boundary-null. This is the missing Proposition 6.1 step after the linear-algebraic projection estimate.

**Acceptance checks.**

- For a diagonal line segment the largest one-dimensional projection is at most the sum of its coordinate lengths.
- For j=n the comparison is equality of volume.
- Arbitrary sets need not admit a family-uniform bound; the semialgebraic family, not just each individual fibre, is fixed.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `orthogonal_projection_comparison`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-hausdorff-bound`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-boundary-null`
- `mathlib:LipschitzOnWith.hausdorffMeasure_image_le`

**Source locators.**

- **BW2014**, Proposition 6.1, pp.17,20; Lemma 6.2 and proof, pp.17–20: The family of definable sections supplies a j-dimensional subset with unchanged chosen orthogonal projection; Lemma 5.8 controls its measure by coordinate projections.

<a id="semialgebraic-family-lattice-count"></a>
#### Lattice points in semialgebraic families, uniformly in the lattice

`GN.4/semialgebraic-family-lattice-count` · theorem

Let m, n ≥ 1 and Z ⊆ ℝ^{m+n} semialgebraic with bounded fibres Z_T = {x : (T, x) ∈ Z}, T ∈ ℝ^m. There is c_Z depending only on Z such that for every full lattice Λ ⊆ ℝⁿ with successive minima λ_1 ≤ … ≤ λ_n and every T: |#(Z_T ∩ Λ) − vol(Z_T)/det Λ| ≤ c_Z·Σ_{j=0}^{n−1} V_j(Z_T)/(λ_1⋯λ_j), with V_j the coordinate projection volumes (V_0 = 1).

**Hypotheses.**

- Only semialgebraic families are claimed here; the source proves the statement for families definable in any o-minimal structure, which no library or roadmap plans.

**Proof plan.**

1. For compact fibres C_T, choose an adapted lattice basis and send it to the standard basis by Ψ. The family (Ψ,T)↦Ψ(C_T) has a uniform Davenport line-section constant by semialgebraic-interval-condition. Its main volume is vol C_T/detΛ.
2. BW Lemma 2.2 expresses each j-dimensional transformed coordinate projection using oblique projections onto spans of j basis vectors, with factor at most 2^j/(V_j^{ball} λ₁⋯λ_j). Lemmas 2.3–2.4 use the adapted basis lengths and Minkowski’s second theorem to bound the angle distortion of these oblique projections by a dimension constant times the largest j-dimensional orthogonal projection. Equivalently, the complementary basis parallelepiped has volume ≪_n λ_{j+1}⋯λ_n and detΛ≳_n∏λ_i, which bounds the inverse angle factor. These are linear-algebra steps and do not yet compare coordinate and arbitrary orthogonal projections.
3. Apply orthogonal-projection-comparison to C_T. It turns the arbitrary orthogonal projection bound into c_Z V_j(Z_T)/(λ₁⋯λ_j), with c_Z independent of Λ and T. Sum Davenport’s finitely many projection terms; the j=0 contribution is one.
4. For arbitrary bounded Z_T apply the compact-fibre result twice, to C_T and B_T=frontier Z_T. By semialgebraic-boundary-null, vol B_T=0, vol C_T=vol Z_T and V_j(B_T)≤V_j(C_T)=V_j(Z_T). Since C_T\Z_T⊆B_T, the difference of the lattice counts is at most #(B_T∩Λ). Adding the two errors proves the displayed estimate without any assumption on which boundary points are included.

**Acceptance checks.**

- Λ = ℤⁿ and Z_T = T·[0,1]ⁿ (T ∈ ℝ_{>0}): recovers |(⌊T⌋ + 1)ⁿ − Tⁿ| ≪ Σ_j T^j.
- The example of Barroero–Widmer p.5 (union of axis segments of length T shifted by λ_j e_j) shows the j-th term cannot be dropped.

**Intended library:** `TauCeti/GeometryOfNumbers/DavenportPrinciple`; namespace `TauCeti.GeometryOfNumbersPlan`; target `abs_card_fiber_inter_sub_le_semialgebraic`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-principle`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/coordinate-projection-volumes`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-interval-condition`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/adapted-basis-coordinates`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/orthogonal-projection-comparison`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-boundary-null`

**Source locators.**

- **BW2014**, Theorem 1.3, p.5; Lemmas 2.1–2.4, pp.7–8; Lemma 5.8, pp.15–17; Proposition 6.1 and Lemma 6.2, pp.17–20; §7, pp.20–21 (arXiv:1210.5943, retrieved 2026-10-16): For a definable family with bounded fibres, |#(Z_T ∩ Λ) − vol(Z_T)/det Λ| ≤ c_Z Σ_{j<n} V_j(Z_T)/(λ_1⋯λ_j); semialgebraic families are definable.
- **BLS2020**, §3.1, p.9 and §5.1, p.51: Uses Theorem 1.3 of Barroero–Widmer for the semialgebraic regions R_v(T, γ).

<a id="hyperplane-orthant-count"></a>
#### Lattice points on a hyperplane in the positive orthant

`GN.4/hyperplane-orthant-count` · theorem

Let d ≥ 2, L = v + Λ ⊆ ℤ^d a translate of a full lattice Λ ⊆ ℤ^d by an integer vector, and a_1, …, a_d positive integers. There are k ≥ 1, s ∈ ℤ/k and r > 0 such that for every integer n ≥ 1, L′(n) = L ∩ {Σ a_i x_i = n} is empty unless n ≡ s mod k, and if n ≡ s mod k then #(L′(n) ∩ ℝ^d_{≥0}) = r·n^{d−1} + O_{d,L,a}(n^{d−2}).

**Hypotheses.**

- All a_i > 0: with some a_i = 0 the count is infinite (PAPER-LIU-WOOD-ZUREICKBROWN-24/E8, confirmed); then the simplex {x ≥ 0, Σa_ix_i = n} is bounded.

**Proof plan.**

1. The values Σ a_i x_i on L form a coset s + kℤ of a subgroup kℤ ⊆ ℤ (k = gcd of the a-values on Λ).
2. For n ≡ s mod k, L′(n) is a translate of the rank-(d − 1) lattice Λ ∩ {Σa_ix_i = 0} inside the hyperplane; the points with x ≥ 0 lie in the dilated simplex n·Δ, Δ = {x ≥ 0, Σa_ix_i = 1}.
3. Apply the fixed-lattice count with Lipschitz boundary (GlobalNumberFields Layer 3) or semialgebraic-family-lattice-count in the hyperplane: main term vol(nΔ)/det = r n^{d−1} with r = vol(Δ)/covol, error O(n^{d−2}).

**Acceptance checks.**

- d = 2, L = ℤ², a = (1, 1): k = 1 and #{x, y ≥ 0, x + y = n} = n + 1 = n + O(1), r = 1.

**Intended library:** `TauCeti/GeometryOfNumbers/SuccessiveMinimaCount`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_hyperplane_orthant_eq`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-family-lattice-count`
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-3-geometry-of-numbers-and-ray-class-ideal-counting`

**Source locators.**

- **LWZB2024**, Lemma 12.8, p.51 (arXiv:1907.05002v2): States the result for non-negative a_i not all zero; positivity is needed for finiteness (E8).

### 4.8 Primitive lattices, angular bands and weighted sums

Primitive lattices are saturated in their rational span. The primitive-ball estimate includes both its uniform Y-dependent leading error and its logarithmic error.

<a id="angular-band-region"></a>
#### Angular bands and their lattice regions

`GN.4/angular-band-region` · definition

Let N ≥ 1, γ > 0 and v ∈ ℝ^N. The angular band of v is C_v^{(γ)} = {t ∈ ℝ^N : |⟨v, t⟩| ≤ ‖v‖·‖t‖/(2γ)}, the set of vectors making an angle with the hyperplane v^⊥ whose sine is at most 1/(2γ). For v_1, …, v_I ∈ ℝ^N and T > 0 put R_v(T, γ) = B̄_N(T) ∩ C_{v_1}^{(γ)} ∩ ⋯ ∩ C_{v_I}^{(γ)}, and for a lattice Λ of rank R put V_v(Λ; γ) = vol_R(span_ℝ Λ ∩ R_v(1, γ)), the R-dimensional volume in the span.

**Hypotheses.**

- γ > 0; v = 0 gives the whole space (the inequality reads 0 ≤ 0).
- The band is a closed cone (invariant under t ↦ ct for c ∈ ℝ), so R_v(T, γ) = T·R_v(1, γ).

**Uses.**

- Browning–Le Boudec–Sawin, Lemma 3.4, p.9: lattice points of a rank-R lattice in R_v(T, γ) are counted with main term T^R V_v/det Λ
- Browning–Le Boudec–Sawin, §4.2, (4.1)–(4.2), p.27: the one- and two-band volumes I(w,z) and J(w,z) are volumes of such regions
- HeightsRationalPointsAndObstructions, Part II (random Fano hypersurfaces): the localised counting function is a sum over points of these regions

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.angularBand` (constructor): angularBand γ v = {t | |⟪v, t⟫| ≤ ‖v‖ * ‖t‖ / (2 * γ)}.
- `TauCeti.GeometryOfNumbersPlan.bandRegion` (constructor): bandRegion T γ v = closedBall 0 T ∩ ⋂ i, angularBand γ (v i).
- `TauCeti.GeometryOfNumbersPlan.bandVolume` (data): bandVolume Λ γ v = volume (restricted to span ℝ Λ) of span ℝ Λ ∩ bandRegion 1 γ v.
- `TauCeti.GeometryOfNumbersPlan.mem_angularBand_smul` (simp): c • t ∈ angularBand γ v ↔ t ∈ angularBand γ v for c ≠ 0, and 0 ∈ angularBand γ v.
- `TauCeti.GeometryOfNumbersPlan.bandRegion_eq_smul` (relation): For T > 0, bandRegion T γ v = T • bandRegion 1 γ v.
- `TauCeti.GeometryOfNumbersPlan.angularBand_antitone` (structure): γ ≤ γ' → angularBand γ' v ⊆ angularBand γ v.
- `TauCeti.GeometryOfNumbersPlan.angularBand_zero` (simp): angularBand γ 0 = univ.
- `TauCeti.GeometryOfNumbersPlan.hasComplexity_bandRegion` (compatibility): bandRegion T γ v has description complexity (I + 1, 2).

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.angularBand_half_eq_univ` (degenerate): For γ = 1/2 and any v, angularBand γ v = univ, by Cauchy–Schwarz.
- `TauCeti.GeometryOfNumbersPlan.angularBand_e1_one` (computation): In ℝ², (1, 1) ∉ angularBand 1 e_1 (|1| > √2/2) and (1, 2) ∈ angularBand 1 e_1 (1 ≤ √5/2).
- `TauCeti.GeometryOfNumbersPlan.bandRegion_volume_plane` (computation): In ℝ², bandRegion 1 1 (e_1) is the union of two sectors of half-angle π/6 about the t_2-axis, of area π/3.
- `TauCeti.GeometryOfNumbersPlan.angularBand_not_convex` (non-example): (1, 2) and (1, −2) lie in angularBand 1 e_1 ⊆ ℝ² but their midpoint (1, 0) does not: the band is a closed double cone, not a convex set.

**Proof plan.**

1. The band is defined by the polynomial inequality 4γ²⟨v,t⟩² ≤ ‖v‖²‖t‖², so R_v(T, γ) has complexity (I + 1, 2) (semialgebraic-complexity).
2. Homogeneity: C_v^{(γ)} is closed under real scalar multiplication, hence R_v(T, γ) = T·R_v(1, γ) and V_v depends on Λ only through span_ℝ Λ.

**Acceptance checks.**

- For N = 2, v = e_1 and γ = 1/2 the band is all of ℝ² (|t_1| ≤ ‖t‖ always).
- For N = 2, v = e_1, γ = 1 the band is {|t_1| ≤ ‖t‖/2}, two sectors of half-angle π/6 around the t_2-axis.

**Intended library:** `TauCeti/GeometryOfNumbers/BandCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `angularBand`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-complexity`
- `mathlib:Metric.closedBall`
- `mathlib:real_inner_self_eq_norm_sq`

**Source locators.**

- **BLS2020**, §2, (2.6), p.4 (arXiv:2006.02356v1): Defines C_v^{(γ)} by |⟨v,t⟩| ≤ ‖v‖‖t‖/(2γ).
- **BLS2020**, Lemma 3.4, statement, p.9: Defines R_{v_1,…,v_I}(T, γ) and V_{v_1,…,v_I}(Λ; γ).

<a id="band-count"></a>
#### Lattice points in intersections of angular bands

`GN.4/band-count` · theorem

Let N ≥ 2, 1 ≤ R ≤ N, 1 ≤ I ≤ N − 1, Λ ⊆ ℝ^N a lattice of rank R, v_1, …, v_I ∈ ℝ^N and γ > 0. Let Y ≥ λ_R(Λ). For T ≥ Y: #(Λ ∩ R_v(T, γ)) = (T^R/det Λ)·(V_v(Λ; γ) + O(Y/T)), the implied constant depending only on N and I (and on R).

**Hypotheses.**

- The constant is uniform in Λ, the v_i and γ.
- The source states dependence on R only; the uniformity in the family follows from the semialgebraic family bound, whose constant depends on the family (N, I): recorded as a dependence on (N, I).

**Proof plan.**

1. Rotate span_ℝ Λ onto ℝ^R × {0} by an orthogonal map; the region becomes a semialgebraic family in the parameters (v, γ, T) of complexity depending only on (N, I).
2. Apply semialgebraic-family-lattice-count: the error is ≪ Σ_{i=1}^{R} T^{R−i}/(λ_1⋯λ_{R−i}).
3. By Minkowski's second theorem λ_1⋯λ_{R−i} ≍ det Λ/(λ_{R−i+1}⋯λ_R) ≥ det Λ/Y^i, so each error term is ≪ (T^R/det Λ)(Y/T)^i ≤ (T^R/det Λ)(Y/T) for T ≥ Y.

**Acceptance checks.**

- I = 1, v_1 = 0: the region is the ball, V_v = V_R and the formula is the classical ball count with error T^{R−1}Y/det Λ.

**Intended library:** `TauCeti/GeometryOfNumbers/BandCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_inter_bandRegion_eq`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-family-lattice-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/angular-band-region`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-lower`

**Source locators.**

- **BLS2020**, Lemma 3.4 and its proof, p.9: States the asymptotic count with error O(Y/T) for T ≥ Y ≥ λ_R(Λ), using Barroero–Widmer Theorem 1.3 and Minkowski's second theorem.
- **BW2014**, Theorem 1.3, p.5: The uniform family count.

<a id="primitive-lattices-with-prescribed-minima"></a>
#### Primitive integral lattices with prescribed dyadic minima

`GN.4/primitive-lattices-with-prescribed-minima` · definition

Let n ≥ 2, 1 ≤ r ≤ n + 1 and s_1, …, s_r ≥ 1. S_{r,n}(s_1, …, s_r) is the set of primitive lattices L ⊆ ℤ^{n+1} of rank r (L = span_ℝ L ∩ ℤ^{n+1}) whose Euclidean successive minima satisfy s_j/2 < λ_j(L) ≤ s_j for every j.

**Hypotheses.**

- Primitive means saturated in ℤ^{n+1}; the minima are computed in span_ℝ L.

**Uses.**

- Browning–Le Boudec–Sawin, Lemmas 3.18–3.24, pp.19–25: dyadic decomposition of sums over primitive lattices by their minima
- Bhargava–Shankar–Wang 2025, Proposition 5.7, p.23: the analogous sets Σ(L, s) of row lattices with prescribed skewed minima (skew-row-lattice-count)

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.primitiveWithMinima` (constructor): primitiveWithMinima n r s = {L : Submodule ℤ (Fin (n+1) → ℤ) | L.IsSaturated ∧ finrank L = r ∧ ∀ j, s j / 2 < λ_j L ∧ λ_j L ≤ s j}.
- `TauCeti.GeometryOfNumbersPlan.primitiveWithMinima_finite` (structure): (primitiveWithMinima n r s).Finite.
- `TauCeti.GeometryOfNumbersPlan.mem_primitiveWithMinima_iff` (characterisation): Membership unfolds to saturation, rank and the dyadic minima conditions.
- `TauCeti.GeometryOfNumbersPlan.primitiveWithMinima_one` (characterisation): primitiveWithMinima n 1 s is in bijection with the pairs {x, −x} of primitive vectors of ℤ^{n+1} with s_1/2 < ‖x‖ ≤ s_1.
- `TauCeti.GeometryOfNumbersPlan.primitiveWithMinima_eq_empty` (relation): If some s_j < 1 the set is empty, since nonzero integral vectors have norm ≥ 1.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.primitiveWithMinima_line_count` (computation): For n = 2, r = 1, s_1 = 1: the primitive lines with 1/2 < λ_1 ≤ 1 are the three coordinate axes, so the set has 3 elements.
- `TauCeti.GeometryOfNumbersPlan.primitiveWithMinima_full_rank` (degenerate): For r = n + 1 and s = (1, …, 1) the set is {ℤ^{n+1}}.
- `TauCeti.GeometryOfNumbersPlan.primitiveWithMinima_nonprimitive_excluded` (non-example): 2ℤe_1 has minimum 2 but is not primitive, so it is not in S_{1,n}(2) although its minimum is in (1, 2].
- `TauCeti.GeometryOfNumbersPlan.primitiveWithMinima_small_s` (degenerate): For s_1 = 1/2 (not ≥ 1) no lattice qualifies.

**Proof plan.**

1. A rank-r primitive lattice is determined by its real span, so S_{r,n} is a set of rational subspaces of dimension r.
2. Finiteness: λ_r(L) ≤ s_r bounds a basis of L, so only finitely many L occur (ball-count-successive-minima).

**Acceptance checks.**

- S_{1,n}(s) is the set of lines ℤx with x primitive and s/2 < ‖x‖ ≤ s.
- For r = n + 1 the only primitive lattice is ℤ^{n+1}, with all minima 1: it lies in S_{n+1,n}(s) iff 1 ≤ s_j < 2 for all j.

**Intended library:** `TauCeti/GeometryOfNumbers/PrimitiveLatticeCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `primitiveWithMinima`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/successive-minimum`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.0/saturated-adapted-basis`

**Source locators.**

- **BLS2020**, Definition 3.17, p.19: Defines S_{r,n}(s_1, …, s_r) as above.

<a id="schmidt-primitive-extension-count"></a>
#### Primitive extensions of a fixed primitive lattice

`GN.4/schmidt-primitive-extension-count` · theorem

Let n ≥ 2, 2 ≤ r ≤ n + 1 and L' ⊆ ℤ^{n+1} a primitive lattice of rank r − 1. For s ≥ 1, the number of primitive lattices L ⊆ ℤ^{n+1} of rank r with L' ⊆ L and det(L)/det(L') ≤ s is ≪_n s^{n−r+2}·det(L').

**Hypotheses.**

- The implied constant depends only on n.

**Proof plan.**

1. L ↦ π(L) with π the orthogonal projection away from span L' identifies such L with primitive vectors of the rank-(n − r + 2) quotient lattice π(ℤ^{n+1}) of norm ≤ s, up to sign (det L = det L'·‖π(x)‖).
2. M = π(ℤ^{n+1}) has rank q = n − r + 2, determinant 1/det(L') (GN.0 covolume-projection) and integral dual M* = L'^⊥ (GN.0 dual-projection-comap). Integrality gives λ_i(M*) ≥ 1, so transference-minkowski-constant bounds every minimum μ_i of M by a constant c(q).
3. By ball-count-successive-minima the number of x ∈ M with ‖x‖ ≤ s is ≪ Σ_j s^j/(μ_1⋯μ_j) = Σ_j s^j μ_{j+1}⋯μ_q/(μ_1⋯μ_q) ≪ s^q·det(L') for s ≥ 1, using μ_1⋯μ_q ≍ det M (Minkowski's second theorem).

**Acceptance checks.**

- r = 2, L' = ℤe_1: the extensions correspond to primitive x ∈ ℤ^n (the other coordinates) with ‖x‖ ≤ s, about s^n of them.

**Intended library:** `TauCeti/GeometryOfNumbers/PrimitiveLatticeCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_primitive_extensions_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ball-count-successive-minima`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/transference-minkowski-constant`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-projection`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.0/dual-projection-comap`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`

**Source locators.**

- **BLS2020**, Proof of Lemma 3.18, p.19, citing Schmidt, Duke Math. J. 35 (1968), Lemma 6 with i = 1: Uses the bound ≪_n s^{n−r+2}det(L') for primitive rank-r extensions of a primitive rank-(r − 1) lattice with det(L)/det(L') ≤ s.

<a id="primitive-lattice-minima-count"></a>
#### Counting primitive lattices by their minima

`GN.4/primitive-lattice-minima-count` · theorem

Let n ≥ 2 and 1 ≤ r ≤ n + 1. For all s_1, …, s_r ≥ 1, #S_{r,n}(s_1, …, s_r) ≪_n ∏_{j=1}^r s_j^{n+r+2−2j}.

**Hypotheses.**

- The implied constant depends only on n.

**Proof plan.**

1. Induction on r. r = 1: #S_{1,n}(s_1) ≤ #(ℤ^{n+1} ∩ B̄(s_1)) ≪ s_1^{n+1}.
2. r − 1 → r: for L ∈ S_{r,n} choose b_j ∈ L with ‖b_j‖ = λ_j(L) (j < r) and L^{(−1)} = (ℝb_1 + ⋯ + ℝb_{r−1}) ∩ ℤ^{n+1}, primitive of rank r − 1 with minima ≤ s_j and det ≪ s_1⋯s_{r−1}; the number of choices of L^{(−1)} is bounded by the induction hypothesis (after a dyadic decomposition of its minima).
3. Given L^{(−1)}, det(L)/det(L^{(−1)}) ≪ s_r, so schmidt-primitive-extension-count bounds the number of L by s_r^{n−r+2}·det(L^{(−1)}); multiply.

**Acceptance checks.**

- r = 1: the bound s_1^{n+1} is the order of the number of primitive vectors of norm ≤ s_1.
- r = n + 1: the bound is ∏ s_j^{2n+3−2j} ≥ 1, while the true count is ≤ 1.

**Intended library:** `TauCeti/GeometryOfNumbers/PrimitiveLatticeCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_primitiveWithMinima_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/primitive-lattices-with-prescribed-minima`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/schmidt-primitive-extension-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ball-count-successive-minima`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`

**Source locators.**

- **BLS2020**, Lemma 3.18 and its proof, pp.19–20: States #S_{r,n}(s_1, …, s_r) ≪ s_1^{n+r}s_2^{n+r−2}⋯s_r^{n−r+2} and proves it by induction on r.

<a id="band-section-volumes"></a>
#### One-band and two-band section volumes

`GN.4/band-section-volumes` · definition

For N ≥ 2 and w, z ∈ ℝ^N let I(w, z) = vol_{N−1}{t ∈ (ℝw)^⊥ : |⟨z, t⟩| ≤ ‖t‖ ≤ 1} (volume in the hyperplane w^⊥, w ≠ 0) and J(w, z) = vol_N{t ∈ ℝ^N : |⟨w, t⟩| ≤ ‖t‖, |⟨z, t⟩| ≤ ‖t‖, ‖t‖ ≤ 1}. Put δ(w, z) = ‖w‖²‖z‖² − ⟨w, z⟩², which is > 0 exactly when w, z are linearly independent.

**Hypotheses.**

- w ≠ 0 for I; no condition for J (J = V_N when ‖w‖, ‖z‖ ≤ 1).

**Uses.**

- Browning–Le Boudec–Sawin, Lemmas 4.2–4.3, pp.27–29: asymptotics in terms of δ(w, z)
- Browning–Le Boudec–Sawin, §4.3–§4.4: main terms of the pair-correlation counts of the localised counting function

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.oneBandVolume` (constructor): oneBandVolume w z = volume in (ℝ ∙ w)ᗮ of {t | |⟪z, t⟫| ≤ ‖t‖ ∧ ‖t‖ ≤ 1}.
- `TauCeti.GeometryOfNumbersPlan.twoBandVolume` (constructor): twoBandVolume w z = volume {t | |⟪w, t⟫| ≤ ‖t‖ ∧ |⟪z, t⟫| ≤ ‖t‖ ∧ ‖t‖ ≤ 1}.
- `TauCeti.GeometryOfNumbersPlan.bandDelta` (data): bandDelta w z = ‖w‖^2 * ‖z‖^2 − ⟪w, z⟫^2.
- `TauCeti.GeometryOfNumbersPlan.bandDelta_pos_iff` (characterisation): 0 < bandDelta w z ↔ LinearIndependent ℝ ![w, z].
- `TauCeti.GeometryOfNumbersPlan.oneBandVolume_of_norm_le_one` (simp): For w ≠ 0 and ‖z‖ ≤ 1, oneBandVolume w z = the volume of the unit ball of dimension N−1.
- `TauCeti.GeometryOfNumbersPlan.twoBandVolume_of_norm_le_one` (simp): ‖w‖ ≤ 1 → ‖z‖ ≤ 1 → twoBandVolume w z = V_N.
- `TauCeti.GeometryOfNumbersPlan.oneBandVolume_orthogonal` (functoriality): oneBandVolume (O w) (O z) = oneBandVolume w z for O orthogonal.
- `TauCeti.GeometryOfNumbersPlan.twoBandVolume_le` (structure): twoBandVolume w z ≤ V_N.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.bandDelta_orthonormal` (computation): bandDelta e_1 e_2 = 1.
- `TauCeti.GeometryOfNumbersPlan.oneBandVolume_small` (computation): For N=3, w ≠ 0 and ‖z‖ ≤ 1, oneBandVolume w z = π.
- `TauCeti.GeometryOfNumbersPlan.bandDelta_dependent` (degenerate): bandDelta w (2 • w) = 0.
- `TauCeti.GeometryOfNumbersPlan.twoBandVolume_not_product` (non-example): twoBandVolume is not the product of the two single-band volumes: for ‖w‖, ‖z‖ ≤ 1 it equals V_N, not V_N².

**Proof plan.**

1. Both sets are compact semialgebraic, so the volumes are finite; I is a volume in a hyperplane, computed via an isometry w^⊥ ≃ ℝ^{N−1}.
2. Invariance: I(Ow, Oz) = I(w, z) and J(Ow, Oz) = J(w, z) for orthogonal O; I(cw, z) = I(w, z) for c ≠ 0.

**Acceptance checks.**

- If ‖z‖ ≤ 1 then I(w, z) = V_{N−1}.
- δ(w, z) = 0 for dependent vectors.

**Intended library:** `TauCeti/GeometryOfNumbers/BandCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `oneBandVolume`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:MeasureTheory.Measure.addHaar_image_linearMap`
- `mathlib:real_inner_self_eq_norm_sq`
- `mathlib:InnerProductSpace.volume_closedBall`

**Source locators.**

- **BLS2020**, §4.2, (4.1) and (4.2), p.27: Defines I(w, z), J(w, z) and δ_{w,z} as above.

<a id="band-section-volume-asymptotics"></a>
#### Asymptotics of the band section volumes

`GN.4/band-section-volume-asymptotics` · theorem

Let N ≥ 3 and w, z ∈ ℝ^N linearly independent, δ = δ(w, z). Then I(w, z) = (2(N − 2)/(N − 1))·V_{N−2}·‖w‖/δ^{1/2}·(1 + O_N(min{1, ‖w‖²/δ})), and J(w, z) = (4(N − 2)/N)·V_{N−2}/δ^{1/2}·(1 + O_N(min{1, (‖w‖ + ‖z‖)²/δ})).

**Hypotheses.**

- N ≥ 3; the asymptotics are informative when δ is large compared with ‖w‖² (resp. (‖w‖+‖z‖)²).

**Proof plan.**

1. I: inside w^⊥ the condition |⟨z, t⟩| ≤ ‖t‖ is a band around the hyperplane orthogonal to the component z' of z in w^⊥, with ‖z'‖ = δ^{1/2}/‖w‖; integrate in polar coordinates, the band having angular measure ≍ 1/‖z'‖ with the explicit constant 2V_{N−2}(N−2)/(N−1).
2. J: intersect two such bands; for δ large the intersection is a neighbourhood of the codimension-2 subspace {w, z}^⊥ of angular size ≍ 1/(δ^{1/2}) after the change of variables to an orthonormal basis of span(w, z).

**Acceptance checks.**

- When w ⊥ z with ‖w‖ = 1 and ‖z‖ = R large, I ≈ 2(N − 2)V_{N−2}/((N − 1)R).

**Intended library:** `TauCeti/GeometryOfNumbers/BandCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `oneBandVolume_asymptotic`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/band-section-volumes`
- `mathlib:MeasureTheory.integral_fun_norm_addHaar`

**Source locators.**

- **BLS2020**, Lemma 4.2, p.27, and Lemma 4.3, p.28 (statements; the proofs were not read and the steps above are a sketch): State the two asymptotic formulas with the displayed constants and error terms.

<a id="weighted-lattice-sums"></a>
#### Primitive and unrestricted weighted lattice sums

`GN.4/weighted-lattice-sums` · definition

For N ≥ 1, an integral lattice Λ ⊆ ℤ^N, a bounded region R ⊆ ℝ^N and an integer k ≥ 0 put S*_k(Λ; R) = Σ_{a ∈ Λ ∩ ℤ^N_prim ∩ R} ‖a‖^{−k} and S_k(Λ; R) = Σ_{a ∈ (Λ ∖ {0}) ∩ R} ‖a‖^{−k}, where ℤ^N_prim is the set of primitive vectors of ℤ^N (gcd of coordinates 1).

**Hypotheses.**

- The sums are finite since R is bounded; primitivity is in ℤ^N, not in Λ.

**Uses.**

- Browning–Le Boudec–Sawin, Lemmas 4.8–4.11, pp.34–47: pair counts D_{d,n}(A, B) are sums of S*_0 over the lattices Γ_{x,y}
- primitive-ball-count (this packet): asymptotic for S*_0 over a ball

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.primitiveWeightedSum` (constructor): primitiveWeightedSum Λ R k = Σ over a ∈ Λ with a primitive in ℤ^N and a ∈ R of ‖a‖^{−k}.
- `TauCeti.GeometryOfNumbersPlan.nonzeroWeightedSum` (constructor): nonzeroWeightedSum Λ R k = Σ over a ∈ Λ ∖ {0} with a ∈ R of ‖a‖^{−k}.
- `TauCeti.GeometryOfNumbersPlan.primitiveWeightedSum_le` (structure): 0 ≤ primitiveWeightedSum Λ R k ≤ nonzeroWeightedSum Λ R k.
- `TauCeti.GeometryOfNumbersPlan.primitiveWeightedSum_mono` (structure): Monotone in Λ and in R.
- `TauCeti.GeometryOfNumbersPlan.nonzeroWeightedSum_zero_eq_card` (simp): nonzeroWeightedSum Λ R 0 = #((Λ ∖ {0}) ∩ R).
- `TauCeti.GeometryOfNumbersPlan.primitiveWeightedSum_of_not_primitive` (relation): If Λ ⊆ mℤ^N with m ≥ 2 then primitiveWeightedSum Λ R k = 0.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.primitiveWeightedSum_unit_disc` (computation): primitiveWeightedSum ℤ² (closedBall 0 1) 0 = 4 (the four unit vectors).
- `TauCeti.GeometryOfNumbersPlan.nonzeroWeightedSum_disc_two` (computation): nonzeroWeightedSum ℤ² (closedBall 0 2) 0 = 12, while primitiveWeightedSum = 8.
- `TauCeti.GeometryOfNumbersPlan.primitiveWeightedSum_two_lattice` (degenerate): primitiveWeightedSum (2ℤ)² R k = 0.
- `TauCeti.GeometryOfNumbersPlan.primitive_in_Z_not_in_lattice` (non-example): For Λ = 2ℤ × ℤ, the vector (2, 0) is primitive in Λ but not in ℤ², so it is not counted by primitiveWeightedSum Λ R 0, while (2, 1) is counted: primitivity is taken in ℤ^N.

**Proof plan.**

1. S_k(Λ; R) = Σ_{m ≥ 1} m^{−k} S*_k(Λ ∩ ..., R/m)-type decompositions hold only for primitive Λ (a ∈ Λ primitive in ℤ^N iff primitive in Λ when Λ is primitive).
2. S*_0(Λ; B̄(T)) counts primitive points; S_0 counts all nonzero points.

**Acceptance checks.**

- S*_0(ℤ^2; B̄(1)) = 4 and S_0(ℤ^2; B̄(1)) = 4.
- S*_0(2ℤ^2; R) = 0 for every R.

**Intended library:** `TauCeti/GeometryOfNumbers/PrimitiveLatticeCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `primitiveWeightedSum`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:Finset.gcd`

**Source locators.**

- **BLS2020**, §4.5, (4.24) and (4.25), p.34: Defines S*_k and S_k for integral lattices and bounded regions.

<a id="primitive-ball-count"></a>
#### Primitive points of a primitive lattice in a ball

`GN.4/primitive-ball-count` · theorem

Let N ≥ 3, 3 ≤ R ≤ N, Λ ⊆ ℤ^N a primitive lattice of rank R and Y ≥ 1 such that B̄_N(Y) contains R linearly independent vectors of Λ (λ_R(Λ) ≤ Y). For T ≥ Y: S*_0(Λ; B̄_N(T)) = V_R T^R/(ζ(R) det Λ)·(1 + O_R(Y/T)) + O_R(T log(2Y)).

**Hypotheses.**

- Primitive Λ, so primitivity in Λ and in ℤ^N agree; R ≥ 3 makes the Möbius sum converge with a log error.

**Proof plan.**

1. Because Λ is saturated in ℤ^N, the ambient content of a nonzero vector divides it inside Λ. Möbius inversion therefore gives Σ_{m≤T} μ(m)(N_Λ(T/m)−1); integral nonzero vectors have Euclidean norm at least one, explaining the finite cutoff.
2. For m≤T/Y, use the rank-R ball estimate N_Λ(t)=V_R t^R/detΛ·(1+O_R(Y/t)), valid for t≥Y. The main Möbius series has tail O_R((Y/T)^{R−1}); since R≥3, Σm^{1−R} is bounded. Both errors are O_R(Y T^{R−1}/detΛ). The removal of zero contributes O(T).
3. For T/Y<m≤T use small-vector-count with R₀=R−2: N_Λ(T/m) ≪_R T²Y^{R−2}/(m²detΛ)+T/m. Summing m⁻² over the tail gives O_R(TY^{R−1}/detΛ), bounded by O_R(YT^{R−1}/detΛ) because Y≤T and R≥3.
4. The harmonic tail Σ_{T/Y<m≤T}T/m is O(T(1+log Y)). Combine this with the O(T) zero-vector term to obtain O_R(T log(2Y)), including Y=1. Le Boudec writes log Y, with the O(T) term absorbed elsewhere; log(2Y) makes the displayed independent additive error valid at the endpoint.

**Acceptance checks.**

- Λ = ℤ^3, Y = 1: the number of primitive vectors of norm ≤ T is (4π/3)T³/ζ(3) + O(T²) ⊂ the stated form.

**Intended library:** `TauCeti/GeometryOfNumbers/PrimitiveLatticeCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `primitiveWeightedSum_closedBall_eq`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/weighted-lattice-sums`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/band-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/small-vector-count`
- `mathlib:ArithmeticFunction.moebius`
- `mathlib:riemannZeta`

**Source locators.**

- **LeBoudec2020**, §2.1, Lemmas 1–3, pp.5–7, especially (2.6)–(2.8), p.7: Lemma 3 is the direct parameter-uniform statement for saturated rank-R integral lattices, R≥3, λ_R≤Y≤T. Its proof supplies the short-radius tail estimate and constants depending only on R.
- **BLS2020**, Proof of Lemma 4.8, p.35; reference [14], p.66: The application cites Le Boudec’s Height of rational points on random Fano hypersurfaces, listed as to appear (2020), rather than an unidentified 2018 lemma.

### 4.9 Singular symmetric matrices in skewed balls

<a id="symmetric-row-lattices"></a>
#### Symmetric matrices with prescribed row space

`GN.4/symmetric-row-lattices` · definition

Let n ≥ 2 and S = Sym²(n) the real symmetric n×n matrices with the Frobenius Euclidean norm (identify S with ℝ^{n(n+1)/2} so that off-diagonal coordinates carry weight √2; covolumes are taken for this norm). For a lattice Λ ⊆ ℤⁿ of rank r, S(Λ) is the set of B ∈ S(ℤ) whose row space is contained in Λ ⊗ ℝ, and S'(Λ) the lattice it spans; the full-rank part S(Λ)^{full} consists of those B whose row space is all of Λ ⊗ ℝ. For v, w ∈ ℝⁿ put v ∗ w = vwᵀ + wvᵀ if v, w are linearly independent and v ∗ w = vwᵀ otherwise. For s = diag(t_1^{−1}, …, t_n^{−1}) with t_i > 0 and 1 ≤ r < n put C(r, s) = ∏_{1≤i<j≤n, j>n−r} t_i/t_j. SL_n(ℝ) acts on S by γ·A = γAγᵀ.

**Hypotheses.**

- The full-rank subset and the spanning lattice are different objects (PAPER-BHARGAVA-SHANKAR-WANG-25/E18); counts of rank-r matrices fibre over the saturated row lattice.
- C(r, s) is a product over the pairs (i, j) with i < j and j > n − r.
- The diagonal skew matrix s = diag(t_1,…,t_n) has t_i > 0 and ∏_i t_i = 1 (so s ∈ SL_n(ℝ)); uniformity is asserted only for these skews.

**Uses.**

- Bhargava–Shankar–Wang 2025, Theorem 5.3 and Propositions 5.4–5.5, pp.22–23: bases of γ(S'(Λ)) and counts of its points in YD
- Bhargava–Shankar–Wang 2025, §6, (74)–(76), pp.47–48: tail estimates for pairs (A, B) with B singular, summed over row lattices
- ArithmeticStatistics:ST.2 (request for skew-region symmetric-rank counts): the deep-cusp and shallow-cusp tails of BSW II

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.symRowLattice` (constructor): symRowLattice Λ = {B : Matrix (Fin n) (Fin n) ℤ | B.IsSymm ∧ ∀ i, (B i) ∈ Λ.span ℝ}, as an additive subgroup.
- `TauCeti.GeometryOfNumbersPlan.symRowFullRank` (constructor): symRowFullRank Λ = {B ∈ symRowLattice Λ | rank B = finrank Λ}.
- `TauCeti.GeometryOfNumbersPlan.symStar` (constructor): symStar v w = vecMulVec v w + vecMulVec w v if LinearIndependent ℝ ![v, w], else vecMulVec v w.
- `TauCeti.GeometryOfNumbersPlan.skewConstant` (data): skewConstant r t = ∏ over i < j with j > n − r of t i / t j.
- `TauCeti.GeometryOfNumbersPlan.symStar_comm` (simp): symStar v w = symStar w v when v, w are independent; symStar v v = vecMulVec v v.
- `TauCeti.GeometryOfNumbersPlan.norm_symStar_le` (relation): ‖v‖ * ‖w‖ ≤ ‖symStar v w‖ ≤ 2 * ‖v‖ * ‖w‖ (Frobenius norm).
- `TauCeti.GeometryOfNumbersPlan.mem_symRowFullRank_saturation` (characterisation): A rank-r integral symmetric B lies in symRowFullRank Λ for exactly one primitive rank-r Λ, its saturated row lattice.
- `TauCeti.GeometryOfNumbersPlan.smul_symRowLattice` (functoriality): γ • symRowLattice Λ has row spaces in (γ • Λ).span ℝ, for γ ∈ SL_n(ℝ) acting by A ↦ γ A γᵀ.
- `TauCeti.GeometryOfNumbersPlan.skewConstant_le` (structure): For t_1 ≥ ⋯ ≥ t_n > 0, skewConstant r t ≤ skewConstant (n − 1) t = ∏_{i<j} t_i/t_j.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.symRowLattice_line` (computation): For n = 2 and Λ = ℤe_1, symRowLattice Λ = {!![b, 0; 0, 0] | b ∈ ℤ}.
- `TauCeti.GeometryOfNumbersPlan.norm_symStar_e1_e2` (computation): symStar e_1 e_2 = !![0,1;1,0] has Frobenius norm √2, between 1 and 2.
- `TauCeti.GeometryOfNumbersPlan.skewConstant_trivial` (degenerate): If all t_i = 1 then skewConstant r t = 1.
- `TauCeti.GeometryOfNumbersPlan.symRowFullRank_ne_span` (non-example): For Λ = ℤ² (n = 2, r = 2 is excluded, so take n = 3, Λ = ℤe_1 ⊕ ℤe_2): diag(1, 0, 0) lies in symRowLattice Λ but not in symRowFullRank Λ, since its rank is 1.

**Proof plan.**

1. v ∗ w is symmetric with row space in span{v, w} and ‖v‖‖w‖ ≤ ‖v ∗ w‖ ≤ 2‖v‖‖w‖ in the Frobenius norm.
2. Every rank-r integral symmetric matrix has a unique saturated row lattice Λ = rowspace ∩ ℤⁿ, primitive of rank r, and lies in S(Λ)^{full}.
3. γ(S(Λ)) = {γBγᵀ : B ∈ S(Λ)} has row spaces in γΛ ⊗ ℝ.

**Acceptance checks.**

- For n = 2, Λ = ℤe_1: S(Λ) = {diag(b, 0) : b ∈ ℤ} = ℤ·e_1 ∗ e_1/1 (here e_1 ∗ e_1 = e_1e_1ᵀ).
- C(n − 1, s) = ∏_{i<j} t_i/t_j.

**Intended library:** `TauCeti/GeometryOfNumbers/SkewSymmetricCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `symRowLattice`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:Matrix.IsSymm`
- `mathlib:Matrix.rank`
- `mathlib:Matrix.vecMulVec`
- `mathlib:Matrix.frobeniusNormedAddCommGroup`

**Source locators.**

- **BSW2025**, §5, (20)–(24), pp.21–22 (published numbering; (20)–(23) in arXiv v1): Defines S = Sym²(n), the skew balls s(YD), C(r, s), S(Λ), the product v_1 ∗ v_2 and the norm inequality |v||w| ≤ |v ∗ w| ≤ 2|v||w|.

<a id="eskin-katznelson-basis"></a>
#### A reduced basis for the symmetric row lattice

`GN.4/eskin-katznelson-basis` · theorem

Let γ ∈ SL_n(ℝ), Λ ⊆ ℤⁿ primitive of rank r and ℓ_1, …, ℓ_r a basis of γΛ. Then {ℓ_i ∗ ℓ_j : 1 ≤ i ≤ j ≤ r} is a basis of γ(S'(Λ)), and the covolume of γ(S'(Λ)) in its span is 2^{r(r−1)/4}·d(γΛ)^{r+1}, where d(γΛ) is the covolume of γΛ in its span. If {ℓ_i} is almost reduced (∏‖ℓ_i‖ ≪_n d(γΛ)), so is {ℓ_i ∗ ℓ_j}.

**Hypotheses.**

- d(γΛ) ≠ d(Λ) in general: an element of SL_n(ℝ) preserves n-dimensional covolume only (PAPER-BHARGAVA-SHANKAR-WANG-25/E15).
- Almost reduced bases exist (adapted-basis-coordinates).

**Proof plan.**

1. Choose a ℤ-basis e_1, …, e_r of Λ; S'(Λ) is the image of Sym²(ℤ^r) under X ↦ EXEᵀ, E the n×r matrix of the basis, with basis {e_i ∗ e_j}.
2. Apply γ: γ(e_i ∗ e_j)γᵀ = γe_i ∗ γe_j, and change basis within γΛ.
3. Covolume: the map Sym²(ℝ^r) → S, X ↦ FXFᵀ (F the matrix of ℓ) scales Frobenius covolume by det(FᵀF)^{(r+1)/2} = d(γΛ)^{r+1}; the factor 2^{r(r−1)/4} comes from the √2 weights of the off-diagonal coordinates against the basis vectors ℓ_i ∗ ℓ_j.
4. Almost reducedness: ∏_{i≤j}‖ℓ_i ∗ ℓ_j‖ ≤ 2^{r(r+1)/2}∏_{i≤j}‖ℓ_i‖‖ℓ_j‖ = 2^{…}(∏‖ℓ_i‖)^{r+1} ≪ d(γΛ)^{r+1}.

**Acceptance checks.**

- r = 1, Λ = ℤv: S'(Λ) = ℤ·vvᵀ, covolume ‖vvᵀ‖ = ‖v‖² = d(Λ)², matching 2^0 d^2.

**Intended library:** `TauCeti/GeometryOfNumbers/SkewSymmetricCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `symStar_basis_symRowLattice`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/symmetric-row-lattices`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/adapted-basis-coordinates`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-square-gram`
- `mathlib:ZLattice.covolume`

**Source locators.**

- **BSW2025**, Theorem 5.3, p.22 (published), following Eskin–Katznelson, Duke Math. J. 79 (1995), Proposition 3.3 and Lemma 3.5: States the basis, the covolume formula and the transfer of almost-reducedness; the published text writes the covolume also as 2^{r(r−1)/4}d(Λ)^{r+1}, valid only for γ preserving r-dimensional covolume (E15).

<a id="eskin-katznelson-nonvanishing"></a>
#### Minima conditions for a nonempty count

`GN.4/eskin-katznelson-nonvanishing` · lemma

Let γ ∈ SL_n(ℝ), Λ ⊆ ℤⁿ primitive of rank r with γΛ having successive minima μ_1 ≤ … ≤ μ_r, D ⊆ S(ℝ) bounded and Y > 0. If Y·D ∩ γ(S(Λ)^{full}) ≠ ∅ then μ_iμ_j ≤ c_1Y for all i, j with i + j ≤ r + 1, with c_1 depending on n and D.

**Hypotheses.**

- The nonempty intersection is with the full-rank part: a matrix whose row space is all of γΛ ⊗ ℝ (E18).

**Proof plan.**

1. Write a full-rank B ∈ YD ∩ γ(S(Λ)) as Σ_{k≤l} b_kl ℓ_k ∗ ℓ_l in an almost reduced basis ℓ of γΛ. If μ_iμ_j > c_1Y for some i + j ≤ r + 1, every basis vector ℓ_k ∗ ℓ_l with k ≥ i, l ≥ j has length ≥ μ_kμ_l > c_1Y, so its coefficient vanishes (almost-reducedness bounds |b_kl| by ‖B‖/‖ℓ_k ∗ ℓ_l‖ up to a constant).
2. Then the Gram matrix of B in the basis ℓ has a zero block in rows i..r and columns j..r, of total size (r − i + 1) + (r − j + 1) ≥ r + 1 > r, so B has rank < r, a contradiction. 
3. The pigeonhole on the anti-diagonal i + j = r + 1 is Eskin–Katznelson's Lemma 4.1.

**Acceptance checks.**

- r = 1: the condition is μ_1² ≤ c_1Y, i.e. the generator of γΛ has ‖v‖² ≪ Y.

**Intended library:** `TauCeti/GeometryOfNumbers/SkewSymmetricCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `minima_mul_le_of_nonempty`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/eskin-katznelson-basis`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/adapted-basis-coordinates`

**Source locators.**

- **BSW2025**, Proposition 5.4, p.22 (published), following Eskin–Katznelson Lemma 4.1: If the count is positive then µ_iµ_j ≤ c_1Y for i + j ≤ r + 1.

<a id="row-lattice-matrix-count"></a>
#### Counting symmetric matrices with a fixed row lattice

`GN.4/row-lattice-matrix-count` · theorem

Let γ ∈ SL_n(ℝ), Λ ⊆ ℤⁿ primitive of rank r with γΛ having minima μ_1 ≤ … ≤ μ_r, D ⊆ S(ℝ) bounded and Y ≥ 1. Then #(Y·D ∩ γ(S(Λ)^{full})) ≪_{n,D} (Y^{r(r+1)/2}/d(γΛ)^{r+1})·∏_{1≤i<j≤r, i+j≤r+1} μ_j/μ_i.

**Hypotheses.**

- The denominator is d(γΛ)^{r+1}, not d(Λ)^{r+1} (E15).
- Counting is over the full-rank part; the spanning lattice S'(Λ) is used only for the lattice-point bound.

**Proof plan.**

1. By bounded-domain-count and eskin-katznelson-basis, the count in S'(Λ) is ≪ (Y^{r(r+1)/2}/d(γΛ)^{r+1})·∏_{(i,j)∈U(r)}(Y/(μ_iμ_j))^{−1}, U(r) = {i ≤ j, i + j > r + 1} (the minima of γ(S'(Λ)) above Y).
2. If the full-rank count is positive, eskin-katznelson-nonvanishing gives μ_{r+1−j}μ_j ≪ Y, and the injection (i, j) ↦ (r + 1 − j, i) of U(r) into {k < l, k + l ≤ r + 1} turns the product into ∏ μ_j/μ_i over the stated pairs.

**Acceptance checks.**

- r = 1: the bound is Y/d(γΛ)² = Y/μ_1², the count of b with |b|μ_1² ≪ Y.

**Intended library:** `TauCeti/GeometryOfNumbers/SkewSymmetricCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_smul_inter_symRowFullRank_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/eskin-katznelson-basis`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/eskin-katznelson-nonvanishing`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/bounded-domain-count`

**Source locators.**

- **BSW2025**, Proposition 5.5 and proof, (25)–(26), pp.22–23 (published): States the bound with d(Λ)^{r+1} in the denominator; the correct quantity is d(γΛ)^{r+1} (PAPER-BHARGAVA-SHANKAR-WANG-25/E15, confirmed).

<a id="skew-row-lattice-count"></a>
#### Counting row lattices with prescribed skew minima

`GN.4/skew-row-lattice-count` · theorem

Let n ≥ 2, 1 ≤ r < n, s = diag(t_1^{−1}, …, t_n^{−1}) with t_1 ≥ c t_2 ≥ ⋯ (s in the Siegel torus T′: t_i ≫ t_{i+1}) and L = (L_1, …, L_r) with 0 < L_1 ≤ ⋯ ≤ L_r. Let Σ(L, s) be the set of primitive Λ ⊆ ℤⁿ of rank r whose minima μ_i of s^{−1}Λ satisfy L_i ≤ μ_i < 2L_i. (a) If Σ(L, s) ≠ ∅ then L_i t_j^{−1} > c' for all i + j ≥ n + 1, with c' depending only on n. (b) #Σ(L, s) ≪_n (L_1⋯L_r)^n·∏_{1≤i<j≤r}(L_i/L_j)·C(r, s).

**Hypotheses.**

- The ordering t_1 ≫ ⋯ ≫ t_n is part of the hypothesis (s ∈ T′).
- The diagonal skew matrix s = diag(t_1,…,t_n) has t_i > 0 and ∏_i t_i = 1 (so s ∈ SL_n(ℝ)); uniformity is asserted only for these skews.

**Proof plan.**

1. (a) A basis ℓ_1, …, ℓ_r of Λ with |s^{−1}ℓ_i| < 2L_i has integral entries u_ij with |u_ij| ≤ 2L_it_j^{−1}. If L_kt_{n+1−k}^{−1} < c'' for some k and a small c'', then |u_ij| < 1, so u_ij = 0, for all i ≤ k and j ≤ n + 1 − k (L_it_j^{−1} ≪ L_kt_{n+1−k}^{−1} there); thus ℓ_1, …, ℓ_k lie in the (k − 1)-dimensional span of e_{n+2−k}, …, e_n, contradicting independence.
2. (b) Count r-tuples (ℓ_1, …, ℓ_r) in s^{−1}ℤⁿ with L_i ≤ |ℓ_i| < 2L_i forming a reduced basis: for each i the coordinates j ≤ α(i) (with L_i t_{α(i)}^{−1} ≤ c') vanish, and bounded-domain-count bounds the choices of ℓ_i in the remaining coordinates; (a) gives α(i) ≤ n − i; multiply and compare with C(r, s).

**Acceptance checks.**

- s = 1 (all t_i = 1): (b) reads #Σ ≪ (L_1⋯L_r)^n∏(L_i/L_j), the count of primitive rank-r lattices with minima ≍ L_i (compare primitive-lattice-minima-count).

**Intended library:** `TauCeti/GeometryOfNumbers/SkewSymmetricCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_skewRowLattices_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/bounded-domain-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/symmetric-row-lattices`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/adapted-basis-coordinates`

**Source locators.**

- **BSW2025**, Lemma 5.6, Proposition 5.7 and proofs, (27)–(28), pp.23–24 (published; Lemma 5.6 and (27) in arXiv v1): Lemma 5.6 gives the condition L_it_j^{−1} > c′ for i + j ≥ n + 1; Proposition 5.7 bounds #Σ(L, s).

<a id="skew-singular-symmetric-count"></a>
#### Singular integral symmetric matrices in skewed balls

`GN.4/skew-singular-symmetric-count` · theorem

Let n ≥ 2, 1 ≤ r < n, Θ > 0, D ⊆ S(ℝ) bounded, Y ≥ 2 and s = diag(t_1^{−1}, …, t_n^{−1}) ∈ T′ with t_1 ≤ C·Y^Θ and t_n ≥ c·Y^{−Θ}. Let N_r(Y, s) = #(s(Y·D) ∩ S(ℤ)^{(r)}), S(ℤ)^{(r)} the integral symmetric matrices of rank exactly r. Then N_r(Y, s) ≪_{n,Θ,D} C(r, s)·Y^{nr/2}·(log Y)^r, uniformly in s.

**Hypotheses.**

- The endpoint constraints t_1 ≪ Y^Θ, t_n ≫ Y^{−Θ} make the number of dyadic ranges O((log Y)^r).
- The diagonal skew matrix s = diag(t_1,…,t_n) has t_i > 0 and ∏_i t_i = 1 (so s ∈ SL_n(ℝ)); uniformity is asserted only for these skews.

**Proof plan.**

1. Fibre the rank-r matrices by their saturated row lattice Λ (symmetric-row-lattices): N_r(Y, s) = Σ_Λ #(Y·D ∩ s^{−1}(S(Λ)^{full})) after transporting by γ = s^{−1}.
2. Decompose the Λ dyadically by the minima of s^{−1}Λ (sets Σ(L, s)); eskin-katznelson-nonvanishing and skew-row-lattice-count (a) confine L to O((log Y)^r) dyadic boxes.
3. For each box combine row-lattice-matrix-count with d(s^{−1}Λ) ≍ L_1⋯L_r and skew-row-lattice-count (b); the product telescopes to C(r, s)Y^{nr/2}.

**Acceptance checks.**

- s = 1: N_r(Y, 1) ≪ Y^{nr/2}(log Y)^r, the Eskin–Katznelson upper bound for rank-r symmetric matrices of norm ≤ Y.
- The restriction Y ≥ 2 avoids a vanishing (log Y)^r as Y decreases to 1 while a fixed nonzero integral singular matrix can remain in the region.

**Intended library:** `TauCeti/GeometryOfNumbers/SkewSymmetricCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_skew_singular_symmetric_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/row-lattice-matrix-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/skew-row-lattice-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/eskin-katznelson-nonvanishing`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/symmetric-row-lattices`

**Source locators.**

- **BSW2025**, Theorem 5.1, p.21, and its proof, pp.24–25 (published): States N_r(Y, s) = O(C(r, s)Y^{nr/2} log^r Y) uniformly for s ∈ T′ with t_1 ≪ Y^Θ, t_n ≫ Y^{−Θ}; proved by summing Proposition 5.5 over dyadic ranges using Proposition 5.7.

### 4.10 Planar domains with curvature

Fixed-domain curvature constants and absolute all-ellipses constants are separate contracts. The Fourier argument below proves the latter at exponent 2/3; Huxley’s stronger range remains conditional.

<a id="curvature-lattice-class"></a>
#### Planar domains with a curvature-controlled lattice count

`GN.4/curvature-lattice-class` · definition

A C² convex planar domain is a compact convex E ⊆ ℝ² with nonempty interior whose boundary is a C² curve of nowhere vanishing curvature; A(E) is its area and R_max(E) the maximum radius of curvature of ∂E. For C > 0 and θ > 0, L(C, θ) is the class of C² convex planar domains E such that for every integer a ≥ 1 and every x₀ ∈ ℤ² with A(E) ≥ a²: |#(a^{−1}(E − x₀) ∩ ℤ²) − a^{−2}A(E)| ≤ C·(R_max(E)/a)^θ. An exponent θ is admissible (for integral binary forms) if some C makes every ellipse {Q ≤ X}, Q a positive definite integral binary quadratic form and X > 0, belong to L(C, θ).

**Hypotheses.**

- The estimate is uniform over integer translates x₀ and integer scalings a, as the sieve applications require.
- Ellipses of definite integral binary forms have analytic boundary of nonzero curvature.

**Uses.**

- Khayutin 2019, Theorem 9.7 and Propositions 10.10–10.15, pp.70–98: sieved upper bounds for representation numbers in ellipses use an admissible exponent
- SieveMethodsAndPrimePatterns:SV.1–SV.2 (request for the L(C_l, θ_l) input): binary convex large sieve and power-level sieves

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.IsC2ConvexDomain` (constructor): IsC2ConvexDomain E: E compact convex with nonempty interior and C² boundary of nonvanishing curvature, with radiusOfCurvatureMax E.
- `TauCeti.GeometryOfNumbersPlan.CurvatureLatticeClass` (constructor): CurvatureLatticeClass C θ E ↔ IsC2ConvexDomain E ∧ ∀ a : ℕ, 1 ≤ a → ∀ x₀ : ℤ × ℤ, (a:ℝ)^2 ≤ area E → |#((a⁻¹ • (E − x₀)) ∩ ℤ²) − area E / a^2| ≤ C * (radiusOfCurvatureMax E / a)^θ.
- `TauCeti.GeometryOfNumbersPlan.IsAdmissibleExponent` (constructor): IsAdmissibleExponent θ ↔ ∃ C > 0, ∀ Q positive definite integral binary form, ∀ X > 0, CurvatureLatticeClass C θ {v | Q v ≤ X}.
- `TauCeti.GeometryOfNumbersPlan.CurvatureLatticeClass.mono` (structure): For θ ≤ θ′ and C′ ≥ C·π^{(θ′−θ)/2}, CurvatureLatticeClass C θ E implies CurvatureLatticeClass C′ θ′ E.
- `TauCeti.GeometryOfNumbersPlan.IsAdmissibleExponent.mono` (structure): θ ≤ θ' → IsAdmissibleExponent θ → IsAdmissibleExponent θ'.
- `TauCeti.GeometryOfNumbersPlan.radiusOfCurvatureMax_ellipse` (simp): For Q = ax² + bxy + cy² positive definite and X > 0 the maximal radius of curvature of {Q ≤ X} is an explicit algebraic function of a, b, c, X, ≍ X^{1/2}.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.curvatureClass_disc_translate` (computation): For E the closed disc of radius 1 centred at 0 and a = 1, x₀ = 0, the count is 5 and A(E) = π; |5 − π| ≈ 1.86 must be ≤ C·1^θ, forcing C ≥ 1.86.
- `TauCeti.GeometryOfNumbersPlan.curvatureClass_small_area` (degenerate): If A(E) < a² the condition imposes nothing for that a.
- `TauCeti.GeometryOfNumbersPlan.square_not_C2` (non-example): The unit square is not IsC2ConvexDomain, so it is in no class L(C, θ); its lattice error is of order the perimeter, not (R/a)^θ.
- `TauCeti.GeometryOfNumbersPlan.isAdmissible_mono_test` (characterisation): IsAdmissibleExponent (3/4) follows from IsAdmissibleExponent (2/3 + 1/100).

**Proof plan.**

1. Membership is a uniform family of lattice counts for the dilates a^{−1}(E − x₀), equivalently counts of the lattice aℤ² + x₀ in E.
2. For θ′ ≥ θ, A(E) ≤ πR_max(E)² gives R_max(E)/a ≥ π^{−1/2}. Thus L(C,θ) ⊆ L(C·π^{(θ′−θ)/2},θ′). One may then increase C further; the constant cannot in general be left unchanged.

**Acceptance checks.**

- Every disc of radius ρ has R_max = ρ and lies in L(C, 2/3) for an absolute C (van der Corput).
- A square is not C² convex in this sense (curvature vanishes on its sides), so it is not in any L(C, θ).

**Intended library:** `TauCeti/GeometryOfNumbers/PlanarCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `CurvatureLatticeClass`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:Convex`
- `mathlib:IsCompact`

**Source locators.**

- **Khayutin2019**, §9, the class L(C_l, θ_l) before Remark 9.5, p.69, and Definition 10.8, p.90 (arXiv:1710.04557v3): Defines L(C_l, θ_l) by the uniform count over integer translates and scalings and calls θ_l admissible when all ellipses of definite integral binary forms lie in L(C_l, θ_l).
- **IKKN2004**, §3.1, pp.9–10 (arXiv:math/0410522): Fixes the curvature conventions (class C^k boundaries, r_min, r_max) for plane convex domains.

<a id="ellipse-fourier-decay"></a>
#### Fourier decay of an ellipse with its full shape dependence

`GN.4/ellipse-fourier-decay` · theorem

There is an absolute C such that for every planar ellipse E=c+T(B̄₂), with singular values A≥B>0, and every ξ≠0, |∫_E exp(−2πi⟨ξ,x⟩)dx|≤C AB(1+|Tᵀξ|)^{−3/2}≤C√R |ξ|^{−3/2}, where R=A²/B is its maximal radius of curvature. Constants are independent of A/B and c.

**Proof plan.**

1. A linear change of variables and a rotation take the transform to AB times the unit-disc transform at s=|Tᵀξ|; translation only supplies a unit-modulus phase. Integrating cross sections gives the one-dimensional integral ∫_{−1}^1 2√(1−v²) exp(−2πisv)dv. This is also the explicit integral underlying KN (3.19)–(3.20).
2. For s≤2 use the disc area. For s>2 remove endpoint intervals of length δ=1/s, whose integrals are O(δ^{3/2}). On [−1+δ,1−δ] integrate twice by parts. Endpoint values of √(1−v²) are O(√δ), endpoint first derivatives are O(δ^{-1/2}), and the integral of the absolute second derivative is O(δ^{-1/2}). Every resulting term is O(s^{-3/2}). Thus a finite absolute constant follows without depending on the numerical Bessel maximum or an unread special-function reference.
3. Finally |Tᵀξ|≥B|ξ|, so AB(1+|Tᵀξ|)^{-3/2}≤(A/√B)|ξ|^{-3/2}=√R |ξ|^{-3/2}. This is the precise quantitative primary-source Fourier contract used in the uniform ellipse count.

**Acceptance checks.**

- A=B=a gives the familiar a^{1/2}|ξ|^{-3/2} disc bound.
- For ξ in the short-axis direction, the coefficient A/√B grows with eccentricity; a shape-independent area-normalized coefficient would be false.
- Translating the ellipse changes only the Fourier phase, hence leaves the estimate unchanged.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `ellipse_fourier_decay`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:SchwartzMap.tsum_eq_tsum_fourier`

**Source locators.**

- **KN2004**, §3, (3.19)–(3.20), pp.8–9: Gives the ellipse-transform integral and its support-function dependence. The elementary endpoint proof here replaces the numerical Bessel bound and retains all shape dependence.

<a id="uniform-ellipse-lattice-count"></a>
#### Uniform van der Corput exponent for every ellipse

`GN.4/uniform-ellipse-lattice-count` · theorem

There is an absolute C such that for every real planar ellipse E, in every orientation and with arbitrary centre, |#(E∩ℤ²)−area(E)|≤C(1+R_max(E))^{2/3}. No lower bound on the smaller semiaxis and no bounded-eccentricity hypothesis is imposed.

**Proof plan.**

1. Write the semiaxes A≥B>0 and R=A²/B. If R<1 then A≤R<1, so the ellipse meets at most nine integer points and has bounded area. Assume R≥1 and put δ=(1/4)R^{-1/3}.
2. If B<2δ, then A=√(RB)≤√(2Rδ)≪R^{1/3}. Davenport’s compact convex estimate in dimension two gives error O(1+V₁(E))=O(1+A), enough for the asserted bound. This explicitly handles arbitrarily thin ellipses and avoids an invalid inner smoothing.
3. If B≥2δ, put r=δ/B≤1/2 and let E_± be the concentric ellipses with axes (1±r)A,(1±r)B. Choose one fixed nonnegative C∞ bump of mass one supported in the unit disc and rescale it to radius δ. Since the centred ellipse contains the B-disc, E_-+δB̄₂⊆E and E+δB̄₂⊆E_+. Thus 1_{E_-}*η_δ≤1_E≤1_{E_+}*η_δ pointwise, including lattice points on the boundary. The two main integrals differ from area(E) by O(Aδ)≤O(Rδ).
4. Apply Poisson to each smooth compactly supported convolution. The required ℤ² identity is obtained by applying pinned SchwartzMap.tsum_eq_tsum_fourier successively to both coordinates; Schwartz estimates justify all sum/integral interchanges. The nonzero Fourier coefficients are bounded by ellipse-fourier-decay and |η̂_δ(m)|≤C_N(1+δ|m|)^{-N}, obtained by integration by parts for this fixed bump. R_max(E_±)≤(3/2)R.
5. Summing over dyadic Euclidean annuli, which contain O(2^{2q}) integer points of norm about 2^q, gives Σ_{m≠0}|m|^{-3/2}(1+δ|m|)^{-N}≪δ^{-1/2} for N≥3. The error is therefore O(Rδ+√R δ^{-1/2})=O(R^{2/3}). All constants came from one fixed bump, the absolute ellipse-transform estimate and dimension-two Davenport; none depends on the form, aspect ratio, orientation or centre. This adapts the primary source’s smoothing argument with an isotropic bump instead of dropping its G₀,G₁ factors.

**Acceptance checks.**

- A long thin ellipse is handled by B<2δ; its major semiaxis is then O(R^{1/3}).
- All orientations are allowed: no integral rotation or bounded shape reduction occurs.
- For E/a with area(E)≥a², R(E)/a≥1/√π, so the additive one can be absorbed uniformly.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `uniform_ellipse_lattice_count`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ellipse-fourier-decay`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-principle`
- `mathlib:SchwartzMap.tsum_eq_tsum_fourier`

**Source locators.**

- **KN2004**, §3 smoothing proof, (3.4), pp.4–5; Satz 2 proof, (3.18)–(3.20), pp.8–9: The proof here adapts the explicit Fourier/smoothing argument, keeping a uniform curvature coefficient; it does not claim the source’s displayed G₀,G₁ bound already has the desired form.

<a id="van-der-corput-planar-count"></a>
#### Van der Corput's bound for C² convex domains

`GN.4/van-der-corput-planar-count` · theorem

For every fixed C² convex planar domain E with nonzero curvature there is C_E such that every real x≥1 satisfies |#(xE∩ℤ²)−x²area(E)|≤C_E x^{2/3}. For ellipses the stronger shape-uniform conclusion is uniform-ellipse-lattice-count, with the absolute curvature-dependent bound C(1+R_max(E))^{2/3}. In particular every θ>2/3 is admissible for integral binary forms.

**Planet:** Van der Corput lattice-point bound.

**Hypotheses.**

- The general C² assertion is a fixed-domain theorem. Its constant is not used to prove uniformity over changing ellipses.
- The survey also reports Chaix’s stronger absolute-curvature form for general C² domains; its unseen primary proof is not claimed here.

**Proof plan.**

1. For a fixed E split the boundary into finitely many graph arcs with bounded slope, interchanging the coordinate axes near vertical tangencies. The two curvature bounds of this fixed domain give positive E-dependent lower and upper bounds for the absolute second derivative on these arcs. Under dilation by x the bounds are proportional to x⁻¹.
2. The standard sawtooth-sum argument uses a Fourier cutoff H and the second-derivative estimate on each graph arc. Its bound is O_E(x/H+√(xH)+√x+1); taking H comparable to x^{1/3} gives O_E(x^{2/3}). Boundary-integral/Euler summation accounts for the graph endpoints and the area main term. This is the fixed-domain classical result reported in IKKN §3.1, p.9; the general primary proof remains an indirect-source item.
3. For the parameter-uniform conclusion use the separate, fully quantified uniform-ellipse-lattice-count and admissible-ellipse-exponents. No assertion that a fixed-domain constant depends only on R_max is used.

**Acceptance checks.**

- The circle of radius √X: the error is O(X^{1/3}), the classical Gauss circle exponent of van der Corput.
- Jarník's convex curves show the exponent 2/3 cannot be improved for general C² domains.

**Intended library:** `TauCeti/GeometryOfNumbers/PlanarCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `abs_card_smul_inter_sub_le_vanDerCorput`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/curvature-lattice-class`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/uniform-ellipse-lattice-count`

**Source locators.**

- **IKKN2004**, §3.1, 'Van der Corput's estimate', p.9 (arXiv:math/0410522): States P(x; CD₂) ≪ x^{2/3} for C² boundaries, Chaix's form |P| ≤ C(1 + r_max x)^{2/3} with absolute C, Krätzel's explicit constants, and Jarník's optimality.
- **Khayutin2019**, Remark 9.5, p.69: Deduces from van der Corput's bound that every C² convex domain lies in L(C_l, 2/3 + ε).

<a id="huxley-planar-count"></a>
#### Huxley's bound for C³ convex domains

`GN.4/huxley-planar-count` · theorem

Target contract: for every C³ convex planar domain E with nonzero curvature, |#(xE∩ℤ²)−x²area(E)|≤C_E x^{131/208}(log x)^{18637/8320} for x≥2. The stronger input needed for admissibility is: there is one absolute C such that every ellipse F satisfies |#(F∩ℤ²)−area(F)|≤C(1+R_max(F))^{131/208}(log(2+R_max(F)))^{18637/8320}. The second assertion is an explicit unresolved Huxley input, not a consequence of the first assertion with an unspecified C_E.

**Hypotheses.**

- C³ boundary in the fixed-domain assertion. The uniform ellipse assertion quantifies over all eccentricities, orientations, centres and scales.
- Both the advanced exponent-sum proof and the precise uniform primary-source hypotheses are retained in the inherited Huxley gap. The certified elementary alternative in this continuation is exponent 2/3.

**Proof plan.**

1. The fixed-domain exponent is reported in IKKN §3.1, p.10, and KN (1.1), p.1. Its proof uses the discrete Hardy–Littlewood/Bombieri–Iwaniec–Huxley spacing arguments. The 2003 primary proof was not accessible in a permitted readable copy, so this continuation does not certify or redevelop it.
2. For uniform admissibility the stated second contract must be established from a quantitative primary theorem, including its normalized-derivative hypotheses for unbounded-eccentricity ellipses, or by a separate proof. A bound with C_E depending on the ellipse is insufficient. Record this as an open inherited input; subsequent use below exponent 2/3 is conditional on it.

**Acceptance checks.**

- The circle: P(x) ≪ x^{131/208+ε}, 131/208 ≈ 0.6298 < 2/3.

**Intended library:** `TauCeti/GeometryOfNumbers/PlanarCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `abs_card_smul_inter_sub_le_huxley`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/curvature-lattice-class`

**Source locators.**

- **IKKN2004**, §3.1, 'Huxley's estimate', p.10: States Huxley's 1993 bound x^{46/73} for C³ boundaries and his 2003 improvement x^{131/208}(log x)^{18637/8320}.
- **Khayutin2019**, Remark 9.5, p.69 (citing Huxley 2003, Proposition 5 and Theorem 5): Deduces that all ellipses belong to L(C_l, 131/208 + ε).

<a id="admissible-ellipse-exponents"></a>
#### Admissible lattice-count exponents for ellipses

`GN.4/admissible-ellipse-exponents` · application

Every θ≥2/3 is admissible in the sense of curvature-lattice-class. Conditional on the explicitly stated uniform ellipse contract in huxley-planar-count, every θ>131/208 is admissible. The latter range retains the inherited Huxley proof gap.

**Hypotheses.**

- Admissibility uses one constant for all positive definite integral binary forms and all eligible scales and translates.
- No bounded-eccentricity reduction is assumed. The 2/3 route is established by the primary-source Fourier/smoothing adaptation; the improved Huxley route is conditional.

**Proof plan.**

1. For F=a⁻¹(E−x₀), the semiaxes and maximal radius of curvature scale by a⁻¹. Its area is at least one, and for an ellipse area(F)=πAB≤πR(F)², so R(F)≥π^{-1/2}. Apply uniform-ellipse-lattice-count: (1+R)^{2/3}≤(1+√π)^{2/3}R^{2/3}. This proves admissibility at 2/3 itself, uniformly even for arbitrary real ellipses.
2. Use the corrected exponent-monotonicity API, with its π^{(θ′−θ)/2} constant adjustment, for every θ≥2/3.
3. If the uniform Huxley ellipse contract is supplied, let η=θ−131/208>0 and use (log(2+R))^{18637/8320}≪_η(1+R)^η. The same lower bound R≥π^{-1/2} absorbs the additive one, yielding C_θ R^θ. This implication is valid without claiming that the unresolved uniform contract has been proved.

**Acceptance checks.**

- θ=0.7 and θ=2/3 follow from the elementary uniform ellipse theorem.
- θ=0.64 requires the explicitly unresolved uniform Huxley contract.
- An arbitrarily eccentric integral ellipse remains inside the quantified 2/3 estimate.

**Intended library:** `TauCeti/GeometryOfNumbers/PlanarCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `isAdmissibleExponent_of_two_thirds_lt`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/uniform-ellipse-lattice-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/huxley-planar-count`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/curvature-lattice-class`

**Source locators.**

- **Khayutin2019**, Definition 10.8 and the sentence after it, p.90: Any θ_l > 2/3 is admissible by van der Corput and any θ_l > 131/208 by Huxley.

### 4.11 Explicit counts in applications

<a id="markoff-fibre-count"></a>
#### Points of a Markoff level set with a fixed first coordinate

`GN.4/markoff-fibre-count` · lemma

For integers a with 3 ≤ a ≪ K^{1/3}, let N_a(K) be the number of integer pairs (m, n) with a ≤ m ≤ n and a² + m² + n² + amn ≤ K. Then N_a(K) = log((√(a−2) + √(a+2))/2)·(K − a²)/√(a² − 4) − E_a(K) + O(√K), where E_a(K) = ((K − a²)/a)·(U√(1 + U²) + arsinh U − U²) with U = a²/(2√(K − a²)) accounts for the excluded strip 0 ≤ m < a; E_a(K) ≍ a√K for a ≤ K^{1/4}.

**Hypotheses.**

- The region is a piece of the interior of a hyperbola-type conic in the (m, n)-plane; the constant in O(√K) is absolute.

**Proof plan.**

1. The inequality defines an ellipse-like region {m² + n² + amn ≤ K − a²} which for a ≥ 3 is the region between two lines of a hyperbola; restrict to a ≤ m ≤ n.
2. Count lattice points by columns: for each m the n-range is an interval of explicit length; sum with error O(1) per column and O(√K) columns.
3. Integrate the column lengths: the full sector gives the log term and the strip 0 ≤ m < a gives E_a(K).

**Acceptance checks.**

- a = 3, K large: the main term is log((1 + √5)/2)·(K − 9)/√5.

**Intended library:** `TauCeti/GeometryOfNumbers/MarkoffCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `markoffFibreCount_eq`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-principle`

**Source locators.**

- **GS2022**, §7, Lemma 7.1, pp.21–22 (arXiv:1706.06712v3): States the count with main term log[(√(a−2)+√(a+2))/2](K − a²)/√(a²−4) + O(√K); the strip correction E_a(K) is missing in the source (PAPER-GHOSH-SARNAK-22/E1, confirmed).

<a id="markoff-fundamental-set-count"></a>
#### Counting points in the Markoff fundamental sets

`GN.4/markoff-fundamental-set-count` · theorem

Let R⁺(K) = #{(x₁, x₂, x₃) ∈ ℤ³ : 3 ≤ x₁ ≤ x₂ ≤ x₃, x₁² + x₂² + x₃² + x₁x₂x₃ ≤ K} and R⁻(K) = #{(x₁, x₂, x₃) ∈ ℤ³ : 3 ≤ x₁ ≤ x₂ ≤ x₃ ≤ x₁x₂/2, 1 ≤ x₁x₂x₃ − x₁² − x₂² − x₃² ≤ K}. Then R^±(K) = (1/48)K(log K)² + O(K log K).

**Hypotheses.**

- The constant is 1/48 for both signs (corrected from the printed 1/36 for R⁺).

**Proof plan.**

1. Sum markoff-fibre-count over 3 ≤ a ≤ K^{1/3} (the condition a ≤ m ≤ n forces a³ ≲ K). The main terms are (1/2)(log a)K/a·(1 + O(1/a)), and Σ_{a≤K^{1/3}}(K/2)(log a)/a = (K/4)(log K^{1/3})² + O(K log K) = K(log K)²/36 + O(K log K).
2. The strip corrections are O(a√K) for a ≤ K^{1/4} (in total Σ_{a≤K^{1/4}} a√K = O(K)) and (K/a)(log(a²/√K) + O(1)) for K^{1/4} ≤ a ≤ K^{1/3}; with u = log a their sum is K∫_{L/4}^{L/3}(2u − L/2)du + O(K log K) = K(log K)²/144 + O(K log K), L = log K. Hence R⁺(K) = K(log K)²(1/36 − 1/144) = K(log K)²/48 + O(K log K).
3. R⁻ is treated by the analogous column count for the region 1 ≤ x₁x₂x₃ − Σx_i² ≤ K with x₃ ≤ x₁x₂/2.

**Acceptance checks.**

- The two counts have the same main term.

**Intended library:** `TauCeti/GeometryOfNumbers/MarkoffCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `markoffFundamentalCount_eq`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/markoff-fibre-count`

**Source locators.**

- **GS2022**, §7, Lemmas 7.2–7.3, p.22: States R⁺(K) = (1/36)K(log K)² + O(K log K) and R⁻(K) = (1/48)K(log K)² + O(K log K); the reviewed extraction re-derived 1/48 for both (PAPER-GHOSH-SARNAK-22/E1, confirmed).

<a id="blomer-granville-representation-bound"></a>
#### Restricted second-moment bound for pairs of representations

`GN.4/blomer-granville-representation-bound` · theorem

There is an absolute C such that for K≥2 and an integer d≥1 satisfying 16d²≤K, the number of integer quadruples with s₁²+d t₂²=s₂²+d t₁², |s_j|≤√K and |t_j|≤√(K/d) is at most C(K/√d + K log K·τ(d)/d). This range includes d=a²−4 in the asymptotic regime of Ghosh–Sarnak §9: (log K)²<A≪_εK^ε and √A≤a≤A, for sufficiently large K. No assertion is made for all d≤K.

**Hypotheses.**

- K is real, d a positive integer; the stated numerical restriction implies K≥16. The estimate includes zero coordinates and the zero representation.
- The positive definite form x²+d y² is primitive of discriminant −D=−4d, which need not be fundamental.

**Proof plan.**

1. The common value n lies in [0,2K]. Apart from n=0, the box count is bounded by w_D² Σ_{1≤n≤2K} r_g(n)², where g=x²+dy², r_g counts representations modulo the w_D≤6 automorphisms. Each orbit has exactly w_D elements for n>0, since a nonidentity orientation-preserving automorphism fixes no nonzero vector.
2. Use Toma Theorem 1 with β=2 and −D=D₀ f². Its main coefficient is absolutely bounded: the factors w_{D/e²} are at most six, u_{θ_e(g)}≥1, and Σ_{e|f}φ(f/e)/f=1. Consequently the main term is O(x/√D), uniformly in f and g.
3. Keep the full error: Σ_{e|f}(2^{ω(f/e)}/e)√(x/a_{θ_e(g)}) + τ(f²) + τ(D)(x log x/D + x/D^{3/4}). Here a_{θ_e(g)}≥1. The conductor sum is at most √x·τ(f²), because Σ_{e|f}2^{ω(f/e)}=τ(f²); also τ(f²)≤2f≤2√D.
4. Since D=4d≤√K and x=2K, √(xD)+√D ≪ x/√D. The elementary divisor bound τ(D)≪D^{1/4} absorbs xτ(D)/D^{3/4} into x/√D. It follows by separating the finitely many primes p<2^4 in the product τ(D)=∏(v_p(D)+1); their ratios to p^{v_p(D)/4} have finite suprema. Finally τ(4d)≤3τ(d). These estimates give the displayed bound, including the single n=0 tuple.
5. For the GS application, choose ε=1/16 in A≪_εK^ε. Then 4(a²−4)≤4A²≪K^{1/8}≤√K for sufficiently large K, uniformly for a≤A. In the second moment of R_d, interchanging the two t variables converts equality of s²−dt² into the positive-form pair equation; the sector bounds s≪√K,t≪√(K/d) only enlarge x and constants by absolute factors.
6. The deleted unrestricted statement fails for K=2 and prime d→∞: t₁=t₂=0 already supplies five solutions. Retain that test so no subsequent extension silently drops the parameter restriction.

**Acceptance checks.**

- For d=1 and K≥16 this gives O(K log K), consistent with the sum-of-two-squares second moment.
- The diagonal family t₁=t₂=0 has O(√K) elements, absorbed since d≤√K/4.
- For d=a²−4 the discriminant −4d is often nonfundamental; the conductor formula is used without replacing d by its squarefree part.

**Intended library:** `TauCeti/GeometryOfNumbers/MarkoffCounts`; namespace `TauCeti.GeometryOfNumbersPlan`; target `card_two_representations_le`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:ArithmeticFunction.sigma`

**Source locators.**

- **Toma2020**, Theorem 1, PDF pp.3–4; proof in §3, PDF pp.8–9: Provides the second moment for arbitrary negative quadratic discriminants, with the conductor sum and extra errors retained before absorption in the stated range.
- **BG2006**, §1.1, pp.2–3; Theorem 2, p.5: Supplies the fundamental-discriminant result generalized by Toma; it alone is not used to assert the nonfundamental case.
- **GS2022**, §9.1 parameter choices, pp.25–26; Lemma 9.5 and its proof, p.29: The small-power range for A places every d=a²−4 used here inside 16d²≤K eventually; swapping t variables gives the positive-definite second moment.

### 4.12 Transference, covering and Construction A

<a id="transference-minkowski-constant"></a>
#### Transference with Minkowski's constant

`GN.4/transference-minkowski-constant` · theorem

Let L be a full lattice in an n-dimensional real inner-product space (n ≥ 1) with polar (inner dual) L*, λ_1 ≤ … ≤ λ_n the successive minima of L and λ*_1 ≤ … ≤ λ*_n those of L* for the closed unit ball B. Then 1 ≤ λ_iλ*_{n+1−i} ≤ c(n) for every i, with c(n) = 4ⁿ/vol(B)².

**Hypotheses.**

- Euclidean ball on both sides; the constant is weaker than Banaszczyk's n (dual-transference-upper) but the proof is complete from Minkowski's second theorem.

**Proof plan.**

1. Lower bound: dual-transference-lower (for every j, λ_jλ*_{n+1−j} ≥ 1).
2. Minkowski's second theorem for L and L* (GN.1 minkowski-second-upper) with covol(L)covol(L*) = 1 (GN.0 covolume-dual): ∏_j λ_j·∏_j λ*_j ≤ 4ⁿ/vol(B)².
3. Hence λ_iλ*_{n+1−i} = ∏_j(λ_jλ*_{n+1−j}) / ∏_{j≠i}(λ_jλ*_{n+1−j}) ≤ 4ⁿ/vol(B)², the denominator being ≥ 1.

**Acceptance checks.**

- L = ℤⁿ: all minima are 1 and the products equal 1.
- n = 1, L = aℤ: λ_1λ*_1 = a·a^{−1} = 1 ≤ 4/2² = 1, equality.

**Intended library:** `TauCeti/GeometryOfNumbers/Transference`; namespace `TauCeti.GeometryOfNumbersPlan`; target `successiveMinimum_mul_dual_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/dual-transference-lower`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.0/covolume-dual`

**Source locators.**

- **EvertseGeometry**, §2.4, Theorem 2.20, its remark and proof, printed pp.32–33: Proves 1 ≤ λ_iλ*_{n+1−i} ≤ c(n) and notes that Minkowski's second theorem gives c(n) = 4ⁿvol(Bⁿ)^{−2}.

<a id="max-norm-covering"></a>
#### Covering from a lower bound on the dual lattice

`GN.4/max-norm-covering` · theorem

Let L be a full lattice in ℝⁿ (n ≥ 1) with polar L* = {y : ⟨y, x⟩ ∈ ℤ for all x ∈ L}, and R > 0. (a) If ‖y‖₂ ≥ R for every nonzero y ∈ L*, then every b ∈ ℝⁿ has some x ∈ L with ‖x − b‖₂ ≤ n/R. (b) If ‖y‖_∞ ≥ R for every nonzero y ∈ L*, then every b has some x ∈ L with ‖x − b‖_∞ ≤ ‖x − b‖₂ ≤ n/R. In terms of a basis matrix B (L = Bℤⁿ, L* = (Bᵀ)^{−1}ℤⁿ) the constant n depends only on n.

**Hypotheses.**

- For the same numerical R, the sup-norm lower bound in (b) implies the Euclidean lower bound in (a), since ‖y‖₂ ≥ ‖y‖∞; hence (b) follows directly from (a).

**Proof plan.**

1. (a) μ(L)·λ_1(L*) ≤ n (covering-dual-transference) and λ_1(L*) ≥ R give μ(L) ≤ n/R; the covering radius is attained (covering-radius).
2. (b) ‖y‖₂ ≥ ‖y‖_∞ ≥ R, so (a) applies; finally ‖x − b‖_∞ ≤ ‖x − b‖₂.
3. Evertse's Corollary 2.21 gives the same with constant n·c(n)/2 from transference-minkowski-constant, without Gaussian sums.

**Acceptance checks.**

- L = ℤⁿ, R = 1: every b is within ‖·‖_∞-distance 1/2 ≤ n of ℤⁿ.
- n = 1, L = aℤ, L* = a^{−1}ℤ, R = 1/a: distance a/2 ≤ a.

**Intended library:** `TauCeti/GeometryOfNumbers/Transference`; namespace `TauCeti.GeometryOfNumbersPlan`; target `exists_mem_sup_norm_sub_le_of_dual`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-dual-transference`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/covering-radius`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/transference-minkowski-constant`
- `mathlib:LinearMap.BilinForm.dualSubmodule`

**Source locators.**

- **EvertseGeometry**, §2.4, Corollary 2.21 and proof, printed p.33: If every nonzero y ∈ L* has ‖y‖₂ > R then every b is within Euclidean distance n·c(n)/(2R) of L.
- **RegevTransference**, Theorem 4, pp.5–6: μ(L)λ_1(L*) ≤ n, the constant used in (a).

<a id="construction-a-minimum"></a>
#### The minimum of a Construction A lattice

`GN.4/construction-a-minimum` · theorem

Let p be prime, n ≥ 1, C ⊆ 𝔽_pⁿ a linear code and L_C = {x ∈ ℤⁿ : x mod p ∈ C} its unscaled Construction A lattice. For c ∈ C let wt_E(c) = Σ_i c̃_i², where c̃_i ∈ ℤ is the representative of c_i with |c̃_i| ≤ p/2 (the Euclidean weight). Then min{‖x‖² : x ∈ L_C ∖ {0}} = min(p², min_{c ∈ C∖{0}} wt_E(c)) (with the second term omitted for C = 0). For p = 2, wt_E is the Hamming weight, so the minimal norm is min(4, d(C)).

**Hypotheses.**

- The real realisation is the one of construction-a-real-lattice-interface (scale 1); the rescaled lattice p^{−1/2}L_C has minimal norm divided by p.

**Proof plan.**

1. If x ∈ L_C is nonzero with x ∈ pℤⁿ then ‖x‖² ≥ p², attained by pe_1.
2. Otherwise c = x mod p ≠ 0 and |x_i| ≥ |c̃_i| coordinatewise, so ‖x‖² ≥ wt_E(c); the lift (c̃_i) itself lies in L_C.
3. For p = 2, c̃_i ∈ {0, 1} and wt_E(c) = wt_H(c).

**Acceptance checks.**

- C = 0: L_C = pℤⁿ and the minimal norm is p².
- C = 𝔽_pⁿ: L_C = ℤⁿ and the minimum is 1 = wt_E(e_1).
- The extended Hamming [8,4,4] code over 𝔽₂ gives minimal norm min(4, 4) = 4 (the E₈ lattice scaled by √2).

**Intended library:** `TauCeti/GeometryOfNumbers/Coding`; namespace `TauCeti.GeometryOfNumbersPlan`; target `construction_a_minNorm_eq`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/construction-a-real-lattice-interface`
- `mathlib:ZMod.valMinAbs`
- `mathlib:ZMod.natAbs_valMinAbs_le`

**Source locators.**

- **XKV2025**, §II, (8)–(9), p.2 (arXiv:2502.10728v1): For a binary linear code the Construction A lattice has volume 2^{n−k} and squared minimum distance min(4, d_c), d_c the minimum Hamming distance, because 2ℤⁿ is contained in the lattice; the general-p statement with Euclidean weights is proved in the steps by the same comparison.

### 4.13 The space of lattices, its measure and its flows

<a id="space-of-unimodular-lattices"></a>
#### The space of unimodular lattices

`GN.4/space-of-unimodular-lattices` · construction

For n ≥ 1 let G_n = SL_n(ℝ) with its matrix topology and Γ_n = SL_n(ℤ), embedded in G_n by the entrywise cast. The space of unimodular lattices is X_n = G_n/Γ_n (left cosets gΓ_n) with the quotient topology and its Borel σ-algebra, with the continuous left action h·gΓ_n = hgΓ_n. The map gΓ_n ↦ gℤⁿ (the lattice spanned by the columns of g) is a bijection from X_n onto the set of full lattices in ℝⁿ of covolume 1, equivariant for the linear action of SL_n(ℝ). The right-coset model Γ_n\G_n (lattice spanned by the rows) is identified with X_n by Γ_ng ↦ gᵀΓ_n, a homeomorphism intertwining right multiplication by h with left multiplication by hᵀ.

**Planet:** Space of unimodular lattices.

**Hypotheses.**

- n ≥ 1; X_1 is a point.
- Column convention: g ↦ gℤⁿ; consumers in the row convention compose with the transpose homeomorphism.
- The topology is the quotient topology; on lattices it is the topology of convergence of bases (Chabauty), which agrees with it.

**Uses.**

- ProbabilisticAndMetricNumberTheory:PM.4 (request): concrete SL(2,ℝ)/SL(2,ℤ) quotient, Borel structure and the transpose identification for the row convention
- mahler-compactness (base packet): compactness in the quotient topology
- siegel-mean-value (base packet), siegel-transform: functions on X_n defined by summing over the lattice gℤⁿ
- Kleinbock–Margulis 1998, §5: δ(Λ) and trajectories h(x)ℤ^k in the space of lattices
- Morris, Ratner's theorems, §1.2: orbits of SO(Q)° on SL(3, ℝ)/SL(3, ℤ)

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.UnimodularLattices` (constructor): UnimodularLattices n := Matrix.SpecialLinearGroup (Fin n) ℝ ⧸ (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ)).range.
- `TauCeti.GeometryOfNumbersPlan.UnimodularLattices.toLattice` (projection): toLattice : UnimodularLattices n → Submodule ℤ (Fin n → ℝ), gΓ ↦ span ℤ (columns of g); well defined.
- `TauCeti.GeometryOfNumbersPlan.UnimodularLattices.toLattice_injective` (extensionality): toLattice is injective.
- `TauCeti.GeometryOfNumbersPlan.UnimodularLattices.range_toLattice` (characterisation): range toLattice = {L | DiscreteTopology L ∧ IsZLattice ℝ L ∧ ZLattice.covolume L = 1}.
- `TauCeti.GeometryOfNumbersPlan.UnimodularLattices.toLattice_smul` (functoriality): toLattice (h • x) = (h : Matrix) '' toLattice x as ℤ-submodules.
- `TauCeti.GeometryOfNumbersPlan.UnimodularLattices.instTopologicalSpace` (instance): Quotient topology; T2, locally compact, second countable; the action of SL_n(ℝ) is continuous.
- `TauCeti.GeometryOfNumbersPlan.UnimodularLattices.transposeHomeomorph` (equivalence): The homeomorphism from the right quotient Γ\G to G/Γ, Γg ↦ gᵀΓ, intertwining right translation by h with left translation by hᵀ.
- `TauCeti.GeometryOfNumbersPlan.UnimodularLattices.base` (data): The base point Γ_n with toLattice = ℤⁿ.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.unimodularLattices_one_subsingleton` (degenerate): UnimodularLattices 1 is a single point.
- `TauCeti.GeometryOfNumbersPlan.toLattice_base` (computation): toLattice (base) = ℤⁿ, i.e. span ℤ of the standard basis.
- `TauCeti.GeometryOfNumbersPlan.toLattice_diag` (computation): For n = 2 and t > 0, toLattice (diag(t, t⁻¹)·base) = tℤ × t⁻¹ℤ.
- `TauCeti.GeometryOfNumbersPlan.toLattice_covolume_one` (compatibility): For every x, ZLattice.covolume (toLattice x) volume = 1.
- `TauCeti.GeometryOfNumbersPlan.twoZ_not_unimodular` (non-example): 2ℤ² has covolume 4, so it is not in the range of toLattice.

**Proof plan.**

1. G_n is a locally compact second countable topological group (closed embedding into matrices, Matrix.SpecialLinearGroup.isClosedEmbedding_val) and Γ_n is a discrete subgroup, so X_n is a locally compact Hausdorff space and the quotient map is open.
2. gℤⁿ = g'ℤⁿ iff g⁻¹g' ∈ GL_n(ℤ), and det g = det g' = 1 forces det(g⁻¹g') = 1, i.e. g⁻¹g' ∈ SL_n(ℤ), so the map is injective; it is surjective onto covolume-one lattices because every such lattice has a basis whose matrix has determinant +1 (change the sign of one basis vector if necessary).
3. Transpose: Γ_ng ↦ gᵀΓ_n is well defined since (γg)ᵀ = gᵀγᵀ and Γ_n is transpose-stable; it is a homeomorphism as transpose is continuous and involutive, and (gh)ᵀ = hᵀgᵀ gives the intertwining.

**Acceptance checks.**

- X_2 is identified with the unit tangent bundle of the modular surface; the point Γ_2 corresponds to ℤ².
- diag(t, t^{−1})ℤ² leaves every compact set as t → ∞ (mahler-compactness).

**Intended library:** `TauCeti/GeometryOfNumbers/LatticeSpace`; namespace `TauCeti.GeometryOfNumbersPlan`; target `UnimodularLattices`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:Matrix.SpecialLinearGroup`
- `mathlib:Matrix.SpecialLinearGroup.map`
- `mathlib:Matrix.SpecialLinearGroup.isTopologicalGroup`
- `mathlib:Matrix.SpecialLinearGroup.isClosedEmbedding_val`
- `mathlib:QuotientGroup.mk`
- `mathlib:ZLattice.covolume`
- `AdelicAlgebraicGroups:AA.3`

**Source locators.**

- **Benoist2019**, Physical pp.5–7, lattice-space conventions and Mahler's statement: Describes SL_n(ℝ)/SL_n(ℤ) as the space of covolume-one lattices with its invariant probability.
- **Miller2020**, §4, p.10: The space Γ\G of unimodular lattices spanned by the rows of g ∈ SL(n, ℝ), the row convention, with its bi-invariant Haar measure of finite volume.
- **MorrisRatner**, Corollary 4.8.5, printed p.144: SL(ℓ, ℤ) is a lattice in SL(ℓ, ℝ).

<a id="lattice-space-invariant-probability"></a>
#### The invariant probability on the space of lattices

`GN.4/lattice-space-invariant-probability` · construction

For n ≥ 2 there is a unique SL_n(ℝ)-invariant Borel probability measure μ_n on X_n. It is the normalised pushforward of Haar measure restricted to a measurable fundamental domain: for a fundamental domain F of Γ_n in SL_n(ℝ), μ_n(A) = m_G(F ∩ π⁻¹A)/m_G(F), and m_G(F) < ∞ because Γ_n is a lattice.

**Hypotheses.**

- n ≥ 2 (for n = 1 the space is a point and μ_1 is the Dirac mass).
- Uniqueness is among invariant Borel probability measures on the homogeneous space; full Haar measure on G cannot be pushed forward and normalised, since Γ is infinite.

**Uses.**

- ProbabilisticAndMetricNumberTheory:PM.4: normalised invariant Haar probability on SL(2,ℝ)/SL(2,ℤ)
- siegel-mean-value (base packet): the measure μ in Siegel's formula
- homogeneous-mixing (this packet), howe-moore-mixing (base packet): the L² space of the quotient

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.latticeSpaceMeasure` (constructor): latticeSpaceMeasure n : Measure (UnimodularLattices n).
- `TauCeti.GeometryOfNumbersPlan.latticeSpaceMeasure.isProbabilityMeasure` (instance): IsProbabilityMeasure (latticeSpaceMeasure n) for n ≥ 2.
- `TauCeti.GeometryOfNumbersPlan.latticeSpaceMeasure.smulInvariant` (instance): SMulInvariantMeasure (SL n ℝ) (UnimodularLattices n) (latticeSpaceMeasure n).
- `TauCeti.GeometryOfNumbersPlan.latticeSpaceMeasure_eq_of_invariant` (extensionality): Every SL_n(ℝ)-invariant Borel probability measure on X_n equals latticeSpaceMeasure n.
- `TauCeti.GeometryOfNumbersPlan.latticeSpaceMeasure_quotient` (compatibility): The homogeneous-space quotient integral formula for G/Γ_n, with counting Haar measure on Γ_n and μ_n normalised by covolume; this does not assert QuotientMeasureEqMeasurePreimage for a normal subgroup.
- `TauCeti.GeometryOfNumbersPlan.integral_latticeSpace_eq` (characterisation): ∫ f dμ_n = (1/m_G(F)) ∫_F f(gΓ) dm_G(g) for a measurable fundamental domain F.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.latticeSpaceMeasure_univ` (degenerate): latticeSpaceMeasure n univ = 1.
- `TauCeti.GeometryOfNumbersPlan.latticeSpaceMeasure_one` (degenerate): For n = 1 the space is a point and the measure is the Dirac mass.
- `TauCeti.GeometryOfNumbersPlan.latticeSpaceMeasure_base_null` (computation): The singleton {base} has measure 0 for n ≥ 2.
- `TauCeti.GeometryOfNumbersPlan.counting_measure_not_invariant` (non-example): For n ≥ 2 the Dirac mass at base is not SL_n(ℝ)-invariant: an embedded diag(2,1/2) moves base.

**Proof plan.**

1. Use the homogeneous-space quotient integral formula of AdelicAlgebraicGroups AA.2 for the discrete, nonnormal subgroup Γ_n. The Mathlib quotient-group Haar theorem assumes a normal subgroup and is not a provider here.
2. Finite covolume: Siegel sets cover SL_n(ℝ) up to Γ_n and have finite Haar measure (AdelicAlgebraicGroups AA.3, 'S-arithmetic subgroups are lattices' with S = {∞}, or gln-real-reduction); normalise.
3. Uniqueness: a G-invariant Borel probability on G/Γ_n lifts, through a measurable fundamental domain, to a left-invariant Radon measure on G, i.e. a Haar measure, unique up to the scalar fixed by the total mass.

**Acceptance checks.**

- μ_2 corresponds, under X_2 ≅ T¹(SL_2(ℤ)\ℍ), to the normalised Liouville measure; the hyperbolic area of the modular surface is π/3.

**Intended library:** `TauCeti/GeometryOfNumbers/LatticeSpace`; namespace `TauCeti.GeometryOfNumbersPlan`; target `latticeSpaceMeasure`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/space-of-unimodular-lattices`
- `mathlib:MeasureTheory.Measure.haar`
- `mathlib:MeasureTheory.IsFundamentalDomain`
- `AdelicAlgebraicGroups:AA.2`
- `AdelicAlgebraicGroups:AA.3`

**Source locators.**

- **Miller2020**, §4, p.10: Haar measure on SL(n, ℝ) is bi-invariant (no nontrivial characters to ℝ_{>0}) and Γ\G has finite volume.
- **MorrisRatner**, Corollary 4.8.5, printed p.144 (Borel–Harish-Chandra, Theorem 4.8.4): SL(ℓ, ℤ) is a lattice in SL(ℓ, ℝ), so the invariant measure is finite.

<a id="mahler-compactness-sup-norm"></a>
#### Mahler's criterion with the sup norm

`GN.4/mahler-compactness-sup-norm` · lemma

For n ≥ 2 and ε > 0 the set {x ∈ X_n : ‖v‖_∞ ≥ ε for every nonzero v ∈ toLattice x} is compact, and a subset of X_n is relatively compact iff the sup-norm first minimum is bounded below on it by a positive constant. The same holds with ‖·‖_∞ replaced by any norm on ℝⁿ.

**Hypotheses.**

- The equivalence of norms changes ε by a factor depending only on n.

**Proof plan.**

1. ‖v‖_∞ ≤ ‖v‖₂ ≤ √n‖v‖_∞, so the sup-norm set for ε lies between the Euclidean sets for ε and √n·ε.
2. Apply the Euclidean criterion (mahler-compactness); closedness of the sup-norm set follows from continuity of the sup-norm first minimum on X_n.

**Acceptance checks.**

- For n = 2, the set with ε = 1 contains base (ℤ²) and diag(t, 1/t)·base only for t = 1.

**Intended library:** `TauCeti/GeometryOfNumbers/LatticeSpace`; namespace `TauCeti.GeometryOfNumbersPlan`; target `isCompact_setOf_supNorm_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/space-of-unimodular-lattices`
- `mathlib:pi_norm_le_iff_of_nonneg'`
- `mathlib:EuclideanSpace.norm_eq`

**Source locators.**

- **Benoist2019**, Fact 1.5, physical p.7: Mahler's criterion: a subset of the space of unimodular lattices is relatively compact iff the norms of nonzero vectors are bounded below.

<a id="mahler-bounded-basis"></a>
#### Bounded bases for lattices without short vectors

`GN.4/mahler-bounded-basis` · lemma

For n ≥ 1 and ε > 0 there is A(n, ε) such that every full lattice L ⊆ ℝⁿ of covolume 1 with λ_1(L) ≥ ε has a ℤ-basis b_1, …, b_n with ‖b_j‖ ≤ A(n, ε) for all j; equivalently L = gℤⁿ with g ∈ SL_n(ℝ) of operator norm ≤ A and ‖g⁻¹‖ ≤ A'(n, ε).

**Hypotheses.**

- Covolume exactly 1 (bounded covolume suffices with A depending on the bound).

**Proof plan.**

1. Minkowski's second theorem: λ_1⋯λ_n ≤ 2ⁿ/V_n, so λ_n ≤ 2ⁿ/(V_n ε^{n−1}).
2. adapted-basis-coordinates (or GN.1 basis-from-minima) gives a basis with ‖b_j‖ ≤ jλ_j ≤ n·λ_n.
3. The inverse: the rows of g⁻¹ form the dual basis, whose norms are ≤ ∏_{i≠j}‖b_i‖/covol by Cramer and Hadamard.

**Acceptance checks.**

- L = ℤⁿ: the standard basis, A = 1.
- L = diag(ε, 1/ε)ℤ²: the basis (ε, 0), (0, 1/ε) has norm 1/ε, consistent with A(2, ε) ≥ 1/ε.

**Intended library:** `TauCeti/GeometryOfNumbers/LatticeSpace`; namespace `TauCeti.GeometryOfNumbersPlan`; target `exists_basis_norm_le_of_minimum`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/adapted-basis-coordinates`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/basis-from-minima`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.1/minkowski-second-upper`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.0/orthonormal-coordinate-hadamard`

**Source locators.**

- **Benoist2019**, Fact 1.5, physical p.7: Mahler's criterion, whose proof reduces to bases bounded in terms of ε.
- **EvertseGeometry**, §2.3, Exercise 2.8 and Theorem 2.11, printed pp.24–28: Bases adapted to the minima and with product of lengths bounded by the covolume.

<a id="diagonal-and-unipotent-flows"></a>
#### Diagonal and unipotent flows on the space of lattices

`GN.4/diagonal-and-unipotent-flows` · definition

On X_n the diagonal flow of a vector (s_1, …, s_n) with Σ s_i = 0 is a_t·x = diag(e^{s_1t}, …, e^{s_nt})·x, and the unipotent flow of a nilpotent matrix N is u_t·x = exp(tN)·x (t ∈ ℝ). For n = 2, a_t = diag(e^t, e^{−t}), u_t = [[1, t], [0, 1]] and ū_t = [[1, 0], [t, 1]]; they satisfy a_s u_t a_{−s} = u_{e^{2s}t}. The time-one map of a is T(x) = a_1·x.

**Hypotheses.**

- Left action on G/Γ (column convention). In the row convention Γ\G the same flows act on the right; the transpose homeomorphism of space-of-unimodular-lattices exchanges u_t with ū_t.

**Uses.**

- ProbabilisticAndMetricNumberTheory:PM.4: continuous left action of a_t = diag(e^t, e^{−t}) and its time-one map
- mautner-phenomenon, homogeneous-mixing (this packet): the commutation relation and mixing of a_t
- unipotent-nondivergence (base packet), unipotent-quantitative-recurrence: unipotent trajectories

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.diagFlow` (constructor): diagFlow s t : SL n ℝ = diag (exp (s i * t)) for s with Σ s = 0.
- `TauCeti.GeometryOfNumbersPlan.unipotentFlow` (constructor): unipotentFlow N t : SL n ℝ = exp (t • N) for N nilpotent (trace zero).
- `TauCeti.GeometryOfNumbersPlan.diagFlow_add` (simp): diagFlow s (t + t') = diagFlow s t * diagFlow s t'.
- `TauCeti.GeometryOfNumbersPlan.unipotentFlow_add` (simp): unipotentFlow N (t + t') = unipotentFlow N t * unipotentFlow N t'.
- `TauCeti.GeometryOfNumbersPlan.continuous_diagFlow_smul` (structure): (t, x) ↦ diagFlow s t • x is continuous on ℝ × X_n.
- `TauCeti.GeometryOfNumbersPlan.conj_diagFlow_unipotentFlow` (relation): For n = 2: a_s u_t a_{−s} = u_{e^{2s} t}.
- `TauCeti.GeometryOfNumbersPlan.measurePreserving_diagFlow` (structure): x ↦ diagFlow s t • x preserves μ_n.
- `TauCeti.GeometryOfNumbersPlan.timeOne` (data): timeOne s x = diagFlow s 1 • x.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.diagFlow_zero` (degenerate): diagFlow s 0 = 1.
- `TauCeti.GeometryOfNumbersPlan.diagFlow_two_base` (computation): For n = 2, toLattice (diagFlow (1, −1) t • base) = e^tℤ × e^{−t}ℤ.
- `TauCeti.GeometryOfNumbersPlan.conj_relation_test` (computation): For n = 2, a_1 u_1 a_{−1} = u_{e²} as matrices.
- `TauCeti.GeometryOfNumbersPlan.unipotentFlow_not_diag` (non-example): u_1 is not diagonalisable over ℝ: it differs from the identity but has both eigenvalues 1.

**Proof plan.**

1. t ↦ a_t and t ↦ u_t are continuous homomorphisms ℝ → SL_n(ℝ) (matrix exponential), so they define continuous flows on X_n preserving μ_n.
2. The commutation relation is a matrix identity.

**Acceptance checks.**

- a_t·base for n = 2 is e^tℤ × e^{−t}ℤ.
- u_t·base = ℤ(1, 0) + ℤ(t, 1).

**Intended library:** `TauCeti/GeometryOfNumbers/LatticeSpace`; namespace `TauCeti.GeometryOfNumbersPlan`; target `diagFlow`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/space-of-unimodular-lattices`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/lattice-space-invariant-probability`
- `mathlib:NormedSpace.exp`
- `mathlib:Matrix.SpecialLinearGroup`

**Source locators.**

- **MorrisRatner**, §1.1, the geodesic flow γ_t and horocycle flow η_t on Γ\SL(2, ℝ), and Proposition 3.2.3, printed p.102: The diagonal and unipotent one-parameter subgroups of SL(2, ℝ) with the relation a^{−s}u^ta^{s} = u^{e^{s}t} used in the Mautner phenomenon (row convention, right action).
- **KM1998**, §5, Theorem 5.3, p.15 (arXiv:math/9810036): Trajectories u_xΛ of one-parameter unipotent subgroups of SL_k(ℝ).

<a id="mautner-phenomenon"></a>
#### The Mautner phenomenon

`GN.4/mautner-phenomenon` · lemma

Let G be a Lie group, Γ a lattice and μ a probability measure on Γ\G invariant under one-parameter subgroups u_t and a_s with a_{−s}u_ta_s = u_{e^s t}. If f ∈ L²(Γ\G, μ) is essentially a_s-invariant then f is essentially u_t-invariant.

**Hypotheses.**

- Only the commutation relation and invariance of μ under both flows are used.

**Proof plan.**

1. The unitary operators U_t, A_s of right translation satisfy A_{−s}U_tA_s = U_{e^s t}.
2. If A_sf = f then ‖U_tf − f‖ = ‖A_{−s}U_tA_sf − f‖ = ‖U_{e^st}f − f‖ for all s; letting s → −∞ and using strong continuity of t ↦ U_t gives U_tf = f.

**Acceptance checks.**

- G = SL(2, ℝ): the geodesic flow and horocycle flow satisfy the relation.

**Intended library:** `TauCeti/GeometryOfNumbers/Mixing`; namespace `TauCeti.GeometryOfNumbersPlan`; target `ae_invariant_of_ae_invariant_conj`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/diagonal-and-unipotent-flows`
- `mathlib:MeasureTheory.Lp`
- `mathlib:MeasureTheory.Lp.compMeasurePreserving`

**Source locators.**

- **MorrisRatner**, Proposition 3.2.3 and Corollaries 3.2.4–3.2.5, printed p.102 (arXiv:math/0310402): States the Mautner phenomenon in this form, with the ergodicity consequences for the geodesic flow.

<a id="homogeneous-mixing"></a>
#### Mixing of noncompact one-parameter flows

`GN.4/homogeneous-mixing` · theorem

Let G be a connected simple Lie group with finite centre, Γ a lattice, μ the G-invariant probability measure on Γ\G, and g_t a one-parameter subgroup whose closure is not compact. Then for all real-valued φ, ψ ∈ L²(Γ\G, μ): ∫ φ(xg_t)ψ(x) dμ(x) → (∫φ dμ)(∫ψ dμ) as t → ∞. In particular g_t is mixing and ergodic, and so is every time-t₀ map x ↦ xg_{t₀} with t₀ ≠ 0.

**Planet:** Mixing of one-parameter flows.

**Hypotheses.**

- The limit is the product of the integrals, not of the L² norms (sourceIssue E402).
- G simple (not merely semisimple): for products one must leave every compact set in each factor.

**Proof plan.**

1. Use the base packet’s exact howe-moore-mixing contract: connected noncompact almost-simple real Lie group with finite centre, strongly continuous unitary representation, no nonzero invariant vectors, and escape from all compact subsets. Its general decay proof remains the base packet’s explicit gap; this continuation supplies the homogeneous-space adapter and does not assert a new contracting-subgroup generation theorem.
2. Right translation is unitary on L²(Γ\G,μ) by invariance. It is strongly continuous: continuous compactly supported functions are dense for the Radon finite quotient measure; translations converge uniformly on one compact neighborhood of their supports, hence in L². Approximate an arbitrary L² vector and use unitarity to pass continuity to it.
3. The invariant vectors are the constants. To justify the almost-everywhere point: smooth an invariant L² vector by a smooth compactly supported approximate identity on G. In quotient coordinate charts differentiation under this compact convolution gives a smooth representative, which is continuous and invariant; transitivity of G on Γ\G makes it constant. The approximate identity converges in L² by strong continuity. Thus the zero-mean closed subspace has no nonzero invariant vector.
4. A one-parameter subgroup with noncompact closure escapes every compact set as |t|→∞. Apply Ad, whose kernel is the finite centre and whose map onto the adjoint group is proper. For exp(t·ad X), a nonzero real part of an eigenvalue or a nonzero nilpotent part in real Jordan form forces its matrix or inverse norm to tend to infinity. Otherwise ad X is semisimple with purely imaginary spectrum and the closure is compact, contrary to the hypothesis. This also justifies both signs of t₀.
5. Remove the means of φ,ψ and apply the base Howe–Moore theorem to their matrix coefficient. Add the constants back to get the product of integrals. For complex functions the sesquilinear version uses conjugation on ψ and on its integral. Restrict to t=m t₀ with m→∞ (and the negative-time version when t₀<0) for mixing of each nonzero time map; mixing implies ergodicity.

**Acceptance checks.**

- G = SL(2, ℝ), Γ = SL(2, ℤ), g_t = diag(e^{t/2}, e^{−t/2}): the geodesic flow on the modular surface is mixing.
- For φ = ψ = 1_A with 0 < μ(A) < 1 the limit is μ(A)², not μ(A).

**Intended library:** `TauCeti/GeometryOfNumbers/Mixing`; namespace `TauCeti.GeometryOfNumbersPlan`; target `tendsto_integral_comp_flow_mul`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/howe-moore-mixing`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/lattice-space-invariant-probability`
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`

**Source locators.**

- **MorrisRatner**, Remark 3.2.8, Theorem 3.2.9, Remarks 3.2.10–3.2.12 and proof, printed pp.103–105 (arXiv:math/0310402): States and proves mixing of one-parameter subgroups with noncompact closure on finite-volume quotients of connected simple Lie groups with finite centre; the displayed limit is misprinted as ‖φ‖₂‖ψ‖₂ (E402).

<a id="time-one-mixing-sl2"></a>
#### Mixing of the time-one map of the diagonal flow on X_2

`GN.4/time-one-mixing-sl2` · application

Let T : X_2 → X_2 be x ↦ a_1·x with a_1 = diag(e, e^{−1}). Then T preserves μ_2, is mixing (μ(T^{−k}A ∩ B) → μ(A)μ(B) for all Borel A, B) and hence ergodic.

**Hypotheses.**

- Left action in the column convention; the row-convention statement for x ↦ x·a_1 on Γ\G follows through the transpose homeomorphism.

**Proof plan.**

1. Transport to the right quotient by space-of-unimodular-lattices (transposeHomeomorph); there a_1 acts by right multiplication by a_1ᵀ = a_1.
2. SL(2, ℝ) is connected and simple with centre {±1} and {a_t} has noncompact closure; apply homogeneous-mixing with t ∈ ℕ to indicator functions.
3. Mixing implies ergodicity (if T⁻¹A = A then μ(A) = μ(A)²).

**Acceptance checks.**

- Continuous-flow ergodicity alone would not give ergodicity of T; mixing does.

**Intended library:** `TauCeti/GeometryOfNumbers/Mixing`; namespace `TauCeti.GeometryOfNumbersPlan`; target `ergodic_timeOne_sl2`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/homogeneous-mixing`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/diagonal-and-unipotent-flows`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/space-of-unimodular-lattices`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/lattice-space-invariant-probability`
- `mathlib:Ergodic`

**Source locators.**

- **MorrisRatner**, Theorem 3.2.9, printed p.103: Mixing of one-parameter subgroups with noncompact closure, applied to the geodesic flow on Γ\SL(2, ℝ).

### 4.14 Quantitative nondivergence

The marked-poset definition tests all elements comparable to every member of its finite chain. In particular, the empty chain still tests every poset element. The primitive flag uses the maximum exterior-coordinate norm.

<a id="good-functions"></a>
#### (C, α)-good functions

`GN.4/good-functions` · definition

Let V ⊆ ℝ^d and C, α > 0. A continuous f : V → ℝ is (C, α)-good on V if for every open ball B ⊆ V and every ε > 0: |{x ∈ B : |f(x)| < ε}| ≤ C·(ε/‖f‖_B)^α·|B|, where ‖f‖_B = sup_B |f| and |·| is Lebesgue measure (with the convention 1/0 = ∞, so the condition is empty when f vanishes on B).

**Hypotheses.**

- Continuity of f; balls are open Euclidean balls contained in V.
- C > 0 and α > 0. In a real-valued Lean predicate use witnessed positive lower bounds M for sup_B |f|, rather than an unbounded real iSup; require the inequality for every such M. This agrees with the source on bounded balls by approximation to the supremum and also handles unbounded f.

**Uses.**

- Kleinbock–Margulis 1998, Theorem 5.2: hypothesis (i) on the functions ψ_Γ(x) = ‖h(x)Γ‖
- Kleinbock–Margulis 1998, Theorem 5.3: coordinates of h(x)(v_1 ∧ ⋯ ∧ v_j) are polynomials, hence good

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.IsGood` (constructor): IsGood C α V f ↔ C>0 ∧ α>0 ∧ ContinuousOn f V ∧ ∀ x r, r>0 → ball x r ⊆ V → ∀ M>0, (∃ y∈ball x r, M≤|f y|) → ∀ ε>0, volume {y∈ball x r | |f y|<ε} ≤ C*(ε/M)^α*volume (ball x r), interpreting the measure inequality in ℝ via toReal on these finite-volume balls.
- `TauCeti.GeometryOfNumbersPlan.IsGood.abs` (structure): IsGood C α V f ↔ IsGood C α V (|f|).
- `TauCeti.GeometryOfNumbersPlan.IsGood.const_mul` (structure): IsGood C α V f → IsGood C α V (λ • f).
- `TauCeti.GeometryOfNumbersPlan.IsGood.iSup` (structure): For a nonempty indexed family of good functions, if the family of absolute values is pointwise bounded above and its supremum is continuous, that supremum is (C,α)-good. Boundedness prevents the real iSup from collapsing on an unbounded family.
- `TauCeti.GeometryOfNumbersPlan.isGood_polynomial` (example): For k ≥ 1 and p : ℝ[X] with natDegree p ≤ k, IsGood (2*k*(k+1)^(1/k)) (1/k) univ (eval · p).
- `TauCeti.GeometryOfNumbersPlan.IsGood.mono` (structure): C ≤ C' → IsGood C α V f → IsGood C' α V f.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.isGood_id` (computation): IsGood 4 1 univ id on ℝ.
- `TauCeti.GeometryOfNumbersPlan.isGood_zero` (degenerate): For C>0 and α>0, the zero function is (C,α)-good: no positive witnessed M exists on a ball.
- `TauCeti.GeometryOfNumbersPlan.isGood_square` (computation): x ↦ x² is (2·2·3^{1/2}, 1/2)-good on ℝ (k = 2).
- `TauCeti.GeometryOfNumbersPlan.not_isGood_flat` (non-example): x ↦ exp(−1/x²) (extended by 0) is not (C, α)-good near 0 for any C, α > 0: its sublevel sets {|f| < ε} contain intervals of length ≍ 1/√log(1/ε).

**Proof plan.**

1. Closure properties: |f| and λf are (C, α)-good when f is; sup_{i∈I}|f_i| is (C, α)-good when every f_i is.
2. Polynomials: a real polynomial of degree ≤ k in one variable is (2k(k+1)^{1/k}, 1/k)-good on ℝ, by Lagrange interpolation at k + 1 well-separated points where |f| < ε. Here k ≥ 1; degree-zero polynomials can be included by choosing k = 1.

**Acceptance checks.**

- f(x) = x on ℝ is (2·2, 1)-good: on B = (−1, 1), |{|x| < ε}| = 2ε = ε·|B|.

**Intended library:** `TauCeti/GeometryOfNumbers/Nondivergence`; namespace `TauCeti.GeometryOfNumbersPlan`; target `IsGood`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:Metric.ball`
- `mathlib:Lagrange.interpolate`

**Source locators.**

- **KM1998**, §3, (3.1), Lemma 3.1 and Proposition 3.2, p.6 (arXiv:math/9810036): Defines (C, α)-good functions, proves the closure properties and that polynomials of degree ≤ k are (2k(k+1)^{1/k}, 1/k)-good on ℝ.

<a id="marked-poset-points"></a>
#### Marked points of a partially ordered family

`GN.4/marked-poset-points` · definition

Let S be a partially ordered set, ψ_s:V→ℝ, and 0<ε≤ρ. A point x∈V is (ε,ρ)-marked if there is a finite chain Σ⊆S such that ε≤|ψ_s(x)|≤ρ for s∈Σ, and |ψ_s(x)|≥ρ for every s∈S\Σ comparable to every member of Σ. The empty chain is allowed; then the second clause tests every s∈S. Continuity is an additional hypothesis of the measure estimate, not of this pointwise predicate.

**Uses.**

- KM Theorem 4.1, pp.9–13: The complement of the marked set is estimated by induction on chain length.
- KM Theorem 5.2, pp.14–15: A marked primitive-subgroup flag excludes vectors with sup norm less than ε.

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.IsMarked` (constructor): IsMarked ψ ε ρ x ↔ ∃ Σ:Finset S, Σ is a chain ∧ (∀s∈Σ, ε≤|ψ_s(x)| ∧ |ψ_s(x)|≤ρ) ∧ ∀s∉Σ, (∀t∈Σ, s≤t ∨ t≤s) → ρ≤|ψ_s(x)|.
- `TauCeti.GeometryOfNumbersPlan.IsMarked.empty` (simp): If every s satisfies |ψ_s(x)|≥ρ, the empty chain witnesses IsMarked ψ ε ρ x; the empty witness satisfies the marking clauses only under this condition.
- `TauCeti.GeometryOfNumbersPlan.IsMarked.mono_epsilon` (structure): 0<ε′≤ε → IsMarked ψ ε ρ x → IsMarked ψ ε′ ρ x.
- `TauCeti.GeometryOfNumbersPlan.IsMarked.chain_length` (structure): If every finite chain has cardinality at most k, IsMarked ψ ε ρ x supplies a marking witness Σ of cardinality at most k, with both marking clauses.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.marked_empty_poset` (degenerate): For S=∅, every x is marked by Σ=∅.
- `TauCeti.GeometryOfNumbersPlan.marked_singleton_threshold` (characterisation): For S a singleton and 0<ε≤ρ, x is marked iff |ψ_s(x)|≥ε; equality ε and equality ρ are included.
- `TauCeti.GeometryOfNumbersPlan.marked_incomparable_pair` (non-example): For two incomparable elements with ψ_a(x)=ε and ψ_b(x)=0<ε<ρ, Σ={a} marks x: b is not comparable to a and is not tested. A definition omitting comparability would incorrectly reject it.
- `TauCeti.GeometryOfNumbersPlan.marked_empty_chain_checks_all` (non-example): For a nonempty singleton with |ψ_s(x)|<ε, the empty chain does not mark x, since its universal comparability condition is vacuous and the ρ lower bound fails.

**Proof plan.**

1. A finite chain and the two displayed inequalities are the complete data; the second clause also quantifies over elements when the chain is empty. No maximality condition is imposed on a marking chain.

**Acceptance checks.**

- For an empty poset every point is marked.
- For a singleton, a value below ε is unmarked and a value at least ε is marked.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `marked_poset_points`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/good-functions`

**Source locators.**

- **KM1998**, §4, definitions before Theorem 4.1, pp.9–10: Records both marking clauses, including comparability, and the empty-chain convention.

<a id="marked-poset-measure-bound"></a>
#### Quantitative estimate for unmarked points

`GN.4/marked-poset-measure-bound` · theorem

Let d≥1, k≥0, B=B(x₀,r₀) with r₀>0 and B̃=B(x₀,3^k r₀). Let S be a countable partially ordered set, every finite chain of which has cardinality at most k, and continuous ψ_s:B̃→ℝ. Assume C,α,ρ>0, each ψ_s is (C,α)-good on B̃, sup_B|ψ_s|≥ρ for every s, and for each x∈B̃ the set {s:|ψ_s(x)|<ρ} is finite. For 0<ε≤ρ the measure of the unmarked subset of B is at most k C (3^d N_d)^k (ε/ρ)^α vol(B), with N_d=Besicovitch.multiplicity(ℝ^d).

**Proof plan.**

1. Countability ensures measurability: finite chains form a countable family, and each marking condition is a countable intersection/union of closed inequalities. The primitive-subgroup application is countable. For k=0 the poset is empty and all points are marked.
2. For an unmarked x∈B put H_x={s:|ψ_s(x)|<ρ}; it is finite and nonempty, since otherwise the empty chain marks x. For s∈H_x let r_{s,x} be the largest radius ≤2r₀ on which sup_{B(x,r)}|ψ_s|≤ρ. Continuity gives positivity and passage to the endpoint. Since B⊆B(x,2r₀) and sup_B≥ρ, the supremum at this maximal radius equals ρ. Choose s_x maximizing r_{s,x} over H_x and put B_x=B(x,r_{s_x,x}). Then |ψ_{s_x}|≤ρ on B_x, while sup_{B_x}|ψ_s|≥ρ for every s: for s outside H_x its centre value suffices, and for s∈H_x use maximality.
3. Let S_x be the strict link of s_x, namely all other elements comparable to s_x. Its chain length is at most k−1. The enlarged ball 3^{k−1}B_x lies in B̃ because its radius is ≤2·3^{k−1}r₀ and its centre is in B. All goodness, lower-bound and local-finiteness hypotheses pass to this link. By induction, its unmarked subset of B_x has measure at most (k−1)C(3^dN_d)^{k−1}(ε/ρ)^α vol(B_x).
4. If y∈B∩B_x is unmarked for S but marked for S_x, then |ψ_{s_x}(y)|<ε: otherwise adjoining s_x to a witness chain marks it for S (|ψ_{s_x}|≤ρ on B_x; any element comparable to the enlarged chain lies in S_x). Goodness bounds this additional set by C(ε/ρ)^α vol(B_x).
5. Package exactly these prescribed balls B_x, x unmarked in B, using radii ≤2r₀. Besicovitch.exist_disjoint_covering_families with goodτ and multiplicity selects N_d families with disjoint closed balls covering every centre. Each selected family is countable by second countability and nonempty disjoint open balls; multiplicity is at most N_d. Every selected ball is in 3B, so Σvol(B_x)≤N_d vol(3B)=N_d3^d vol(B). Multiplying the local bound gives at most kC(3^dN_d)^k, since 3^dN_d≥1. No arbitrary-small-ball or almost-everywhere cover is substituted.

**Acceptance checks.**

- k=0 gives zero unmarked measure.
- A singleton poset reduces to the good-function sublevel estimate.
- The finiteness assumption is pointwise, not a single global finite list of primitive subgroups.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `marked_poset_measure_bound`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/marked-poset-points`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/good-functions`
- `mathlib:Besicovitch.BallPackage`
- `mathlib:Besicovitch.exist_disjoint_covering_families`
- `mathlib:Besicovitch.one_lt_goodτ`
- `mathlib:Besicovitch.isEmpty_satelliteConfig_multiplicity`
- `mathlib:Besicovitch.multiplicity_le`

**Source locators.**

- **KM1998**, Theorem 4.1 and proof, pp.9–13: All length, goodness, nonvanishing and pointwise finiteness conditions are retained. The countable-poset specialization suffices for primitive subgroups and makes measurability explicit.

<a id="primitive-flag-short-vector"></a>
#### A marked primitive flag excludes short vectors

`GN.4/primitive-flag-short-vector` · theorem

For g∈GL_k(ℝ), k≥1, put ψ_Γ=‖g(v₁∧⋯∧v_r)‖∞ for each nonzero primitive subgroup Γ≤ℤ^k of rank r, independently of its integral basis. If 0<ε≤ρ≤1/k and g is (ε,ρ)-marked for the inclusion poset of such Γ, then every nonzero v∈ℤ^k satisfies ‖gv‖∞≥ε.

**Proof plan.**

1. The exterior-coordinate norm satisfies ‖u∧w‖∞≤k‖u‖∞‖w‖∞ when w has rank one: each output coordinate is a sum of at most k products. If Γ is primitive of rank r and v lies outside its real span, Λ=(Γ+ℝv)∩ℤ^k contains Γ+ℤv with finite index. Basis wedges differ by that index, so ψ_Λ≤kψ_Γ‖gv‖∞. This is KM (5.1); no Euclidean-covolume substitution is made.
2. It suffices to test primitive v, since dividing out its positive integral content decreases its norm. Order a marking chain Γ₁<⋯<Γ_l. If v is in the real span of some Γ_i, take the first such i; otherwise use endpoint Γ_{l+1}=ℤ^k. Primitivity puts v inside that first Γ_i. Put Γ=Γ_{i−1} (or zero for i=1), and Λ=(Γ+ℝv)∩ℤ^k. The subgroup Λ lies between consecutive flag members (including endpoints), so it is comparable to the whole flag.
3. Thus ψ_Λ≥ε: either Λ belongs to the marking chain or its norm is ≥ρ by the second marking clause. If Γ is nonzero, ψ_Γ≤ρ, hence ε≤kρ‖gv‖∞≤‖gv‖∞. If Γ=0, do not use ψ_0=1≤ρ (false in general): Λ=ℤv for primitive v, so ψ_Λ=‖gv‖∞ directly.
4. For each fixed g, only finitely many primitive Γ have ψ_Γ<ρ. The integral basis wedge is a primitive nonzero integer point in one of the finitely many exterior powers; ∧^r g is invertible and a bounded norm ball contains finitely many integer points. The wedge determines Γ up to sign. The poset is countable and its chains have length at most k because proper inclusions of primitive subgroups increase rank.

**Acceptance checks.**

- For k=1, marking forces the scalar |g|≥ε.
- The rank-zero predecessor is treated by the vector norm itself; it is not bounded by ρ.
- For g=diag(t,t⁻¹), 0<t<ε, no marking can exclude the subgroup ℤe₁, so the flag criterion correctly fails.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `primitive_flag_short_vector`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/marked-poset-points`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.0/saturated-adapted-basis`
- `mathlib:Module.Basis.det`

**Source locators.**

- **KM1998**, §5, (5.1), p.14; proof of Theorem 5.2, pp.14–15: The wedge norm, saturation and insertion of a primitive vector give the marked-point implication and pointwise finiteness.

<a id="quantitative-nondivergence"></a>
#### Kleinbock–Margulis quantitative nondivergence

`GN.4/quantitative-nondivergence` · theorem

Let d, k ≥ 1, r₀ > 0, C, α > 0, 0 < ρ ≤ 1/k, B = B(x₀, r₀) ⊆ ℝ^d a ball, B̃ = B(x₀, 3^k r₀) and h : B̃ → GL_k(ℝ) continuous. For a primitive subgroup Γ of ℤ^k let ψ_Γ(x) = ‖h(x)Γ‖ (the maximum absolute Plücker coordinate of a basis wedge of h(x)Γ, independent of the integral basis; this is not Euclidean covolume). Suppose that for every Γ: (i) ψ_Γ is (C, α)-good on B̃ and (ii) sup_B ψ_Γ ≥ ρ. Then for every 0 < ε ≤ ρ: |{x ∈ B : δ(h(x)ℤ^k) < ε}| ≤ k·C·(3^d N_d)^k·(ε/ρ)^α·|B|, where δ(Λ) is the sup norm of a shortest nonzero vector and N_d is the Besicovitch constant of ℝ^d.

**Planet:** Quantitative nondivergence.

**Hypotheses.**

- N_d depends only on d; Γ ranges over all nonzero primitive subgroups of ℤ^k.

**Proof plan.**

1. Use the countable poset of nonzero primitive subgroups of ℤ^k, ordered by inclusion, and ψ_Γ(x) as the max absolute Plücker-coordinate norm. Basis invariance follows from determinant ±1 of a change of integral basis. Proper primitive inclusions increase rank, so chain length is at most k.
2. The finite-exterior-lattice argument in primitive-flag-short-vector proves pointwise finiteness below ρ for every x, even though no finite list works globally. Continuity of h makes every ψ_Γ continuous. The stated hypotheses are precisely the remaining assumptions of marked-poset-measure-bound.
3. Apply that estimate. By primitive-flag-short-vector and ρ≤1/k, every marked point has δ(h(x)ℤ^k)≥ε. Therefore the set with δ<ε is contained in the unmarked set, giving the claimed measure bound.

**Acceptance checks.**

- k = 1: h(x) is a scalar and the statement is the good property of |h| itself.
- Constant h(x) = g: the set is empty or all of B according as δ(gℤ^k) ≥ ε or not, consistent with (ii).

**Intended library:** `TauCeti/GeometryOfNumbers/Nondivergence`; namespace `TauCeti.GeometryOfNumbersPlan`; target `volume_setOf_minimum_lt_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/good-functions`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/marked-poset-measure-bound`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/primitive-flag-short-vector`

**Source locators.**

- **KM1998**, §4, Theorem 4.1 and proof, pp.9–13; §5, (5.1), Theorem 5.2 and proof, pp.13–15 (arXiv:math/9810036): States the measure bound k C (3^d N_d)^k (ε/ρ)^α |B| under hypotheses (i)–(ii) on the functions ψ_Γ.

<a id="unipotent-quantitative-recurrence"></a>
#### Quantitative recurrence of unipotent trajectories

`GN.4/unipotent-quantitative-recurrence` · theorem

For every lattice Λ ⊆ ℝ^k there is ρ = ρ(Λ) > 0 such that for every one-parameter unipotent subgroup {u_x} of SL_k(ℝ), every T > 0 and every 0 < ε ≤ ρ: |{0 < x < T : δ(u_xΛ) < ε}| ≤ 2k³·6^k·(k² + 1)^{1/k²}·(ε/ρ)^{1/k²}·T. Consequently, for every x₀ ∈ X_k and η > 0 there is a compact K ⊆ X_k with |{t ∈ [0, T] : u_t x₀ ∉ K}| ≤ ηT for all T > 0.

**Hypotheses.**

- ρ depends on Λ (not on u or T); the compact set in the consequence is uniform in T, which strengthens base unipotent-nondivergence.
- k ≥ 1 and 0 < ε ≤ ρ. The exact source constant uses sup norms for vectors and exterior powers; the same upper bound for the Euclidean short-vector event follows from ‖v‖∞ ≤ ‖v‖₂.

**Proof plan.**

1. Write Λ = gℤ^k and h(x) = u_xg. For a primitive Γ with basis v_1, …, v_j the coordinates of h(x)(v_1 ∧ ⋯ ∧ v_j) are polynomials of degree ≤ k² in x, hence (2k²(k² + 1)^{1/k²}, 1/k²)-good (good-functions), and so is ψ_Γ.
2. ρ = min(1/k, inf_Γ ‖gΓ‖) > 0 by discreteness of Λ; ψ_Γ(0) ≥ ρ gives (ii) on (0, T).
3. Apply quantitative-nondivergence with d = 1 and N_1 = 2: k·[2k²(k²+1)^{1/k²}]·6^k = 2k³6^k(k²+1)^{1/k²}.
4. The consequence: choose ε with the bound ≤ η and K = {δ ≥ ε}, compact by mahler-compactness-sup-norm (Euclidean version).

**Acceptance checks.**

- k = 2, Λ = ℤ², u_x = [[1, x],[0, 1]]: every nonzero vector (p + xq, q) of u_xℤ² has norm ≥ 1 (q ≠ 0 gives |q| ≥ 1, q = 0 gives |p| ≥ 1), so the exceptional set is empty for ε ≤ ρ = 1/2: the periodic horocycle through ℤ² never approaches the cusp.

**Intended library:** `TauCeti/GeometryOfNumbers/Nondivergence`; namespace `TauCeti.GeometryOfNumbersPlan`; target `volume_unipotent_minimum_lt_le`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/quantitative-nondivergence`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/good-functions`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/diagonal-and-unipotent-flows`

**Source locators.**

- **KM1998**, Theorem 5.3 and proof, p.15 (arXiv:math/9810036): States the bound 2k³6^k(k²+1)^{1/k²}(ε/ρ)^{1/k²}T for unipotent trajectories, as a quantitative strengthening of Dani's theorem.
- **MorrisRatner**, Theorem 1.9.2 (Dani–Margulis), printed p.58: The qualitative recurrence statement for unipotent flows on Γ\G.

### 4.15 Borel density and the Oppenheim auxiliaries

General algebraic stabilizers and highest-weight irreducibility are imported from existing owners. The local targets concern projective recurrence and the explicit matrix adapter.

<a id="projective-recurrence-fixed-lines"></a>
#### Invariant projective probabilities for unipotent and positive hyperbolic maps

`GN.4/projective-recurrence-fixed-lines` · theorem

Let V be a finite-dimensional real vector space and a∈GL(V) either unipotent or diagonalizable over ℝ with positive eigenvalues. Every a-invariant Borel probability on the real projective space P(V) gives full measure to the set of a-fixed lines. This fixed set is closed, so every line in the support is a-fixed.

**Proof plan.**

1. For a unipotent, write a=1+N. For each nonzero v choose the largest j with N^jv≠0. The binomial expansion a^m v=Σ_i binom(m,i)N^i v shows [a^m v]→[N^jv], an a-fixed line, as m→∞.
2. For a positive diagonalizable a, decompose v into eigenspaces and take the largest eigenvalue with nonzero component. Dividing a^m v by that eigenvalue to the m-th power gives convergence in projective space to its component line, again fixed.
3. Poincaré recurrence for the invariant finite measure, applied to a countable basis of projective neighborhoods, gives almost every point a subsequence a^{m_i}[v]→[v]. The preceding full-orbit limit is a fixed line, hence [v] itself is fixed. Since the fixed-line set is closed, it contains the support. No claim that all vectors, rather than their lines, are fixed is used.

**Acceptance checks.**

- For diag(2,1), an invariant probability is supported on its two eigenlines.
- A scalar positive map fixes every line, so every probability is allowed.
- A nontrivial rotation need not have a fixed real line and can preserve angular probability; the spectral hypothesis cannot be dropped.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `projective_recurrence_fixed_lines`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:MeasureTheory.Conservative.ae_mem_imp_frequently_image_mem`

**Source locators.**

- **MorrisRatner**, Lemma 4.7.5 and proof, printed pp.141–142: Finite invariant measure plus the projective asymptotic of unipotent/positive hyperbolic iterates forces support on fixed lines.

<a id="borel-density"></a>
#### Borel's density theorem

`GN.4/borel-density` · theorem

Let G be a closed subgroup of SL_ℓ(ℝ) and Γ a lattice in G (discrete with G/Γ of finite G-invariant measure). Then the Zariski closure of Γ in SL_ℓ(ℝ) (the common zero set of all polynomial functions in the matrix entries vanishing on Γ) contains every unipotent element and every hyperbolic (diagonalisable over ℝ with positive eigenvalues) element of G.

**Hypotheses.**

- G closed in SL_ℓ(ℝ); no connectedness or semisimplicity is assumed in this form.
- The conclusion concerns unipotent and hyperbolic elements, not all of G.

**Proof plan.**

1. Let H be the algebraic Zariski closure of Γ in SL_ℓ. Multiplication and inversion are regular, so H is an algebraic subgroup. Import the existing Chevalley stabilizer theorem through ReductiveGroups Layer 3: there are a finite-dimensional algebraic representation ρ and a line ℓ with stabilizer H(ℝ). A single arbitrarily chosen polynomial vanishing on H does not have this property.
2. On G/Γ define F(gΓ)=ρ(g)ℓ. This is well-defined because Γ⊆H, is continuous and G-equivariant. Normalize the assumed finite nonzero invariant quotient measure and push it to P(V). The resulting probability ν is ρ(G)-invariant. The identity line ℓ is in its support: the preimage of every neighborhood of ℓ contains an open neighborhood of the identity coset, of positive quotient measure. Full support of the quotient probability follows from transitivity and second countability: countably many translates of any nonempty open set cover the quotient, so such an open set cannot have measure zero.
3. For a unipotent or positive real-hyperbolic g∈G, the ReductiveGroups Layer 4 contract makes ρ(g) unipotent or positive real-hyperbolic respectively. Apply projective-recurrence-fixed-lines to ν. Its support contains ℓ, so ρ(g) fixes ℓ and the exact stabilizer identity gives g∈H(ℝ).

**Acceptance checks.**

- Γ = SL_ℓ(ℤ) in G = SL_ℓ(ℝ): Γ is Zariski dense.
- A finite group Γ is a lattice only in a compact G, which has no nontrivial unipotent elements: consistent.

**Intended library:** `TauCeti/GeometryOfNumbers/Oppenheim`; namespace `TauCeti.GeometryOfNumbersPlan`; target `unipotent_mem_zariskiClosure_of_lattice`. Implementation status: unchecked.

**Prerequisites.**

- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/projective-recurrence-fixed-lines`

**Source locators.**

- **MorrisRatner**, Proposition 4.7.1 and proof, printed pp.139–142 (arXiv:math/0310402), using Theorem 4.5.2 and Corollary 4.3.6: States and proves that the Zariski closure of a lattice in a closed subgroup of SL(ℓ, ℝ) contains its unipotent and hyperbolic elements.
- **NV2021**, Proof of Lemma 27.8, p.184 (Acta Math. 226 (2021)): Uses Borel density: for a lattice Γ_S in a closed connected S, the real points of the Zariski closure of Γ_S contain the unipotents of S.

<a id="so21-quotient-standard-module"></a>
#### The five-dimensional so(2,1) quotient is the existing highest-weight-four module

`GN.4/so21-quotient-standard-module` · theorem

Let J represent Q(a,b,c)=b²−4ac on ℝ³, let 𝔥={A∈sl₃:AᵀJ+JA=0} and 𝔭={A∈sl₃:AᵀJ=JA}. Then sl₃=𝔥⊕𝔭 as 𝔥-modules, and the action of 𝔥 on 𝔭 is isomorphic to the standard highest-weight-four sl₂ module Sl2Std ℝ 4. Consequently 𝔭, equivalently sl₃/𝔥, is irreducible of dimension five.

**Proof plan.**

1. Use J=[[0,0,−2],[0,1,0],[−2,0,0]]. The matrices E=[[0,1,0],[0,0,2],[0,0,0]], F=[[0,0,0],[2,0,0],[0,1,0]] and H=diag(2,0,−2) lie in 𝔥 and satisfy [H,E]=2E, [H,F]=−2F, [E,F]=H. They are independent and span 𝔥, identifying it with sl₂.
2. The involution A↦J⁻¹AᵀJ preserves trace. Its minus and plus eigenspaces on sl₃ are 𝔥 and 𝔭. Projection by one half of 1 minus/plus this involution proves the direct sum, and [𝔥,𝔭]⊆𝔭 follows by transposition. Directly solving the symmetric condition leaves six parameters and trace zero removes one, so dim 𝔭=5.
3. Put v₀=e₁₃ and v_i=(ad F)^i v₀ for 0≤i≤4. Matrix multiplication gives v_i∈𝔭, v_i≠0, [H,v_i]=(4−2i)v_i, [E,v_i]=i(5−i)v_{i−1} for i≥1, [E,v₀]=0 and [F,v₄]=0. Their distinct weights make them independent, hence a basis. Rescale the basis to the owner’s standard raising/lowering normalization to obtain an explicit intertwiner with Sl2Std ℝ 4.
4. Import irreducibility of that standard module from LieHighestWeight Layer 0, already implemented on current main. Transfer it across the intertwiner. A real change of coordinates and a nonzero scalar take b²−4ac to x₁²+x₂²−x₃² and transport the decomposition. This is a concrete adapter, not a new irreducibility theorem for general sl₂ modules.

**Acceptance checks.**

- The five weights are 4,2,0,−2,−4, each once.
- The plus eigenspace of A↦J⁻¹AᵀJ in all matrices has dimension six; trace zero is necessary to obtain dimension five.
- Dimension alone does not imply irreducibility; the displayed nonzero ladder links all five weight spaces.

**Intended library:** `TauCeti/GeometryOfNumbers/CountingAuxiliaries`; namespace `TauCeti.GeometryOfNumbersPlan`; target `so21_quotient_standard_module`. Implementation status: unchecked.

**Prerequisites.**

- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`
- `mathlib:LieSubalgebra`

**Source locators.**

- **MorrisRatner**, §1.2, proof of Margulis’ theorem, printed pp.14–15: Uses maximality of SO(2,1)°. The quotient identification and explicit five-vector calculation here supply its required representation-theoretic input.

<a id="so21-intermediate-subgroups"></a>
#### Connected subgroups between SO(2,1) and SL(3,ℝ)

`GN.4/so21-intermediate-subgroups` · lemma

Let H = SO(Q₀)° ⊆ SL_3(ℝ) for Q₀ = x₁² + x₂² − x₃². The only connected Lie subgroups S of SL_3(ℝ) with H ⊆ S are S = H and S = SL_3(ℝ).

**Hypotheses.**

- Connected subgroups; the statement is about Lie algebras 𝔥 ⊆ 𝔰 ⊆ 𝔰𝔩_3(ℝ).

**Proof plan.**

1. Use so21-quotient-standard-module to split sl₃=𝔥⊕𝔭 with irreducible 𝔭. For any Lie subalgebra 𝔰 containing 𝔥, its elements’ 𝔥-components already lie in 𝔰, so 𝔰=𝔥⊕(𝔰∩𝔭). The latter intersection is 𝔥-invariant, hence either zero or all of 𝔭.
2. Therefore 𝔰=𝔥 or sl₃. The connected-Lie-subgroup correspondence from LieGroups Layer 2 identifies the connected analytic subgroup with that algebra; since SO(Q₀)° and SL₃(ℝ) are connected, these are the only choices. Closedness of the intermediate subgroup is not needed for the Lie-algebra argument.

**Acceptance checks.**

- The Lie algebra 𝔰𝔬(2,1) has dimension 3 and 𝔰𝔩_3 dimension 8 = 3 + 5.

**Intended library:** `TauCeti/GeometryOfNumbers/Oppenheim`; namespace `TauCeti.GeometryOfNumbersPlan`; target `eq_or_eq_top_of_so21_le`. Implementation status: unchecked.

**Prerequisites.**

- `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/so21-quotient-standard-module`

**Source locators.**

- **MorrisRatner**, §1.2, proof of Margulis' theorem, printed pp.14–15 (arXiv:math/0310402): Uses that a connected subgroup containing H = SO(2,1)° is H or SL(3, ℝ), as part of the proof via Ratner's orbit closure theorem.

<a id="closed-orbit-rational-form"></a>
#### Closed SO(Q) orbits come from rational forms

`GN.4/closed-orbit-rational-form` · lemma

Let Q = λQ₀∘g with g ∈ SL_3(ℝ), λ ≠ 0, and H = SO(Q₀)°. If the orbit H·gΓ_3 ⊆ X_3 (the lattices hgℤ³, h ∈ H) is closed and carries a finite H-invariant measure, then Q is a scalar multiple of a form with integer coefficients.

**Hypotheses.**

- Q indefinite nondegenerate ternary; the closed orbit is the alternative left by Ratner's orbit closure theorem with S = H.

**Proof plan.**

1. Closed finite-volume orbit ⇒ Γ_H = g⁻¹Hg ∩ SL_3(ℤ) is a lattice in g⁻¹Hg = SO(Q)° (Morris §1.1 exercises 22, 24).
2. Borel density (borel-density): the Zariski closure of Γ_H contains all unipotents of SO(Q)°, which generate it, so SO(Q)° lies in the Zariski closure of a set of integer matrices; that closure is defined over ℚ.
3. The space of quadratic forms invariant under SO(Q) is the line ℝQ; it is cut out by linear equations with rational coefficients (invariance under the rational generators), so it contains a nonzero rational form.

**Acceptance checks.**

- Q = x² + y² − 3z²: the orbit of SO(Q)° is closed (Q rational).

**Intended library:** `TauCeti/GeometryOfNumbers/Oppenheim`; namespace `TauCeti.GeometryOfNumbersPlan`; target `exists_rational_of_isClosed_orbit`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/borel-density`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/space-of-unimodular-lattices`
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`

**Source locators.**

- **MorrisRatner**, §1.2, proof of Margulis' theorem, printed pp.14–15: Shows that if the orbit closure is the H-orbit itself then the orbit is closed with finite volume, H ∩ gΓg⁻¹ is a lattice, and Borel density forces Q to be a multiple of an integral form.

<a id="oppenheim-ternary-reduction"></a>
#### Reduction of Oppenheim's theorem to three variables

`GN.4/oppenheim-ternary-reduction` · lemma

Let n ≥ 4 and Q a real nondegenerate indefinite quadratic form in n variables that is not a scalar multiple of a rational form. Then there is a rational 3-dimensional subspace W ⊆ ℚⁿ (with W ⊗ ℝ spanned by integer vectors) such that Q|_{W⊗ℝ} is nondegenerate, indefinite and not a scalar multiple of a rational form; restricting to W ∩ ℤⁿ ≅ ℤ³ gives Q(ℤⁿ) ⊇ Q|_W(ℤ³).

**Hypotheses.**

- The subspace is rational, so W ∩ ℤⁿ is a lattice of rank 3.
- Irrationality is not treated as an open condition; the proof retains an irrational ratio on two fixed integer vectors.

**Proof plan.**

1. Integer vectors exist in both open sign cones by rational density. Suppose every pair of integer vectors v,w with Q(v)>0>Q(w) has Q(v)/Q(w) rational. Fix one such v₀,w₀. For any integer u, Q(u+mv₀)>0 for all sufficiently large integers m. Three consecutive such m give Q(u+mv₀)/Q(w₀) rational; quadratic interpolation at these integer arguments implies Q(u)/Q(w₀) rational. Evaluating at e_i and e_i+e_j then makes every coefficient of Q/Q(w₀) rational, a contradiction.
2. Choose integer v₁,v₂ with opposite signs and irrational Q(v₁)/Q(v₂). Their span is a nondegenerate indefinite plane: its Gram determinant is Q(v₁)Q(v₂)−B(v₁,v₂)²<0. Its orthogonal complement is nondegenerate. Choose a real v₃ whose orthogonal component has nonzero Q-value; nonvanishing of the three-dimensional Gram determinant is open, so rational density and denominator clearing give an integer v₃ with the same property.
3. The resulting rational ternary subspace is nondegenerate and indefinite. If its restriction were proportional to a rational form, the ratio Q(v₁)/Q(v₂) would be rational. Its integral intersection has rank three; the chosen independent integer vectors suffice for the asserted inclusion of value sets, even without choosing a saturated basis.

**Acceptance checks.**

- n = 4, Q = x₁² + x₂² − √2x₃² + x₄²: W = span(e₁, e₂, e₃) works.

**Intended library:** `TauCeti/GeometryOfNumbers/Oppenheim`; namespace `TauCeti.GeometryOfNumbersPlan`; target `exists_rational_ternary_restriction`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:QuadraticMap`
- `mathlib:QuadraticMap.Anisotropic`

**Source locators.**

- **MorrisRatner**, §1.2, proof printed p.14; Exercise 1.2#15 and its hint, printed p.18: Asks for integer v₁,v₂ with negative irrational value ratio and a generic third vector. The proof above supplies the rational-ratio contradiction and nondegenerate extension explicitly.

### 4.16 Siegel's mean value theorem

<a id="siegel-transform"></a>
#### The Siegel transform

`GN.4/siegel-transform` · definition

For n ≥ 2 and f : ℝⁿ → [0, ∞] measurable (or f : ℝⁿ → ℂ with Σ|f| finite on every lattice), the Siegel transform of f is the function on X_n given by S f(x) = Σ_{v ∈ toLattice(x) ∖ {0}} f(v), and the primitive Siegel transform is S*f(x) = Σ_{v primitive in toLattice(x)} f(v), where v is primitive in L if v ∉ mL for every integer m ≥ 2. For nonnegative f, S f = Σ_{m≥1} S*(f∘(m·)).

**Planet:** Siegel transform.

**Hypotheses.**

- The origin is excluded; for f ≥ 0 the transforms take values in [0, ∞].
- Primitivity is in the lattice toLattice(x), not in ℤⁿ.

**Uses.**

- siegel-mean-value (base packet): the integral of S f over X_n
- Kleinbock–Margulis, logarithm laws; Eskin–Margulis–Mozes (Morris §1.4A): counting via averages of S f over orbits
- Browning–Le Boudec–Sawin §4.5: primitive point counts as primitive transforms of indicator functions

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.siegelTransform` (constructor): siegelTransform f x = ∑' v : toLattice x, if v = 0 then 0 else f v (in ℝ≥0∞ for f ≥ 0).
- `TauCeti.GeometryOfNumbersPlan.primitiveSiegelTransform` (constructor): primitiveSiegelTransform f x = ∑' over primitive v of f v.
- `TauCeti.GeometryOfNumbersPlan.siegelTransform_eq_tsum_primitive` (relation): siegelTransform f = ∑' m : ℕ+, primitiveSiegelTransform (f ∘ (m • ·)).
- `TauCeti.GeometryOfNumbersPlan.siegelTransform_smul` (functoriality): siegelTransform f (h • x) = siegelTransform (f ∘ h) x for h ∈ SL_n(ℝ).
- `TauCeti.GeometryOfNumbersPlan.measurable_siegelTransform` (structure): f measurable → siegelTransform f measurable on X_n.
- `TauCeti.GeometryOfNumbersPlan.siegelTransform_mono` (structure): f ≤ f' → siegelTransform f ≤ siegelTransform f'.
- `TauCeti.GeometryOfNumbersPlan.siegelTransform_indicator_ball` (simp): siegelTransform (indicator (closedBall 0 T) 1) x = #(toLattice x ∩ closedBall 0 T) − 1.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.siegelTransform_base_ball` (computation): For n = 2, siegelTransform 1_{closedBall 0 1} base = 4 (the vectors ±e₁, ±e₂).
- `TauCeti.GeometryOfNumbersPlan.primitiveSiegelTransform_base_ball2` (computation): For n = 2, the primitive transform of 1_{closedBall 0 2} at base is 8 while the full transform is 12.
- `TauCeti.GeometryOfNumbersPlan.siegelTransform_zero` (degenerate): siegelTransform 0 = 0.
- `TauCeti.GeometryOfNumbersPlan.siegelTransform_excludes_origin` (non-example): For f = 1_{\{0\}}, siegelTransform f = 0: the origin is never counted, so the formula ∫S f = ∫f is not contradicted by point masses.

**Proof plan.**

1. Well defined on X_n since it depends only on the lattice gℤⁿ.
2. Every nonzero lattice vector is uniquely m·w with m ≥ 1 and w primitive, giving S f = Σ_m S*(f(m·)).

**Acceptance checks.**

- S 1_{B̄(T)} counts the nonzero lattice points in the ball of radius T.
- For f compactly supported away from 0 and x in a compact set, S f(x) is a finite sum.

**Intended library:** `TauCeti/GeometryOfNumbers/SiegelTransform`; namespace `TauCeti.GeometryOfNumbersPlan`; target `siegelTransform`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/space-of-unimodular-lattices`
- `mathlib:ENNReal.tsum_eq_iSup_sum`
- `mathlib:Measurable.ennreal_tsum`

**Source locators.**

- **Miller2020**, §4, (1), p.10, and the primitive reformulation, pp.11–12: Defines E f(g) as the sum of f over the nonzero vectors of the lattice of g, and the equivalent statement with primitive vectors.
- **EskinLuminy**, §1, pp.3–4: Uses f̂(Δ) = Σ_{v∈Δ∖0} f(v) and its primitive version.

<a id="primitive-siegel-unfolding"></a>
#### Unfolding the primitive Siegel transform

`GN.4/primitive-siegel-unfolding` · lemma

Let n ≥ 2, G = SL_n(ℝ), Γ = SL_n(ℤ), P ⊆ G the stabiliser of e_n (the mirabolic subgroup) and m_G a Haar measure. For f : ℝⁿ → [0, ∞] measurable: ∫_{G/Γ} S*f dm_{G/Γ} = c·∫_{ℝⁿ} f(x) dx, where c = m_{P/(P∩Γ)}(P/(P∩Γ)) for the compatible Haar measures on P and on G/P ≅ ℝⁿ ∖ {0} (normalised to Lebesgue measure); in particular c < ∞ and does not depend on f.

**Hypotheses.**

- Tonelli for nonnegative f: no integrability hypothesis.
- The constant c is finite because P ∩ Γ ≅ SL_{n−1}(ℤ) ⋉ ℤ^{n−1} is a lattice in P ≅ SL_{n−1}(ℝ) ⋉ ℝ^{n−1}.

**Proof plan.**

1. Γ acts transitively on primitive vectors of ℤⁿ with stabiliser of e_n equal to P ∩ Γ, so S*f(gΓ) = Σ_{γ ∈ Γ/(P∩Γ)} f(gγe_n).
2. Unfold: ∫_{G/Γ} Σ_{γ∈Γ/(Γ∩P)} F(gγ) = ∫_{G/(Γ∩P)} F with F(g) = f(ge_n), then integrate over P/(Γ∩P) fibrewise: ∫_{G/P} f(ge_n)·m(P/(Γ∩P)).
3. G/P ≅ ℝⁿ ∖ {0} via g ↦ ge_n, and the G-invariant measure on it is a multiple of Lebesgue measure (invariant-measures-punctured-space); absorb the multiple into c.

**Acceptance checks.**

- n = 2: the stabiliser of e₂ in SL₂(ℤ) is {[[1, 0],[k, 1]] : k ∈ ℤ} and P = {[[1, 0],[t, 1]] : t ∈ ℝ}, so P/(P ∩ Γ) is a circle.

**Intended library:** `TauCeti/GeometryOfNumbers/SiegelTransform`; namespace `TauCeti.GeometryOfNumbersPlan`; target `lintegral_primitiveSiegelTransform_eq_mul`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/siegel-transform`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/invariant-measures-punctured-space`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/lattice-space-invariant-probability`
- `mathlib:QuotientGroup.integral_eq_integral_automorphize`
- `mathlib:MeasureTheory.lintegral_tsum`
- `AdelicAlgebraicGroups:AA.2`
- `AdelicAlgebraicGroups:AA.3`

**Source locators.**

- **Miller2020**, §6 'Lie theoretic formulation of Siegel's integration formula', pp.12–13 (with footnote 4 on the mirabolic subgroup): Rewrites the primitive sum as a sum over Γ/(Γ∩P), unfolds the integral to (Γ∩P)\G and fibres over P\G ≅ ℝⁿ ∖ {0}, so the average is a constant multiple of the Lebesgue integral; the row convention is used there.

<a id="invariant-measures-punctured-space"></a>
#### Invariant measures on the punctured space

`GN.4/invariant-measures-punctured-space` · lemma

For n ≥ 2, every SL_n(ℝ)-invariant Radon measure on ℝⁿ ∖ {0} is a nonnegative multiple of Lebesgue measure.

**Hypotheses.**

- n ≥ 2 makes the action transitive; for n = 1 the group is trivial.

**Proof plan.**

1. SL_n(ℝ) acts transitively on ℝⁿ ∖ {0} with stabiliser P (the mirabolic subgroup), so ℝⁿ ∖ {0} ≅ G/P; Lebesgue measure is G-invariant since det = 1.
2. An invariant Radon measure on a homogeneous space G/P, when one exists, is unique up to a scalar (it lifts to a Haar measure of G through the quotient integral formula); so every invariant measure is c·Lebesgue.

**Acceptance checks.**

- The Dirac mass at e_1 is not invariant; Lebesgue measure restricted to the punctured space is.

**Intended library:** `TauCeti/GeometryOfNumbers/SiegelTransform`; namespace `TauCeti.GeometryOfNumbersPlan`; target `eq_smul_volume_of_slInvariant`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:MeasureTheory.Measure.haar`
- `mathlib:MeasureTheory.Measure.isMulLeftInvariant_eq_smul`
- `mathlib:MeasureTheory.Measure.addHaar_image_linearMap`

**Source locators.**

- **Miller2020**, §4, Remark 2, p.11, and §6, p.13: Siegel's argument: the averaged functional is invariant, hence a multiple of Lebesgue measure on G/P ≅ ℝⁿ ∖ {0}.

<a id="primitive-siegel-mean-value"></a>
#### Siegel's mean value theorem, primitive form

`GN.4/primitive-siegel-mean-value` · theorem

For n ≥ 2 and f : ℝⁿ → [0, ∞] measurable, ∫_{X_n} S*f dμ_n = (1/ζ(n))·∫_{ℝⁿ} f(x) dx, and ∫_{X_n} S f dμ_n = ∫_{ℝⁿ} f(x) dx. For f ∈ L¹(ℝⁿ), S f is μ_n-integrable and the same identities hold.

**Hypotheses.**

- μ_n is the invariant probability; the identities hold in [0, ∞] for f ≥ 0 and integrability of S f is a consequence, not a hypothesis.

**Proof plan.**

1. primitive-siegel-unfolding gives ∫S*f dμ_n = c'·∫f for a constant c' ∈ [0, ∞) independent of f.
2. S f = Σ_m S*(f(m·)) and ∫f(mx)dx = m^{−n}∫f give ∫S f dμ_n = c'ζ(n)∫f.
3. Determine c'ζ(n) = 1: for f_T = 1_{B̄(T)}/vol B̄(T), S f_T(x) → 1 as T → ∞ for every x (the lattice toLattice x has covolume 1). Domination: by ball-count-successive-minima S f_T ≤ C·Σ_{j<n} T^{j−n}/(λ_1⋯λ_j) + C for T ≥ 1, and since λ_1⋯λ_n ≍ 1 each 1/(λ_1⋯λ_j) is at most C'·#(toLattice x ∩ B̄(1)) (the vectors realising the minima ≤ 1 generate that many points), which is μ_n-integrable by the first step. Dominated convergence gives c'ζ(n)·1 = 1.
4. Positive and negative parts give the L¹ statement.

**Acceptance checks.**

- n = 2, f = 1_{B̄(T)}: the average number of nonzero lattice points of a random unimodular lattice in a disc of radius T is exactly πT², and of primitive ones πT²/ζ(2) = 6T²/π.

**Intended library:** `TauCeti/GeometryOfNumbers/SiegelTransform`; namespace `TauCeti.GeometryOfNumbersPlan`; target `lintegral_primitiveSiegelTransform_eq`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/primitive-siegel-unfolding`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/siegel-transform`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/lattice-space-invariant-probability`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ball-count-successive-minima`
- `mathlib:riemannZeta`
- `mathlib:MeasureTheory.lintegral_tsum`

**Source locators.**

- **Miller2020**, §4, formula (2) and Remark 2, pp.10–11; §6, pp.12–13: Siegel's integration formula: the mean of E f over the space of unimodular lattices equals ∫f; the constant is fixed by a limiting argument or by the Eisenstein-series proof of §15.
- **EskinLuminy**, §1, p.4: States that the proof of Siegel's formula shows the average of the primitive sum is (1/ζ(n))∫f.

### 4.17 Arithmetic packets for equidistribution

<a id="cm-point-packet"></a>
#### The packet of CM points of a negative discriminant

`GN.4/cm-point-packet` · construction

Let D < 0 be a discriminant (D ≡ 0, 1 mod 4). For a positive definite integral binary form Q = [a, b, c] (a > 0) of discriminant b² − 4ac = D let z_Q = (−b + i√|D|)/(2a) ∈ ℍ, its CM point. z_{Q∘γ} = γ⁻¹·z_Q for γ ∈ SL₂(ℤ), so the classes of primitive forms of discriminant D give a finite set Λ_D of points of the modular curve SL₂(ℤ)\ℍ, of cardinality h(D), the number of proper classes; each point carries the weight 1/ω_Q, ω_Q the order of the stabiliser of z_Q in PSL₂(ℤ) (ω = 3, 2, 1 for D = −3, −4, D < −4). The normalised counting measure of the packet is ν_D = (Σ_Q 1/ω_Q)^{−1}Σ_Q ω_Q^{−1}δ_{z_Q}.

**Hypotheses.**

- Primitive forms (gcd(a, b, c) = 1); for fundamental D every form of discriminant D is primitive.
- Reduced representatives (|b| ≤ a ≤ c) give the points of Λ_D in the standard fundamental domain.

**Uses.**

- Duke 1988, Theorem 1(i), p.75: equidistribution of Λ_D as D → −∞ through fundamental discriminants
- Duke–Imamoḡlu–Tóth 2016, (4.5), p.961: genus version of the CM equidistribution
- GeometryOfNumbersPartIIToralJoinings (proposed): joint equidistribution of CM points (Khayutin)

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.cmPoint` (constructor): cmPoint Q : ℍ = (−b + i√|D|)/(2a) for Q positive definite.
- `TauCeti.GeometryOfNumbersPlan.cmPoint_smul` (functoriality): cmPoint (Q ∘ γ) = γ⁻¹ • cmPoint Q for γ ∈ SL(2, ℤ).
- `TauCeti.GeometryOfNumbersPlan.cmPointPacket` (constructor): cmPointPacket D : Finset (SL(2,ℤ)-orbits in ℍ), the images of cmPoint over primitive forms of discriminant D.
- `TauCeti.GeometryOfNumbersPlan.card_cmPointPacket` (characterisation): (cmPointPacket D).card = the number of proper classes of primitive positive definite forms of discriminant D.
- `TauCeti.GeometryOfNumbersPlan.cmWeight` (data): cmWeight Q = 1 / #(stabiliser of cmPoint Q in PSL(2,ℤ)).
- `TauCeti.GeometryOfNumbersPlan.cmMeasure` (data): The normalised weighted counting measure ν_D on SL(2,ℤ)\ℍ.
- `TauCeti.GeometryOfNumbersPlan.cmMeasure_isProbability` (instance): ν_D is a probability measure for a negative discriminant D ≡ 0 or 1 mod 4, using the nonempty finite class set from IntegralLattices.

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.cmPoint_minus_four` (computation): For Q = [1, 0, 1], cmPoint Q = i and its PSL(2,ℤ)-stabiliser has order 2.
- `TauCeti.GeometryOfNumbersPlan.cmPoint_minus_three` (computation): For Q = [1, 1, 1], cmPoint Q = (−1 + i√3)/2 with stabiliser of order 3.
- `TauCeti.GeometryOfNumbersPlan.card_cmPointPacket_minus_twenty` (computation): card (cmPointPacket (−20)) = 2, from the reduced forms [1, 0, 5] and [2, 2, 3] with CM points i√5 and (−1 + i√5)/2.
- `TauCeti.GeometryOfNumbersPlan.cmPointPacket_not_imprimitive` (non-example): The imprimitive form [2, 0, 2] of discriminant −16 is excluded: Λ_{−16} = {2i} from [1, 0, 4] only, although z_{[2,0,2]} = i.

**Proof plan.**

1. z_Q is the root in ℍ of Q(z, 1) = 0; the transformation law follows from Q(γ(x, y)) and the action of γ on the root.
2. Proper equivalence classes of forms correspond to SL₂(ℤ)-orbits of CM points of discriminant D; there are h(D) of them (finiteness of the form class number, TauCetiRoadmap IntegralLattices binary forms).
3. The stabiliser of z_Q in PSL₂(ℤ) is the image of the automorph group of Q, of order 3, 2 or 1.

**Acceptance checks.**

- D = −4: Λ_D = {i} with ω = 2.
- D = −3: Λ_D = {e^{2πi/3}} with ω = 3.
- D = −20: h = 2; the reduced forms [1, 0, 5] and [2, 2, 3] give i√5 and (−1 + i√5)/2.

**Intended library:** `TauCeti/GeometryOfNumbers/DukeCarriers`; namespace `TauCeti.GeometryOfNumbersPlan`; target `cmPointPacket`. Implementation status: unchecked.

**Prerequisites.**

- `mathlib:UpperHalfPlane`
- `mathlib:ModularGroup.fd`
- `mathlib:UpperHalfPlane.SLAction`

**Source locators.**

- **DIT2016**, §4, pp.960–961, (4.5), and §5, line after (5.12), p.963 (Ann. of Math. 184 (2016)): Associates to each ideal class of a negative fundamental discriminant a CM point z_A ∈ F and weights 1/ω_D with ω_D = 3, 2, 1 for D = −3, −4, D < −4.
- **Duke1988**, §1, p.75 (Invent. Math. 92 (1988)): Defines the h(d) Heegner points z_Q = (−b + √d)/(2a) of a negative discriminant in the fundamental region.

<a id="oriented-closed-geodesic"></a>
#### The oriented closed geodesic of an indefinite form

`GN.4/oriented-closed-geodesic` · construction

Let D > 0 be a nonsquare discriminant and Q = [a, b, c] a primitive integral form of discriminant D. Its roots w = (−b + √D)/(2a) and w' = (−b − √D)/(2a) are the endpoints of the hyperbolic geodesic S_Q = {z ∈ ℍ : a|z|² + b Re z + c = 0}. Let γ_Q ∈ SL₂(ℤ) be the generator of the automorph group of Q with attracting fixed point w (pell-automorph). The oriented closed geodesic C_Q is the image in SL₂(ℤ)\ℍ of the arc of S_Q from z to γ_Qz, oriented from w' towards w; for a continuous SL₂(ℤ)-invariant function f, ∫_{C_Q} f ds is the integral along that arc (hyperbolic arclength), and for an invariant 1-form ω, ∫_{C_Q} ω the integral along the oriented arc. Both are independent of z ∈ S_Q and depend only on the proper class of Q; C_{nQ} = C_Q for n ∈ ℤ_{>0}.

**Hypotheses.**

- Nonsquare D, so the roots are irrational and γ_Q is hyperbolic.
- Orientation from w' to w, i.e. clockwise on S_Q when a > 0.

**Uses.**

- Duke 1988, Theorem 1(ii), p.75: equidistribution of the closed geodesics of discriminant d as d → ∞
- Duke–Imamoḡlu–Tóth 2016, (4.4) and §5, (5.12): genus Weyl sums Σχ(A)∫_{C_A}u ds
- FuchsianOrbifoldsPartII (proposed): C_A is the boundary of the Nielsen core F_A

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.geodesicOfForm` (constructor): geodesicOfForm Q = {z : ℍ | a * normSq z + b * re z + c = 0}.
- `TauCeti.GeometryOfNumbersPlan.closedGeodesicIntegral` (constructor): closedGeodesicIntegral Q f = ∫ over the arc of geodesicOfForm Q from z to γ_Q • z of f ds.
- `TauCeti.GeometryOfNumbersPlan.closedGeodesicIntegral_indep` (characterisation): The integral does not depend on the base point z ∈ geodesicOfForm Q, for f SL(2,ℤ)-invariant.
- `TauCeti.GeometryOfNumbersPlan.closedGeodesicIntegral_smul` (functoriality): closedGeodesicIntegral (Q ∘ γ) f = closedGeodesicIntegral Q f.
- `TauCeti.GeometryOfNumbersPlan.closedGeodesicIntegral_nsmul` (simp): closedGeodesicIntegral (n • Q) f = closedGeodesicIntegral Q f for n > 0.
- `TauCeti.GeometryOfNumbersPlan.closedGeodesicIntegral_one` (simp): closedGeodesicIntegral Q 1 = length of C_Q (closed-geodesic-length).
- `TauCeti.GeometryOfNumbersPlan.mem_geodesicOfForm_roots` (characterisation): The endpoints of geodesicOfForm Q on ℝ ∪ {∞} are the two real roots of Q(x, 1).

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.geodesicOfForm_sqrt2` (computation): geodesicOfForm [1, 0, −2] = {z : |z| = √2}.
- `TauCeti.GeometryOfNumbersPlan.closedGeodesicIntegral_one_D8` (computation): For Q = [1, 0, −2], closedGeodesicIntegral Q 1 = 2 log(3 + 2√2).
- `TauCeti.GeometryOfNumbersPlan.closedGeodesicIntegral_zero` (degenerate): closedGeodesicIntegral Q 0 = 0.
- `TauCeti.GeometryOfNumbersPlan.geodesic_square_disc_excluded` (non-example): For D = 4 (a square) the form [1, 2, 0] = x(x + 2y) has rational roots, its automorph group is finite and there is no closed geodesic.

**Proof plan.**

1. γ_Q fixes w and w' and preserves S_Q; it acts on S_Q as a translation towards its attracting fixed point w.
2. Changing z along S_Q changes the arc by a fundamental-domain shift of γ_Q, leaving integrals of invariant integrands unchanged; replacing Q by Q∘γ moves S_Q by γ⁻¹ and conjugates γ_Q.

**Acceptance checks.**

- Q = [1, 0, −2] (D = 8): S_Q is the semicircle |z| = √2 and γ_Q = ±[[3, 4],[2, 3]] (t = 6, u = 2 with t² − 8u² = 4).

**Intended library:** `TauCeti/GeometryOfNumbers/DukeCarriers`; namespace `TauCeti.GeometryOfNumbersPlan`; target `orientedClosedGeodesic`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/pell-automorph`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/reduced-cycle-class-invariant`
- `mathlib:UpperHalfPlane`
- `mathlib:UpperHalfPlane.dist_eq`

**Source locators.**

- **DIT2016**, §2, (2.9) and the paragraph after it, pp.953–954 (read); §7 after Lemma 1, p.972, and §9, p.978 with footnote 8, as recorded in the reviewed extraction: Defines S_w, γ_w with attracting fixed point w and the clockwise orientation, the closed geodesic C_A as the reduction of the arc from z_0 to γ_w(z_0), integrals over C_A independent of z_0, and C_Q for forms of arbitrary nonsquare discriminant with C_{nQ} = C_Q.
- **Duke1988**, §1, p.75: Associates to a form of positive discriminant the primitive positively oriented closed geodesic through the roots.

<a id="closed-geodesic-length"></a>
#### The length of a closed geodesic

`GN.4/closed-geodesic-length` · theorem

Let D > 0 be a nonsquare discriminant, Q primitive of discriminant D and (t, u) the solution of t² − Du² = 4 with t, u ≥ 1 minimal. Then the hyperbolic length of C_Q (the arc from z to γ_Qz) is 2 log ε_D with ε_D = (t + u√D)/2, independent of Q. The length is the translation length of the parametrised cycle; it is not halved when C_Q retraces itself (reciprocal classes).

**Hypotheses.**

- Lengths are for the parametrised arc, counted with multiplicity.

**Proof plan.**

1. γ_Q = ±[[(t − bu)/2, −cu], [au, (t + bu)/2]] has trace t (pell-automorph).
2. A hyperbolic element of trace t > 2 translates its axis by 2 arccosh(t/2) = 2 log((t + √(t² − 4))/2) = 2 log ε_D.

**Acceptance checks.**

- D = 5: t = 3, u = 1, ε = (3 + √5)/2 and length 2 log((3 + √5)/2) = 4 log((1 + √5)/2).
- D = 8: ε = 3 + 2√2.

**Intended library:** `TauCeti/GeometryOfNumbers/DukeCarriers`; namespace `TauCeti.GeometryOfNumbersPlan`; target `length_closedGeodesic_eq`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/oriented-closed-geodesic`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/pell-automorph`
- `mathlib:UpperHalfPlane.dist_eq`
- `mathlib:Real.arcosh`

**Source locators.**

- **DIT2016**, (2.10) and (2.11), p.954: length(C_A) = 2 log ε_D, with γ_Q the automorph built from the minimal solution of t² − d₀u² = 4 and ε_D = (t + u√D)/2.
- **Duke1988**, §1, p.75: Records the length log ε_d or 2 log ε_d according as Q is or is not equivalent to −Q, for the set image of the primitive geodesic; the parametrised cycle of this node always has length 2 log ε_d.

<a id="geodesic-orientation-reversal"></a>
#### Reversing the orientation of a closed geodesic

`GN.4/geodesic-orientation-reversal` · theorem

For Q = [a, b, c] primitive of nonsquare discriminant D > 0, the geodesic of −Q = [−a, −b, −c] is S_Q traversed in the opposite direction: C_{−Q} has the same image as C_Q, ∫_{C_{−Q}} f ds = ∫_{C_Q} f ds for invariant functions and ∫_{C_{−Q}} ω = −∫_{C_Q} ω for invariant 1-forms. The reflected form [a, −b, c] has geodesic −S̄_Q (the mirror image in the imaginary axis).

**Hypotheses.**

- The statement is about forms; the narrow-class translation (−Q represents JA⁻¹ when Q represents A) belongs to the class-group dictionary (IntegralLattices binary forms, MultiquadraticPartII).

**Proof plan.**

1. −Q has the same zero set, so S_{−Q} = S_Q; its attracting fixed point is w' since γ_{−Q} = γ_Q⁻¹ (the formula of pell-automorph with (a, b, c) ↦ (−a, −b, −c)).
2. Reflection z ↦ −z̄ maps the zero set of [a, b, c] to that of [a, −b, c].

**Acceptance checks.**

- Q = [1, 0, −2]: C_{−Q} runs along |z| = √2 counterclockwise.

**Intended library:** `TauCeti/GeometryOfNumbers/DukeCarriers`; namespace `TauCeti.GeometryOfNumbersPlan`; target `closedGeodesic_neg`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/oriented-closed-geodesic`
- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/pell-automorph`

**Source locators.**

- **DIT2016**, §2, p.954, the sentence after (2.11) using (2.5), and (2.3), p.952: The closed geodesic of JA⁻¹ (represented by −Q) has the same image as C_A with opposite orientation; [a, −b, c] represents A⁻¹.

<a id="harmonic-weyl-sum"></a>
#### Weyl sums of spherical harmonics over lattice points on spheres

`GN.4/harmonic-weyl-sum` · definition

For n ≥ 1 let R_n = {m ∈ ℤ³ : |m|² = n} and r₃(n) = #R_n. For a harmonic polynomial u on ℝ³, homogeneous of degree ℓ, and n with r₃(n) > 0, the Weyl sum is W_u(n) = r₃(n)^{−1}Σ_{m∈R_n} u(m/√n). The theta series with harmonic coefficients is θ(z; u) = Σ_{m∈ℤ³} u(m)e^{2πiz|m|²}, z ∈ ℍ, whose n-th coefficient is a(n) = Σ_{m∈R_n}u(m) = n^{ℓ/2}r₃(n)W_u(n).

**Hypotheses.**

- u harmonic (Δu = 0) and homogeneous; ℓ = 0 gives W_1(n) = 1.
- In Lean harmonicWeylSum is totalised to 0 on an empty sphere; statements about counting probability measures assume n>0 and r₃(n)>0.

**Uses.**

- Duke 1988, §1, p.74: the spherical equidistribution reduces to W_u(n) → 0 for every harmonic u of degree ≥ 1
- duke-spherical-equidistribution (base packet): the Weyl-criterion route to the theorem

**Planning API.**

- `TauCeti.GeometryOfNumbersPlan.latticeSphere` (constructor): latticeSphere n = {m : Fin 3 → ℤ | Σ m_i² = n} as a Finset.
- `TauCeti.GeometryOfNumbersPlan.harmonicWeylSum` (constructor): harmonicWeylSum u n = (latticeSphere n).card⁻¹ * Σ m ∈ latticeSphere n, u (m / √n).
- `TauCeti.GeometryOfNumbersPlan.harmonicWeylSum_one` (simp): harmonicWeylSum 1 n = 1 when latticeSphere n is nonempty.
- `TauCeti.GeometryOfNumbersPlan.harmonicWeylSum_odd` (relation): If u is odd (ℓ odd) then harmonicWeylSum u n = 0.
- `TauCeti.GeometryOfNumbersPlan.thetaHarmonic` (constructor): thetaHarmonic u z = Σ m : ℤ³, u m * exp (2πi z |m|²).
- `TauCeti.GeometryOfNumbersPlan.thetaHarmonic_coeff` (characterisation): For n>0 and u homogeneous of degree ℓ, the n-th Fourier coefficient of thetaHarmonic u is n^{ℓ/2} * r₃(n) * harmonicWeylSum u n (also 0 when r₃(n)=0).

**Unit tests.**

- `TauCeti.GeometryOfNumbersPlan.latticeSphere_card_three` (computation): (latticeSphere 3).card = 8 (all (±1, ±1, ±1)).
- `TauCeti.GeometryOfNumbersPlan.harmonicWeylSum_xy_three` (computation): For u = xy, harmonicWeylSum u 3 = 0.
- `TauCeti.GeometryOfNumbersPlan.latticeSphere_seven_empty` (degenerate): latticeSphere 7 = ∅. The Lean totalised harmonicWeylSum is 0 there; it represents a probability average only for nonempty spheres.
- `TauCeti.GeometryOfNumbersPlan.nonharmonic_not_mean_zero` (non-example): For n>0 with latticeSphere n nonempty, the average of x² is 1/3 by coordinate symmetry and Σx_i²=1. Both hypotheses are necessary (n=0 and n=7 are boundary tests).

**Proof plan.**

1. W_u(n) is the integral of u against the normalised counting measure of R_n/√n ⊆ S².
2. Homogeneity gives u(m) = n^{ℓ/2}u(m/√n) for m ∈ R_n, hence the coefficient identity.
3. θ(z; u) converges absolutely on ℍ (polynomial growth against Gaussian decay); its modularity of weight 3/2 + ℓ on Γ₀(4) is the theta input recorded in the base packet's tier-move gap (MetaplecticAutomorphicForms MP.7).

**Acceptance checks.**

- u = x: W_u(n) = 0 for every n by the symmetry m ↦ −m.
- u = x² − y²: W_u(n) = 0 by the symmetry swapping coordinates.

**Intended library:** `TauCeti/GeometryOfNumbers/DukeCarriers`; namespace `TauCeti.GeometryOfNumbersPlan`; target `harmonicWeylSum`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.3/definite-lattice-theta-series`
- `mathlib:MvPolynomial`

**Source locators.**

- **Duke1988**, §1, p.74: Defines V_n = {m/|m| : |m|² = n}, the Weyl sums W_u(n) and the theta function θ(z; u) with coefficients a(n) = n^{ℓ/2}r₃(n)W_u(n).

<a id="spherical-weyl-criterion"></a>
#### Weyl's criterion on the sphere

`GN.4/spherical-weyl-criterion` · lemma

Let σ be the normalised rotation-invariant measure on S² and (V_k) a sequence of nonempty finite multisets in S² with counting probability measures ν_k. Then ν_k → σ weakly iff for every ℓ ≥ 1 and every harmonic polynomial u homogeneous of degree ℓ, ν_k(u) → 0.

**Hypotheses.**

- Weak convergence against continuous functions on S².

**Proof plan.**

1. Restrictions to S² of harmonic homogeneous polynomials of degrees 0..L span the restrictions of all polynomials of degree ≤ L (harmonic decomposition p = h_L + |x|²p'), so their span is a subalgebra-generated dense subspace of C(S²) by Stone–Weierstrass.
2. For ℓ ≥ 1, σ(u) = 0 (u is orthogonal to constants; equivalently the mean value property at 0 for harmonic u).
3. Hence ν_k(f) → σ(f) for f in a dense subspace, and uniform boundedness of the ν_k extends this to C(S²).

**Acceptance checks.**

- For n = 3·4^j the set R_n/√n consists of the 8 points (±1, ±1, ±1)/√3, and for the harmonic u = Σx_i⁴ − 3Σ_{i<j}x_i²x_j² one gets W_u(n) = −2/3 for every j: these n are not square-free and are excluded from Duke's theorem.

**Intended library:** `TauCeti/GeometryOfNumbers/DukeCarriers`; namespace `TauCeti.GeometryOfNumbersPlan`; target `tendsto_of_harmonicWeylSum_tendsto_zero`. Implementation status: unchecked.

**Prerequisites.**

- `GeometryOfNumbersAndQuadraticArithmetic:GN.4/harmonic-weyl-sum`
- `mathlib:ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`
- `mathlib:MeasureTheory.tendsto_of_forall_isOpen_le_liminf`

**Source locators.**

- **Duke1988**, §1, p.74: Deduces the uniform distribution of V_n on S² from the bound on W_u(n) 'by the analogue of Weyl's criterion'.

## Dependencies and owner contracts

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 78 cited declarations were checked at these commits; their exact names and roles are listed below. The current read-only upstream roadmap and library were also checked to prevent duplication. A post-pin declaration is never substituted for a pinned declaration.

- **Supplier `AdelicAlgebraicGroups:AA.2`.** Haar measure on SL_n(ℝ) for the real points of SL_n over ℚ, its unimodularity, and the quotient measure on SL_n(ℝ)/SL_n(ℤ) with the quotient integral formula. Used by: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/lattice-space-invariant-probability`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/primitive-siegel-unfolding`.
- **Supplier `AdelicAlgebraicGroups:AA.3`.** SL_n(ℤ) is a lattice in SL_n(ℝ) (the S-arithmetic lattice theorem with S = {∞}, or real reduction by Siegel sets of finite Haar measure), and the analogous statement for the mirabolic P ∩ SL_n(ℤ) in P. Used by: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/space-of-unimodular-lattices`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/lattice-space-invariant-probability`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/primitive-siegel-unfolding`.
- **Supplier `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-3-geometry-of-numbers-and-ray-class-ideal-counting`.** IsLipschitzParametrizable (milestone 3A): finitely many Lipschitz maps from [0,1]^d cover the set, with its closure properties; the fixed-lattice count with error O(c^{n−1}). Used by: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/widmer-lipschitz-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/hyperplane-orthant-count`.
- **Supplier `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-2-the-closed-subgroup-cartan-theorem`.** Closed/connected Lie-subgroup and Lie-algebra correspondence in SL_n(ℝ), plus the adjoint action and the following finite-dimensional real Lie-group adapters used in mixing: a connected finite-centre simple group has proper adjoint map onto its closed adjoint group; real Jordan form of exp(t·ad X) distinguishes compact closure from proper escape. This request does not assert matrix-coefficient decay, Chevalley stabilizers, or irreducibility. Used by: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/homogeneous-mixing`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/so21-intermediate-subgroups`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/closed-orbit-rational-form`.
- **Supplier `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.** Chevalley stabilizer theorem for an algebraic subgroup H≤SL_n over ℝ: a finite-dimensional algebraic representation ρ and a real line ℓ with stabilizer exactly H(ℝ). Consume current Tau Ceti HopfIdeal.exists_finite_subcomodule_exteriorPower_line_stabilizer (Representation/ExteriorStabilizer/Character.lean, lines 100–115) and supply its real-points/Noetherian finite-ideal adapter; this is after f790474, not a pinned baseline. It is already implemented in the current owner direction, so do not replan the polynomial-space/exterior-line construction here. Morris Theorem 4.5.2, printed pp.133–134. Used by: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/borel-density`.
- **Supplier `tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori`.** An algebraic representation of SL_n over ℝ sends unipotent real points to unipotent linear maps, and a real diagonalizable point with positive eigenvalues to a real diagonalizable linear map with positive eigenvalues. Use functorial Jordan decomposition and the integer-weight decomposition on the split diagonal torus. Current Tau Ceti Representation/UnipotentPoint and JordanDecompositionNaturality cover the algebraic part after the pin; the positive-real-weight adapter is requested explicitly (Morris Corollary 4.3.6, printed p.126). Used by: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/borel-density`.
- **Supplier `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.** Use the existing standard highest-weight module Sl2Std ℝ 4, its explicit raising/lowering actions and irreducibility. Current Tau Ceti TauCeti.Sl2Std.eq_top_of_raise_mem_of_lower_mem (Algebra/Lie/Sl2/Standard.lean:971) and instance TauCeti.Sl2Std.isIrreducible (line 980) implement this after the pin. GN.4 supplies only the concrete so(2,1)-quotient identification, not a new theory of irreducible sl₂ modules. Used by: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/so21-quotient-standard-module`.

**Additional owner notes.**

- `tauceti:TauCetiRoadmap/GlobalNumberFields`: Layer 3A's lattice-point count is for a fixed lattice (its constant depends on D and Λ). Consumers in counting problems need Widmer's lattice-uniform version with the successive-minima error; the atlas plans it in GeometryOfNumbersAndQuadraticArithmetic GN.4 (widmer-lipschitz-count) on top of 3A's IsLipschitzParametrizable.
- `tauceti:TauCetiRoadmap/RealAlgebraicGeometry`: RealAlgebraicGeometry Layer 6 owns CAD and quantifier elimination; GN.4 derives the uniform fibre-component consequence and does not replan CAD. The further choice/dimension and C¹-partition contracts are stated below with exact layers and locators. The absent snapshot registry prevents a formal requests entry, so these terminate in the recorded honest owner-interface gap.
- `tauceti:TauCetiRoadmap/RealAlgebraicGeometry`: tauceti:TauCetiRoadmap/RealAlgebraicGeometry#layer-6-cad-and-quantifier-elimination: Use the existing CAD/projection-closure carriers. Supply the following derived interfaces: semialgebraic choice (a semialgebraic section of any semialgebraic surjection), fibrewise closure/interior/frontier, dimension monotonicity under images and equality for injections, dim(closure A\A)<dim A, and the fibre-dimension inequality dim{y:dim A_y≥r}+r≤dim A. These are explicit requested consequences of the owner’s CAD, not declarations claimed at the pins. Choice is obtained cell by cell by midpoint/endpoint choices; dimension follows from cell dimensions. BCR Theorem 2.8.8 and Proposition 2.8.13, pp.52–53; BW Proposition 3.14–3.15, pp.12–13. The snapshot registry has no RealAlgebraicGeometry stage, so this import is recorded as an owner contract and an honest gap, not a fabricated baseline or an invalid supplier request.
- `tauceti:TauCetiRoadmap/RealAlgebraicGeometry`: tauceti:TauCetiRoadmap/RealAlgebraicGeometry#layer-7-analytic-preparation-and-mccallum-projection: On the existing semialgebraic carriers and CAD, supply a finite partition into C¹ embedded semialgebraic submanifolds whose manifold and cell dimensions agree. This extra consumer contract is not asserted by the present Layer 7 README: it is a requested extension in its analytic direction, using Layer 6 CAD and Layer 7 implicit roots. Refine the slicing family by derivatives so each root branch is a simple root of some derivative; use implicit roots on the base cells. BCR Proposition 2.9.10 and proof, p.57, and Proposition 2.8.14, p.54. No new Nash-manifold theory is requested for GN.4. The snapshot registry has no RealAlgebraicGeometry stage, so this import is recorded as an owner contract and an honest gap, not a fabricated baseline or an invalid supplier request.
- `tauceti:TauCetiRoadmap/ReductiveGroups`: Current main already implements the Chevalley exterior-line stabilizer and functorial unipotent/Jordan representation results. Use the exact Layer 3 and Layer 4 supplier requests; do not introduce an atlas copy of either theory.
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight`: Layer 0 and current TauCeti.Sl2Std implement standard sl₂ modules and irreducibility. GN.4 owns only the explicit five-dimensional so(2,1) matrix adapter. No ownership move or duplicate highest-weight theory is proposed.

## Open inputs and coverage

Finished revision pass with 76 targets. The six groups of returned proof-contract findings have explicit corrected targets, proofs or supplier imports; the stronger Huxley route is clearly conditional. Remaining entries are honest owner/pin and inherited proof inputs, not a claim of closure. The historical needs_changes review is retained for the next independent reviewer to replace.

**Post-pin semialgebraic owner interfaces.** RealAlgebraicGeometry is a current upstream roadmap absent from the atlas stage registry. Its Layer 6 CAD/projection-closure modules exist after the pin f790474; no post-pin declaration is falsely listed as baseline. The precise owner contracts are recorded in upstreamNotes: Layer 6 choice, fibrewise closure and dimension/fibre-dimension consequences of CAD, plus a Layer 7 extension giving a finite C¹ semialgebraic partition by derivative refinement and implicit roots (BCR Proposition 2.9.10, p.57). The current Layer 7 README does not itself promise this partition. These are explicit owner-side interfaces to supply, not an assertion that CAD alone already exposes them. Within GN.4, the chart-measure, uniform multiplicity, section and boundary targets now give the entire BW 5.8→6.2→6.1→§7 chain relative to these inputs. Assembly must register the existing roadmap and route these contracts; neither that registry nor its files is in this issue’s edit scope.

Affected targets: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-uniform-components`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-interval-condition`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/rectifiable-coordinate-measure-bound`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-hausdorff-bound`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-boundary-null`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/orthogonal-projection-comparison`.

**Inherited Huxley exponent-sum and uniform ellipse contract.** The Bombieri–Iwaniec–Huxley spacing method remains undecomposed in the base plan. The fixed-domain bound reported in IKKN2004 p.10 does not prove the separate all-ellipses contract C(1+R)^{131/208}log(2+R)^{18637/8320} with one C. Huxley 2003’s permitted primary proof was not readable in this run; no normalized derivative or eccentricity hypothesis is invented. The exact stronger input is now stated in huxley-planar-count, and the improved admissible range is explicitly conditional on it. The independent elementary route at θ≥2/3 is fully planned by the new primary-source Fourier/smoothing adaptation, including thin ellipses.

Affected targets: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/huxley-planar-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/admissible-ellipse-exponents`.

**Inherited indirect primary proofs.** The general Davenport, Schmidt and Eskin–Katznelson proofs remain read through BW, BLS and BSW at the listed locators. The general fixed-C²-domain van der Corput proof is also an indirect classical-source item; its unspecified fixed-domain constant is not used for shape-uniform admissibility. This continuation does not certify unseen primary arguments. By contrast, Le Boudec’s actual 2020 primary Lemma 3 and Toma’s 2020 nonfundamental-discriminant Theorem 1 are now read directly; those former source gaps and the false representation-pair range are resolved locally.

Affected targets: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-principle`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/schmidt-primitive-extension-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/eskin-katznelson-basis`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/van-der-corput-planar-count`.

**Inherited Howe–Moore and Ratner proof inputs.** The continuation now uses exactly the base GN.4/howe-moore-mixing theorem and supplies strong continuity, unitarity, constants as invariant vectors and proper escape of the chosen one-parameter subgroup. The general matrix-coefficient decay proof remains the base packet’s explicit open input. No LieGroups Layer 2 citation is offered as a substitute for decay or contracting-subgroup generation. The base Ratner measure-classification/orbit-closure proof contracts remain open and are imported without a new proof claim here.

Affected targets: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/homogeneous-mixing`.

## Assembly and ownership proposals

The base packet records gaps behind its GN.4 endpoints. This continuation provides the counting and homogeneous-space adapters listed below, relative to the explicit owner requests and inherited gaps; it does not complete Howe–Moore, Ratner, or the Huxley method. The base packet is outside this job’s edit scope.

At assembly, re-point the base Davenport, Mahler, nondivergence, Oppenheim-auxiliary and Siegel nodes to the corresponding targets of this continuation, preserving their supplier contracts and inherited source/proof gaps. In particular, use the unipotent lattice-change proof; the full Hausdorff/section/boundary chain for BW; the marked-poset/primitive-flag chain for quantitative nondivergence; and the Chevalley and standard-module imports for Borel density and the intermediate-subgroup lemma. homogeneous-ergodicity may use homogeneous-mixing for noncompact one-parameter subgroups only relative to the base howe-moore-mixing input; do not create a circular proof or mark that inherited gap closed. dual-transference-upper gains the weaker-constant companion transference-minkowski-constant. Move the Duke endpoint according to the separate toral-packets rescope below.

Duke's equidistribution of CM points and closed geodesics on the modular surface, its genus refinement by Duke–Imamoḡlu–Tóth (Theorem 2, (4.4), (4.5), Propositions 1–2 and §6, routed to GN.4 as PAPER-DUKE-IMAMOGLU-TOTH-16 items 51, 53–55, 69–71, 146, 148, 150, 153, 154) and the base node duke-spherical-equidistribution need Maass-form spectral theory (AutomorphicSpectralTheory), half-integral weight forms and Waldspurger–Kohnen–Zagier or Iwaniec bounds (MetaplecticAutomorphicForms), Siegel's class-number bound (AnalyticNumberTheory) and, for the genus surfaces F_A, Nielsen cores (FuchsianOrbifoldsPartII). All are above GN's tier 3 in the Caraiani–Newton order, so GN.4 cannot cite them; moving them down would re-plan whole roadmaps.

Keep in GN.4 the arithmetic carriers planned here (cm-point-packet, oriented-closed-geodesic, closed-geodesic-length, geodesic-orientation-reversal, harmonic-weyl-sum, spherical-weyl-criterion) and move the equidistribution theorems themselves, with duke-spherical-equidistribution, to the Part II proposed by PAPER-KHAYUTIN-19 route 1 (GeometryOfNumbersPartIIToralJoinings, 'joinings of toral packets and the mixing conjecture'), which goes in exactly this direction, sits above the spectral roadmaps and imports these carriers. The base packet's tier-move gap for MetaplecticAutomorphicForms:MP.7 then disappears from GN.

GN.4 now holds about 126 target-level nodes (46 in the base packet, 4 in the GN.1 follow-up, 76 here) in four directions, and the base packet already shows six planets on the layer.

Divide GN.4 for the atlas into GN.4a 'Lattice-point counting' (base: coset-difference-bound to henk-successive-minima-count, davenport-semialgebraic-count; here: coordinate-projection-volumes to hyperplane-orthant-count, symmetric-row-lattices to skew-singular-symmetric-count, curvature-lattice-class to admissible-ellipse-exponents, markoff-*, blomer-granville-representation-bound), GN.4b 'Homogeneous dynamics on spaces of lattices' (base: howe-moore-mixing to oppenheim-values, mahler-compactness, siegel-mean-value; here: space-of-unimodular-lattices to oppenheim-ternary-reduction and the Siegel transform nodes), GN.4c 'Transference, covering and star bodies' (base: packing-radius, compact-star-body, transference, covering, critical determinants and the Gaussian chain; GN.1 follow-up: gaussian-directional-tail, gaussian-coordinate-tails, l1-covering-transference, smith-cofactor-adjustment; here: transference-minkowski-constant, max-norm-covering, construction-a-minimum) and GN.4d 'Arithmetic packets for equidistribution' (base: duke-spherical-equidistribution until it moves; here: cm-point-packet to spherical-weyl-criterion). This packet's six planets go to GN.4a (Widmer's lattice-point count, Van der Corput lattice-point bound) and GN.4b (Space of unimodular lattices, Mixing of one-parameter flows, Quantitative nondivergence, Siegel transform).

RT-AREA-algebraicnt-1/1 (confirmed): the roadmap's suppliers are named in prose but not recorded as roadmap-level prerequisites with reciprocal consumers. For GN.4 the suppliers are AdelicAlgebraicGroups AA.2–AA.3 (Haar measure, lattice property of SL_n(ℤ)), GlobalNumberFields Layer 3 (Lipschitz parametrisable sets), RealAlgebraicGeometry Layer 6 (CAD, Tarski–Seidenberg), RepresentationTheory/LieGroups Layer 2, AlgebraicCodingTheory Layer 6 (Construction A) and IntegralLattices Layer B (binary forms and their class numbers, for cm-point-packet).

Record the stage links AdelicAlgebraicGroups:AA.2 → GN.4, AdelicAlgebraicGroups:AA.3 → GN.4, GlobalNumberFields Layer 3 → GN.4, RealAlgebraicGeometry Layer 6 → GN.4, RepresentationTheory/LieGroups Layer 2 → GN.4 and AlgebraicCodingTheory Layer 6 → GN.4 in the link workflow with full tauceti: identifiers, each carried by the nodes that cite them here, and let assembly derive the roadmap-level prerequisites and reciprocal consumer entries, as the verdict on RT-AREA-algebraicnt-1/1 prescribes and as the GN.1 and GN.2 follow-ups did for their layers. QuadraticFormInvariants and GlobalQuadraticForms concern GN.2 only; nothing in GN.4 uses them. Include ReductiveGroups Layers 3–4 and LieHighestWeight Layer 0 from the new exact requests, and the additional RealAlgebraicGeometry Layer 7 extension recorded in upstreamNotes. The absent RealAlgebraicGeometry snapshot stages must be registered before formal supplier requests can replace the recorded owner-interface gap. These are assembly instructions, not edits to the authoritative roadmaps.

**RT-AREA-algebraicnt-1/1.** Roadmap-level metadata lives outside this job's files. The GN.4 edges of the finding are stated in the nodes that use them (AdelicAlgebraicGroups AA.2–AA.3 in the lattice-space and Siegel nodes; GlobalNumberFields Layer 3 in widmer-lipschitz-count and hyperplane-orthant-count; RealAlgebraicGeometry Layer 6 in the semialgebraic nodes; RepresentationTheory/LieGroups Layer 2 in the dynamics nodes; AlgebraicCodingTheory Layer 6 through the base construction-a-real-lattice-interface; IntegralLattices binary forms in cm-point-packet), with request entries, and the fourth restructure entry records the corresponding supplier-stage → GN.4 links in the form the finding's verdict prescribes, so assembly derives the roadmap-level prerequisites and reciprocal consumers. QuadraticFormInvariants and GlobalQuadraticForms are GN.2 suppliers only. The exact new ReductiveGroups and LieHighestWeight requests supplement those imports. RealAlgebraicGeometry is absent from the atlas registry: its Layer 6/7 contracts are recorded explicitly in upstreamNotes and gaps, rather than as an invalid request or a fabricated pinned declaration.

## Paper routing and acceptance

The per-target checks above are the acceptance contract. The routed consumers retain the following mappings; a mapping marked planned inherits the target’s explicit prerequisites and gaps.

- **PAPER-BHARGAVA-SHANKAR-WANG-25/31**: `base davenport-semialgebraic-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/davenport-principle`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-interval-condition`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/unipotent-davenport-transfer`. planned; the route's review asked for the uniform contract, supplied by the semialgebraic and unipotent nodes
- **PAPER-BHARGAVA-SHANKAR-WANG-25/39**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/bounded-domain-count`. planned with the j = 0 term (E14)
- **PAPER-BHARGAVA-SHANKAR-WANG-25/40**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/symmetric-row-lattices`. planned; full-rank part and spanning lattice separated (E18)
- **PAPER-BHARGAVA-SHANKAR-WANG-25/41**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/eskin-katznelson-basis`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/eskin-katznelson-nonvanishing`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/row-lattice-matrix-count`. planned with d(γΛ) (E15)
- **PAPER-BHARGAVA-SHANKAR-WANG-25/42**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/skew-row-lattice-count`. planned
- **PAPER-BHARGAVA-SHANKAR-WANG-25/43**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/skew-singular-symmetric-count`. planned; supplies the ArithmeticStatistics ST.2 request for skew-region symmetric-rank counts
- **PAPER-BROWNING-LEBOUDEC-SAWIN-23 (GN.4 route: cone, transference, band-count, ball-count, ball-count-index, short-count, short-count-refined, dyadic-lattices, dyadic-bound, I-volume, I-asymptotic, J-volume, J-asymptotic, weighted-lattice, primitive-ball-input, bw-count, schmidt-extension-count, davenport-reduced-basis)**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/angular-band-region`, `base dual-transference-upper`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/band-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ball-count-successive-minima`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/ball-count-intermediate-minimum`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/small-vector-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/primitive-lattices-with-prescribed-minima`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/primitive-lattice-minima-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/band-section-volumes`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/band-section-volume-asymptotics`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/weighted-lattice-sums`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/primitive-ball-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/semialgebraic-family-lattice-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/schmidt-primitive-extension-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/adapted-basis-coordinates`. planned; bw-count is planned for semialgebraic families, the only case the paper uses
- **PAPER-DUKE-IMAMOGLU-TOTH-16/24, /25, /26, /52, cycle-integral-convention, oriented-cycle-of-a-form**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/oriented-closed-geodesic`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/closed-geodesic-length`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/geodesic-orientation-reversal`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/cm-point-packet`. planned (carriers)
- **PAPER-DUKE-IMAMOGLU-TOTH-16/51, /53, /54, /55, /69, /70, /71, /146, /148, /150, /153, /154, geodesic-and-cm-main-terms**: . not planned in GN.4: they rest on higher-tier spectral, metaplectic, analytic and Nielsen-core inputs; proposed move to GeometryOfNumbersPartIIToralJoinings (second restructure entry)
- **PAPER-DUKE-IMAMOGLU-TOTH-16/6–13, /101–102, /143, narrow-class-number, fundamental-discriminant-forms-primitive**: . not GN.4: binary forms, Pell automorphs and cycles are IntegralLattices Layer B and the GN.2/GN.3 follow-ups
- **PAPER-GHOSH-SARNAK-22/29, /30, /31**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/markoff-fibre-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/markoff-fundamental-set-count`. planned with the corrected constant 1/48 (E1)
- **PAPER-GHOSH-SARNAK-22/32**: . not planned here: identifying R^±(K) with the class-number sums needs the fundamental-set theorem (Ghosh–Sarnak Theorem 1.1), routed to ClassicalArithmeticCompletion CA.4; GN.4 supplies the count markoff-fundamental-set-count
- **PAPER-GHOSH-SARNAK-22/45**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/blomer-granville-representation-bound`. planned
- **PAPER-KHAYUTIN-19/95**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/curvature-lattice-class`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/van-der-corput-planar-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/huxley-planar-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/admissible-ellipse-exponents`. planned; the D_small decomposition of Definition 10.9 is sieve bookkeeping for the consumer, not a lattice estimate
- **PAPER-KOYMANS-MILOVIC-21/17**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/widmer-lipschitz-count`. planned
- **PAPER-LIU-WOOD-ZUREICKBROWN-24/42**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/hyperplane-orthant-count`. planned with positive weights (E8)
- **PAPER-MAULIK-SHANKAR-TANG-22/75**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/quadratic-norm-count-by-minima`. planned
- **PAPER-SHANKAR-SHANKAR-TANG-ETAL-22/79**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/quadratic-norm-count-by-minima`. planned
- **PAPER-NELSON-VENKATESH-21/89**: `base ratner-measure-classification`. the measure classification is the base node; the ergodic decomposition clause is general ergodic theory (Morris Theorem 3.3.3) and is recorded with the base packet's Ratner gap
- **PAPER-NELSON-VENKATESH-21/113**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/borel-density`. planned
- **request ProbabilisticAndMetricNumberTheory:PM.4 (SL(2) quotient, Haar probability, a_t, sup-norm Mahler, time-one mixing, transpose convention)**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/space-of-unimodular-lattices`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/lattice-space-invariant-probability`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/diagonal-and-unipotent-flows`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/mahler-compactness-sup-norm`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/time-one-mixing-sl2`. supplied
- **request DiophantineApproximationAndTranscendence:DT.0 (Evertse Theorem 2.20 / Corollary 2.21, sup-norm covering)**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/max-norm-covering`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/transference-minkowski-constant`. supplied, with constant n
- **request ArithmeticStatistics:ST.2 (Davenport's lemma; skew symmetric-rank counts)**: `base davenport-semialgebraic-count`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/unipotent-davenport-transfer`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/skew-singular-symmetric-count`. supplied
- **request SieveMethodsAndPrimePatterns (Khayutin L(C_l, θ_l) input)**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/curvature-lattice-class`, `GeometryOfNumbersAndQuadraticArithmetic:GN.4/admissible-ellipse-exponents`. supplied; θ = 131/208 + ε depends on the Huxley gap
- **request SieveMethodsAndPrimePatterns (Widmer counts; codimension-two geometric sieve)**: `GeometryOfNumbersAndQuadraticArithmetic:GN.4/widmer-lipschitz-count`. Widmer counts supplied; the geometric sieve (Bhargava, Theorem 3.3) is not a GN.4 lattice estimate and is planned in ArithmeticStatistics:ST.2 (quantitative-ekedahl-geometric-sieve)
- **request HeegnerPointEulerSystems:HE.8 (S-arithmetic Ratner over F_P, twisted-diagonal joinings)**: . not GN.4, whose dynamics are over ℝ: S-arithmetic measure classification and joinings belong to GeometryOfNumbersPartIIToralJoinings (Khayutin's Part II)

## Source-issue and version notes

E401 retains its independent rejected verdict: failure of the naive projection-invariance argument is not a source erratum. The replacement lattice-change proof now supplies the uniform estimate. E402 retains its independently confirmed, inspected-copy scope: the mixing formula uses the product of integrals. The BSW published/preprint corrections remain attributed to the reviewed extraction; this revision does not claim a new published collation. The packet records URLs, source hashes, read dates and independent verdicts.

**GeometryOfNumbersAndQuadraticArithmetic/E401.** Proposition 2.5 and the paragraph after it, physical p.14 (arXiv v2)

The shear example only rules out substituting projection volumes of uR for those of R in a naive argument. It does not establish a source erratum. The atlas now proves the asserted estimate by applying Barroero–Widmer Theorem 1.3 to u⁻¹ℤⁿ: the last nonzero integral coordinate proves that every successive minimum is at least one. The rejected fibre-volume induction is removed.

A shear can enlarge a coordinate projection arbitrarily while u⁻¹ℤⁿ still has shortest Euclidean vector length at least one. This explains why the lattice-uniform theorem gives the original projection-volume bound.

**GeometryOfNumbersAndQuadraticArithmetic/E402.** Theorem 3.2.9, printed p.103 (arXiv:math/0310402)

The limit is the product of the integrals (∫φ dμ)(∫ψ dμ), as Remark 3.2.8 (μ(Ag_t ∩ B) → μ(A)μ(B)) and the proof (reduction to the orthogonal complement of the constants) show.

For φ = ψ = 1_A with 0 < μ(A) < 1 mixing gives the limit μ(A)², while ‖φ‖₂‖ψ‖₂ = μ(A); for ψ = −φ the printed value is positive while the true limit −(∫φ)² is ≤ 0.

## Pinned declaration inventory

- `mathlib:ArithmeticFunction.moebius` — `Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean`. def at Mathlib/NumberTheory/ArithmeticFunction/Moebius.lean:51, `def moebius : ArithmeticFunction ℤ :=`; used by: Primitive points of a primitive lattice in a ball
- `mathlib:ArithmeticFunction.sigma` — `Mathlib/NumberTheory/ArithmeticFunction/Misc.lean`. def at Mathlib/NumberTheory/ArithmeticFunction/Misc.lean:143, `def sigma (k : ℕ) : ArithmeticFunction ℕ :=`; used by: Blomer–Granville bound for pairs of representations
- `mathlib:ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints` — `Mathlib/Topology/ContinuousMap/StoneWeierstrass.lean`. theorem at Mathlib/Topology/ContinuousMap/StoneWeierstrass.lean:401, `theorem ContinuousMap.starSubalgebra_topologicalClosure_eq_top_of_separatesPoints`; used by: Weyl's criterion on the sphere
- `mathlib:Convex` — `Mathlib/Analysis/Convex/Basic.lean`. def at Mathlib/Analysis/Convex/Basic.lean:52, `def Convex : Prop :=`; used by: Planar domains with a curvature-controlled lattice count
- `mathlib:ENNReal.tsum_eq_iSup_sum` — `Mathlib/Topology/Algebra/InfiniteSum/ENNReal.lean`. theorem at Mathlib/Topology/Algebra/InfiniteSum/ENNReal.lean:72, `protected theorem tsum_eq_iSup_sum : ∑' a, f a = ⨆ s : Finset α, ∑ a ∈ s, f a :=`; used by: The Siegel transform
- `mathlib:Ergodic` — `Mathlib/Dynamics/Ergodic/Ergodic.lean`. structure at Mathlib/Dynamics/Ergodic/Ergodic.lean:49, `structure Ergodic (f : α → α) (μ : Measure α := by volume_tac) : Prop extends`; used by: Mixing of the time-one map of the diagonal flow on X_2
- `mathlib:EuclideanSpace.norm_eq` — `Mathlib/Analysis/InnerProductSpace/PiL2.lean`. theorem at Mathlib/Analysis/InnerProductSpace/PiL2.lean:148, `theorem EuclideanSpace.norm_eq {𝕜 : Type*} [RCLike 𝕜] {n : Type*} [Fintype n]`; used by: Mahler's criterion with the sup norm
- `mathlib:Finset.gcd` — `Mathlib/Algebra/GCDMonoid/Finset.lean`. def at Mathlib/Algebra/GCDMonoid/Finset.lean:124, `def gcd (s : Finset β) (f : β → α) : α :=`; used by: Primitive and unrestricted weighted lattice sums
- `mathlib:InnerProductSpace.volume_closedBall` — `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean`. theorem at Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:358, `theorem volume_closedBall (x : E) (r : ℝ) :`; used by: One-band and two-band section volumes
- `mathlib:Int.fract` — `Mathlib/Algebra/Order/Floor/Defs.lean`. def at Mathlib/Algebra/Order/Floor/Defs.lean:256, `def fract (a : α) : α :=`; used by: Van der Corput's bound for C² convex domains
- `mathlib:IsCompact` — `Mathlib/Topology/Defs/Filter.lean`. def at Mathlib/Topology/Defs/Filter.lean:284, `def IsCompact (s : Set X) :=`; used by: Planar domains with a curvature-controlled lattice count
- `mathlib:IsCompact.image` — `Mathlib/Topology/Compactness/Compact.lean`. theorem at Mathlib/Topology/Compactness/Compact.lean:125, `theorem IsCompact.image {f : X → Y} (hs : IsCompact s) (hf : Continuous f) : IsCompact (f '' s) :=`; used by: Davenport's principle for coordinate-convex regions
- `mathlib:IsPreconnected` — `Mathlib/Topology/Connected/Basic.lean`. def at Mathlib/Topology/Connected/Basic.lean:50, `def IsPreconnected (s : Set α) : Prop :=`; used by: Uniform bound on connected components in semialgebraic families
- `mathlib:IsPreconnected.image` — `Mathlib/Topology/Connected/Basic.lean`. theorem at Mathlib/Topology/Connected/Basic.lean:294, `protected theorem IsPreconnected.image [TopologicalSpace β] {s : Set α} (H : IsPreconnected s)`; used by: Davenport's interval condition for semialgebraic regions
- `mathlib:Lagrange.interpolate` — `Mathlib/LinearAlgebra/Lagrange.lean`. def at Mathlib/LinearAlgebra/Lagrange.lean:299, `def interpolate (s : Finset ι) (v : ι → F) : (ι → F) →ₗ[F] F[X] where`; used by: (C, α)-good functions
- `mathlib:LieSubalgebra` — `Mathlib/Algebra/Lie/Subalgebra.lean`. structure at Mathlib/Algebra/Lie/Subalgebra.lean:45, `structure LieSubalgebra extends Submodule R L where`; used by: Connected subgroups between SO(2,1) and SL(3,ℝ)
- `mathlib:LinearMap.BilinForm.dualSubmodule` — `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean`. def at Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean:37, `def dualSubmodule (N : Submodule R M) : Submodule R M where`; used by: Covering from a lower bound on the dual lattice
- `mathlib:Matrix.IsSymm` — `Mathlib/LinearAlgebra/Matrix/Symmetric.lean`. def at Mathlib/LinearAlgebra/Matrix/Symmetric.lean:35, `def IsSymm (A : Matrix n n α) : Prop :=`; used by: Symmetric matrices with prescribed row space
- `mathlib:Matrix.SpecialLinearGroup` — `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`. def at Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:70, `def SpecialLinearGroup :=`; used by: Diagonal and unipotent flows on the space of lattices; The space of unimodular lattices
- `mathlib:Matrix.SpecialLinearGroup.isClosedEmbedding_val` — `Mathlib/Topology/Algebra/Group/Matrix.lean`. lemma at Mathlib/Topology/Algebra/Group/Matrix.lean:114, `lemma isClosedEmbedding_val [T1Space R] :`; used by: The space of unimodular lattices
- `mathlib:Matrix.SpecialLinearGroup.isTopologicalGroup` — `Mathlib/Topology/Algebra/Group/Matrix.lean`. instance at Mathlib/Topology/Algebra/Group/Matrix.lean:125, `instance isTopologicalGroup : IsTopologicalGroup (SL n R) where`; used by: The space of unimodular lattices
- `mathlib:Matrix.SpecialLinearGroup.map` — `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`. def at Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:225, `def map (f : R →+* S) : SpecialLinearGroup n R →* SpecialLinearGroup n S where`; used by: The space of unimodular lattices
- `mathlib:Matrix.cramer` — `Mathlib/LinearAlgebra/Matrix/Adjugate.lean`. def at Mathlib/LinearAlgebra/Matrix/Adjugate.lean:94, `def cramer (A : Matrix n n α) : (n → α) →ₗ[α] (n → α) :=`; used by: A basis adapted to the successive minima, with coordinate bounds
- `mathlib:Matrix.frobeniusNormedAddCommGroup` — `Mathlib/Analysis/Matrix/Normed.lean`. def at Mathlib/Analysis/Matrix/Normed.lean:520, `def frobeniusNormedAddCommGroup [NormedAddCommGroup α] : NormedAddCommGroup (Matrix m n α) :=`; used by: Symmetric matrices with prescribed row space
- `mathlib:Matrix.rank` — `Mathlib/LinearAlgebra/Matrix/Rank.lean`. def at Mathlib/LinearAlgebra/Matrix/Rank.lean:134, `noncomputable def rank [CommSemiring R] (A : Matrix m n R) : ℕ :=`; used by: Symmetric matrices with prescribed row space
- `mathlib:Matrix.vecMulVec` — `Mathlib/Data/Matrix/Mul.lean`. def at Mathlib/Data/Matrix/Mul.lean:616, `def vecMulVec [Mul α] (w : m → α) (v : n → α) : Matrix m n α :=`; used by: Symmetric matrices with prescribed row space
- `mathlib:Measurable.ennreal_tsum` — `Mathlib/MeasureTheory/Constructions/BorelSpace/Real.lean`. theorem at Mathlib/MeasureTheory/Constructions/BorelSpace/Real.lean:354, `theorem Measurable.ennreal_tsum {ι} [Countable ι] {f : ι → α → ℝ≥0∞} (h : ∀ i, Measurable (f i)) :`; used by: The Siegel transform
- `mathlib:MeasureTheory.Conservative.ae_mem_imp_frequently_image_mem` — `Mathlib/Dynamics/Ergodic/Conservative.lean`. theorem at Mathlib/Dynamics/Ergodic/Conservative.lean:159, `theorem ae_mem_imp_frequently_image_mem (hf : Conservative f μ) (hs : NullMeasurableSet s μ) :`; used by: Borel's density theorem
- `mathlib:MeasureTheory.IsFundamentalDomain` — `Mathlib/MeasureTheory/Group/FundamentalDomain.lean`. structure at Mathlib/MeasureTheory/Group/FundamentalDomain.lean:69, `structure IsFundamentalDomain (G : Type*) {α : Type*} [One G] [SMul G α] [MeasurableSpace α]`; used by: The invariant probability on the space of lattices
- `mathlib:MeasureTheory.Lp` — `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`. def at Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:89, `def Lp {α} (E : Type*) {m : MeasurableSpace α} [NormedAddCommGroup E] (p : ℝ≥0∞)`; used by: The Mautner phenomenon
- `mathlib:MeasureTheory.Lp.compMeasurePreserving` — `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`. def at Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:565, `def compMeasurePreserving (f : α → β) (hf : MeasurePreserving f μ μb) :`; used by: The Mautner phenomenon
- `mathlib:MeasureTheory.Measure.addHaar_image_linearMap` — `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`. theorem at Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:297, `theorem addHaar_image_linearMap (f : E →ₗ[ℝ] E) (s : Set E) :`; used by: Invariant measures on the punctured space; One-band and two-band section volumes; Volumes of coordinate projections
- `mathlib:MeasureTheory.Measure.addHaar_smul` — `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`. theorem at Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:362, `theorem addHaar_smul (r : ℝ) (s : Set E) :`; used by: Volumes of coordinate projections
- `mathlib:MeasureTheory.Measure.haar` — `Mathlib/MeasureTheory/Measure/Haar/Basic.lean`. abbrev at Mathlib/MeasureTheory/Measure/Haar/Basic.lean:584, `noncomputable abbrev haar [LocallyCompactSpace G] : Measure G :=`; used by: Invariant measures on the punctured space; The invariant probability on the space of lattices
- `mathlib:MeasureTheory.Measure.isMulLeftInvariant_eq_smul` — `Mathlib/MeasureTheory/Measure/Haar/Unique.lean`. lemma at Mathlib/MeasureTheory/Measure/Haar/Unique.lean:922, `lemma isMulLeftInvariant_eq_smul [LocallyCompactSpace G] [SecondCountableTopology G]`; used by: Invariant measures on the punctured space
- `mathlib:MeasureTheory.Measure.pi` — `Mathlib/MeasureTheory/Constructions/Pi.lean`. irreducible_def at Mathlib/MeasureTheory/Constructions/Pi.lean:210, `protected irreducible_def pi : Measure (∀ i, α i) :=`; used by: Volumes of coordinate projections
- `mathlib:MeasureTheory.Measure.prod_apply` — `Mathlib/MeasureTheory/Measure/Prod.lean`. theorem at Mathlib/MeasureTheory/Measure/Prod.lean:223, `theorem prod_apply {s : Set (α × β)} (hs : MeasurableSet s) :`; used by: Davenport's principle for coordinate-convex regions
- `mathlib:MeasureTheory.integral_fun_norm_addHaar` — `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean`. lemma at Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:296, `lemma integral_fun_norm_addHaar (f : ℝ → F) :`; used by: Asymptotics of the band section volumes
- `mathlib:MeasureTheory.lintegral_eq_lintegral_meas_le` — `Mathlib/MeasureTheory/Integral/Layercake.lean`. theorem at Mathlib/MeasureTheory/Integral/Layercake.lean:445, `theorem lintegral_eq_lintegral_meas_le (μ : Measure α) (f_nn : 0 ≤ᵐ[μ] f)`; used by: Davenport's estimate for triangular unipotent images
- `mathlib:MeasureTheory.lintegral_prod` — `Mathlib/MeasureTheory/Measure/Prod.lean`. theorem at Mathlib/MeasureTheory/Measure/Prod.lean:1000, `theorem lintegral_prod (f : α × β → ℝ≥0∞) (hf : AEMeasurable f (μ.prod ν)) :`; used by: Davenport's estimate for triangular unipotent images; Davenport's principle for coordinate-convex regions
- `mathlib:MeasureTheory.lintegral_tsum` — `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`. theorem at Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean:362, `theorem lintegral_tsum [Countable β] {f : β → α → ℝ≥0∞} (hf : ∀ i, AEMeasurable (f i) μ) :`; used by: Siegel's mean value theorem, primitive form; Unfolding the primitive Siegel transform
- `mathlib:MeasureTheory.tendsto_of_forall_isOpen_le_liminf` — `Mathlib/MeasureTheory/Measure/Portmanteau.lean`. theorem at Mathlib/MeasureTheory/Measure/Portmanteau.lean:592, `theorem tendsto_of_forall_isOpen_le_liminf {ι : Type*} {μ : ProbabilityMeasure Ω}`; used by: Weyl's criterion on the sphere
- `mathlib:Metric.ball` — `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean`. def at Mathlib/Topology/MetricSpace/Pseudo/Defs.lean:370, `def ball (x : α) (ε : ℝ) : Set α :=`; used by: (C, α)-good functions
- `mathlib:Metric.closedBall` — `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean`. def at Mathlib/Topology/MetricSpace/Pseudo/Defs.lean:421, `def closedBall (x : α) (ε : ℝ) :=`; used by: Angular bands and their lattice regions
- `mathlib:ModularGroup.fd` — `Mathlib/NumberTheory/Modular.lean`. def at Mathlib/NumberTheory/Modular.lean:367, `def fd : Set ℍ :=`; used by: The packet of CM points of a negative discriminant
- `mathlib:Module.Basis.det` — `Mathlib/LinearAlgebra/Determinant.lean`. def at Mathlib/LinearAlgebra/Determinant.lean:597, `nonrec def det : M [⋀^ι]→ₗ[R] R where`; used by: A basis adapted to the successive minima, with coordinate bounds
- `mathlib:MvPolynomial` — `Mathlib/Algebra/MvPolynomial/Basic.lean`. abbrev at Mathlib/Algebra/MvPolynomial/Basic.lean:82, `abbrev MvPolynomial (σ : Type*) (R : Type*) [CommSemiring R] :=`; used by: Semialgebraic sets and multisets of bounded complexity; Weyl sums of spherical harmonics over lattice points on spheres
- `mathlib:MvPolynomial.eval` — `Mathlib/Algebra/MvPolynomial/Eval.lean`. def at Mathlib/Algebra/MvPolynomial/Eval.lean:256, `def eval (f : σ → R) : MvPolynomial σ R →+* R :=`; used by: Semialgebraic sets and multisets of bounded complexity
- `mathlib:MvPolynomial.totalDegree` — `Mathlib/Algebra/MvPolynomial/Degrees.lean`. def at Mathlib/Algebra/MvPolynomial/Degrees.lean:432, `def totalDegree (p : MvPolynomial σ R) : ℕ :=`; used by: Semialgebraic sets and multisets of bounded complexity
- `mathlib:NormedSpace.exp` — `Mathlib/Analysis/Normed/Algebra/Exponential.lean`. irreducible_def at Mathlib/Analysis/Normed/Algebra/Exponential.lean:127, `noncomputable irreducible_def exp (x : 𝔸) : 𝔸 :=`; used by: Diagonal and unipotent flows on the space of lattices
- `mathlib:QuadraticMap` — `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`. structure at Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:150, `structure QuadraticMap (R : Type u) (M : Type v) (N : Type w) [CommSemiring R] [AddCommMonoid M]`; used by: Reduction of Oppenheim's theorem to three variables
- `mathlib:QuadraticMap.Anisotropic` — `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean`. def at Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1064, `def Anisotropic (Q : QuadraticMap R M N) : Prop :=`; used by: Reduction of Oppenheim's theorem to three variables
- `mathlib:QuotientGroup.integral_eq_integral_automorphize` — `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean`. lemma at Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:378, `lemma QuotientGroup.integral_eq_integral_automorphize {E : Type*} [NormedAddCommGroup E]`; used by: Unfolding the primitive Siegel transform
- `mathlib:QuotientGroup.mk` — `Mathlib/GroupTheory/Coset/Defs.lean`. abbrev at Mathlib/GroupTheory/Coset/Defs.lean:161, `abbrev mk (a : α) : α ⧸ s :=`; used by: The space of unimodular lattices
- `mathlib:Real.arcosh` — `Mathlib/Analysis/SpecialFunctions/Arcosh.lean`. def at Mathlib/Analysis/SpecialFunctions/Arcosh.lean:61, `def arcosh (x : ℝ) :=`; used by: The length of a closed geodesic
- `mathlib:Real.volume_Icc` — `Mathlib/MeasureTheory/Measure/Lebesgue/Basic.lean`. theorem at Mathlib/MeasureTheory/Measure/Lebesgue/Basic.lean:86, `theorem volume_Icc {a b : ℝ} : volume (Icc a b) = ofReal (b - a) := by simp [volume_val]`; used by: Davenport's principle for coordinate-convex regions
- `mathlib:SignType.sign` — `Mathlib/Basic/Sign/Defs.lean`. def at Mathlib/Basic/Sign/Defs.lean:266, `def SignType.sign : α →o SignType :=`; used by: Semialgebraic sets and multisets of bounded complexity
- `mathlib:UpperHalfPlane` — `Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean`. structure at Mathlib/Analysis/Complex/UpperHalfPlane/Basic.lean:25, `structure UpperHalfPlane where`; used by: The oriented closed geodesic of an indefinite form; The packet of CM points of a negative discriminant
- `mathlib:UpperHalfPlane.SLAction` — `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean`. instance at Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:283, `noncomputable instance SLAction {R : Type*} [CommRing R] [Algebra R ℝ] : MulAction SL(2, R) ℍ :=`; used by: The packet of CM points of a negative discriminant
- `mathlib:UpperHalfPlane.dist_eq` — `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean`. theorem at Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean:42, `theorem dist_eq (z w : ℍ) : dist z w = 2 * arsinh (dist (z : ℂ) w / (2 * √(z.im * w.im))) :=`; used by: The length of a closed geodesic; The oriented closed geodesic of an indefinite form
- `mathlib:ZLattice.covolume` — `Mathlib/Algebra/Module/ZLattice/Covolume.lean`. def at Mathlib/Algebra/Module/ZLattice/Covolume.lean:72, `def covolume (μ : Measure E := by volume_tac) : ℝ := (addCovolume L E μ).toReal`; used by: A reduced basis for the symmetric row lattice; The space of unimodular lattices; Widmer's lattice-point count for Lipschitz boundaries
- `mathlib:ZMod.natAbs_valMinAbs_le` — `Mathlib/Data/ZMod/ValMinAbs.lean`. lemma at Mathlib/Data/ZMod/ValMinAbs.lean:90, `lemma natAbs_valMinAbs_le [NeZero n] (x : ZMod n) : x.valMinAbs.natAbs ≤ n / 2 := by`; used by: The minimum of a Construction A lattice
- `mathlib:ZMod.valMinAbs` — `Mathlib/Data/ZMod/ValMinAbs.lean`. def at Mathlib/Data/ZMod/ValMinAbs.lean:23, `def valMinAbs : ∀ {n : ℕ}, ZMod n → ℤ`; used by: The minimum of a Construction A lattice
- `mathlib:ZSpan.fundamentalDomain` — `Mathlib/Algebra/Module/ZLattice/Basic.lean`. def at Mathlib/Algebra/Module/ZLattice/Basic.lean:92, `def fundamentalDomain : Set E := {m | ∀ i, b.repr m i ∈ Set.Ico (0 : K) 1}`; used by: Widmer's lattice-point count for Lipschitz boundaries
- `mathlib:isPreconnected_iff_ordConnected` — `Mathlib/Topology/Order/IntermediateValue.lean`. theorem at Mathlib/Topology/Order/IntermediateValue.lean:449, `theorem isPreconnected_iff_ordConnected {s : Set α} : IsPreconnected s ↔ OrdConnected s :=`; used by: Davenport's interval condition for semialgebraic regions
- `mathlib:pi_norm_le_iff_of_nonneg'` — `Mathlib/Analysis/Normed/Group/Constructions.lean`. lemma at Mathlib/Analysis/Normed/Group/Constructions.lean:320, `lemma pi_norm_le_iff_of_nonneg' (hr : 0 ≤ r) : ‖x‖ ≤ r ↔ ∀ i, ‖x i‖ ≤ r := by`; used by: Mahler's criterion with the sup norm
- `mathlib:real_inner_self_eq_norm_sq` — `Mathlib/Analysis/InnerProductSpace/Basic.lean`. theorem at Mathlib/Analysis/InnerProductSpace/Basic.lean:398, `theorem real_inner_self_eq_norm_sq (x : F) : ⟪x, x⟫_ℝ = ‖x‖ ^ 2 := by`; used by: Angular bands and their lattice regions; One-band and two-band section volumes
- `mathlib:riemannZeta` — `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`. def at Mathlib/NumberTheory/LSeries/RiemannZeta.lean:121, `def riemannZeta := hurwitzZetaEven 0`; used by: Primitive points of a primitive lattice in a ball; Siegel's mean value theorem, primitive form
- `mathlib:MeasureTheory.Measure.euclideanHausdorffMeasure` — `Mathlib/Geometry/Euclidean/Volume/Measure.lean`. Natural-dimensional Hausdorff measure normalized to agree with Euclidean volume; use this measure H^j throughout the projection argument.
- `mathlib:InnerProductSpace.euclideanHausdorffMeasure_eq_volume` — `Mathlib/Geometry/Euclidean/Volume/Measure.lean`. At line 186: μHE[finrank ℝ V] = volume in a finite-dimensional real inner-product space.
- `mathlib:Isometry.euclideanHausdorffMeasure_image` — `Mathlib/Geometry/Euclidean/Volume/Measure.lean`. At line 129: an isometry preserves μHE[d] on images of every set.
- `mathlib:LipschitzOnWith.hausdorffMeasure_image_le` — `Mathlib/MeasureTheory/Measure/Hausdorff.lean`. At line 733: K-Lipschitz image has μH[d] measure at most K^d times the original for d≥0. Multiplying by the dimension normalization gives the same inequality for μHE[j].
- `mathlib:Besicovitch.BallPackage` — `Mathlib/MeasureTheory/Covering/Besicovitch.lean`. At line 196: centres c:β→E, positive radii r, and one finite upper bound r_bound with r i≤r_bound.
- `mathlib:Besicovitch.exist_disjoint_covering_families` — `Mathlib/MeasureTheory/Covering/Besicovitch.lean`. At line 455: if 1<τ and SatelliteConfig E N τ is empty, every BallPackage admits N subfamilies, each with pairwise disjoint closed balls, whose prescribed open balls cover all its centres.
- `mathlib:Besicovitch.one_lt_goodτ` — `Mathlib/MeasureTheory/Covering/BesicovitchVectorSpace.lean`. At line 258: 1<goodτ E for a finite-dimensional real normed space E.
- `mathlib:Besicovitch.isEmpty_satelliteConfig_multiplicity` — `Mathlib/MeasureTheory/Covering/BesicovitchVectorSpace.lean`. At line 488: SatelliteConfig E (multiplicity E) (goodτ E) is empty; combine with the prescribed-ball covering theorem. Set N_d=multiplicity (EuclideanSpace ℝ (Fin d)).
- `mathlib:Besicovitch.multiplicity_le` — `Mathlib/MeasureTheory/Covering/BesicovitchVectorSpace.lean`. At line 151: multiplicity E≤5^(finrank ℝ E). In particular N_d depends only on d.
- `mathlib:SchwartzMap.tsum_eq_tsum_fourier` — `Mathlib/Analysis/Fourier/PoissonSummation.lean`. At line 219: for f:SchwartzMap ℝ ℂ and x:ℝ, Σ_{n∈ℤ} f(x+n)=Σ_{n∈ℤ} Fourier(f)(n) fourier n x. Iterate in the two coordinates with Schwartz decay and Fubini; this is a special ℤ² adapter, not a new general-lattice Poisson theory.
