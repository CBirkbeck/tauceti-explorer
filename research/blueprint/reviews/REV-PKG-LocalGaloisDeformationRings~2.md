# Independent package review: Local Galois deformation rings and their components

Reviewer: Codex, session `codex-iR5BNX`, 13 October 2026. Job `REV-PKG-LocalGaloisDeformationRings~2`, issue #7938. This session authored neither package submission.

**Verdict: accepted, with the corrections in this submission.** The package is ready for the maintainer's draft-roadmap lane under the binding 12 October shape rule. This is acceptance of a mathematical roadmap, not an assertion that its proposed constructions or its suppliers have been formalized. The normal bottom-up supplier order still applies.

## Requirements and the earlier review

Read WORKERS, PACKAGE_REVIEW, UPSTREAM_GUIDE, PROTOCOL §§0–16 and 20, the expansion protocol, the complete issue, the previous review and the revision handoff. Read the current upstream LocalGaloisGroups and OperatorTheory/PrincipalAngles READMEs as form comparisons, and the relevant supplier statements. Compared every one of the accepted packet's 157 targets, all 247 API entries and the 43 definition/construction interfaces with the package. The packet itself was not edited.

| Requirement | Result |
| --- | --- |
| Upstream form | Pass. Summary, ownership, conventions, exact supplier contracts, eight layers, prose targets, API outlines, Checks, examples and prerequisites follow upstream form. The README is 244,602 bytes. The issue's older 200 KB cap is superseded by PACKAGE_REVIEW's 12 October rule: preserve full detail; README length is secondary. |
| Fidelity and closure | Pass after the mathematical corrections below. All 157 unique anchors and 247 API names remain. All 418 internal target links resolve; the prerequisite graph is acyclic and has no edge to a later layer. External dependencies are existing Tau Ceti roadmaps, lower-tier packages or the Global/Local deformation bundle. Supplier extensions are stated explicitly, not inferred from a similar library name. |
| Sources and own words | Pass. Independently opened all 15 randomly sampled sources at the specified locations and resolved the flagged Kisin PST/BCDT pagination against public author copies. The README is organized by constructions and dependencies, with original prose and exact locators, rather than by sections of individual papers. |
| No process in the roadmap | Pass. Review findings and packet discrepancies are recorded here and in the handoff, not as programme narrative in the README or Lean. |
| Suggested Lean | Pass. 472 lines; 15 real-bodied definitions, one real-bodied abbreviation, ten theorems and 37 examples. No sorry-defined carrier, arbitrary substitute carrier or theory development. Final elaboration exits 0 with 19 warnings, all `declaration uses sorry`. |
| Metadata | Pass. Exactly `topic = "math.NT"` and a newline. |

The five earlier revision groups have been resolved in the form required by the newer rule:

1. Heavy universal rings, coefficient categories, period objects and moduli spaces are full README targets with APIs and tests. They are absent from typed Lean when their carriers are unavailable at the pins. A short closing comment now names every heavy definition/construction interface, including `liftFunctorΛ` and the qualified ΦΓ rings. Reintroducing sorry-defined carriers to satisfy the older review would violate the current rule.
2. The README specifies the complete DVR, residue identification, natural topology, continuity and Φ_p assumptions. It rejects the countable product of C_p as a representability test. Generalized coefficient fields carry their actual field data, and G-valued lifts use a smooth affine group functor with coefficient compatibility.
3. Framing, coefficient extension, determinant twisting and completion comparisons retain their actual maps and isomorphisms in the README. The light Lean statements have separate, narrower names and do not pretend to supply those constructions.
4. Universal ordered characters, the extended weight algebra, descent image and KW determinant/quotient-character/monodromy choices are explicit. Nonreduced determinant-ordinary equations retain every ordered product.
5. Examples test actual objects or equations. This review further replaced weak descriptions of flag images and finite-flat model spaces with computed witnesses, and added trace and GL₃ sign controls in Lean.

## Corrections made in this review

### Determinants and ordinary conditions

- **1.6:** A Fontaine–Laffaille jump gives a labelled Hodge–Tate weight, not a general decomposition of inertia into cyclotomic characters. Restricted the inertia dictionary to rank one over ℚ_p. Replaced the good-reduction elliptic example with the split representation 𝒪⊕𝒪(ε⁻¹), and retained the dual outside the chosen filtration interval as a negative control.
- **1.10:** Stated that the determinant component bounds are relative dimensions over 𝒪; integral dimension has one additional dimension.
- **1.18, 1.20, 1.24, 3.4, 5.2, 5.6, 5.7, 5.13, 8.2, 8.11:** Replaced inappropriate dependencies on the p∤d integral scalar-splitting theorem with the bundle's general fixed-determinant quotient. The rational power-map comparison remains available when p divides d. Retained 1.10 where its odd-prime/rank-two or explicit p∤d assumptions do apply.
- **2.16 versus 2.23:** Re-read Calegari–Geraghty §8.5.1. Its fixed-unramified-determinant tangent count uses scalar inertia on both blocks, with ψ_Aψ_B^(d−1)=1, and p>d≥2. The later BCGP block condition instead makes the complement unramified. These are different conditions. Removed the false dependency identifying them and added the d=1 failure and d=2, p=5, q=11 determinant-one inertia witness.
- **5.2:** Specified the unramified determinant factor, unit-class H¹_f, crystalline point criterion and exact split-distinct residual exception from Kisin's dyadic calculation. A semistable Tate-curve extension satisfies an upper-triangular shape but fails the required crystalline condition.
- **6.16:** Restricted the scalar/trace-zero direct-sum description to p∤d; retained the general liftability, tangent dimension and framed smoothness assertions.
- **8.6:** Corrected the unframed fixed-determinant tangent to the kernel of trace in H¹(ad), intersected with the category condition. At p|d, H¹(ad⁰) can contain a strict coboundary: for Schur rank two in characteristic two, the connecting class δ(1) is nonzero in H¹(ad⁰) but zero in H¹(ad). Added this counterexample and a compiled trace computation. The formula using H¹(ad⁰) remains valid under scalar splitting.

### Definition tests and source corrections

- **1.9:** Added a nonsplit ε⁻¹-by-1 extension distinguishing flag order. An unramified ℤ₃-lift with Frobenius `[[1,6],[3,1]]` and polynomial `(T−1)²−18` has a geometric flag but no ℚ₃ or integral flag. Its determinant is −17 and its residual representation is trivial.
- **2.3, 2.9, 2.20:** Made strict-conjugacy, flat-closure and rigidity tests concrete. These use a non-diagonal strictly conjugate unramified lift, the quotient 𝒪[[X]]/(ϖX) and the unit 1−q for q=2, p=5, respectively.
- **3.8:** Qualified the unramified quadratic twist test to exclude self-twists. An inertia-irreducible M and its quadratic unramified twist have equal determinant and inertia but distinct full WD parameters; induction from the unramified quadratic extension is a negative control where a self-twist can occur.
- **4.1, 4.5, 4.9:** Added μ_p/constant models, the compatible p-divisible system, uniqueness over ℚ₅, two distinct models over ℚ₅(ζ₅), and a closed ℙ¹ model fibre with six 𝔽₅-points. A generic-fibre isomorphism does not assert an integral isomorphism.
- **6.5:** Added a ramified finite character of GL₁ with weight zero that fails the inertia equation despite automatic containment in a Borel.
- **6.7:** Computed m=1 for 𝒪=ℤ₃, n=2, and specialized the eigenvalue algebra to 𝔽₃[β]/β². This is free of rank two, with a nonzero nilpotent, and is not a product of two fields.
- **6.21:** Independently checked the inherited corrections to LLHLM Tables 3–4 against (3.14) and the matching calculation. The γαγ coefficient remains **−1−b′+c′**. The change of variables on arXiv v4 p. 47 gives this sign; the printed alternative differs by `2c′33c′*11d′22`. Added the change-of-variables derivation and three discriminating checks. The 𝔽₇₉ example computes zero for the corrected coefficient and 63 for the alternative; its constant calculation is also compiled in Lean. This is a mathematical correction to the table, not a transcription of the printed defect.
- **Kisin PST and BCDT:** Removed reliance on unverified journal-page offsets. All affected locators now use the directly checked public author manuscripts. In 3.7, (2.7.5) is setup, not the point theorem: the comparison is derived using Theorem (2.7.6), Corollary (2.7.7), Proposition (2.7.2) and finite-flat coefficient base change from R03.1.

## Independent source sample

Selected 15 nodes uniformly without replacement using `random.Random(7938).sample(packet["nodes"], 15)`. The table identifies the source actually inspected for each target; it does not claim a fresh read of every source in a multi-source bibliography entry. All statements below are paraphrases.

| Target | Public source and locator actually read | Finding |
| --- | --- | --- |
| 4.4 | [KW II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Lemma 3.8, author p. 30 | Preparation follows removal of the common uniformizer factor. Retained the zero-vector and nonzero-residue qualifications. |
| 3.7 | [Kisin PST](https://people.math.harvard.edu/~kisin/dvifiles/def.dvi), Proposition (2.7.2), pp. 22–23; Theorem (2.7.6), Corollary (2.7.7), p. 23 | Replaced the setup-only citation; identified the additional flat base-change step. |
| 1.21 | [FKP](https://arxiv.org/pdf/2008.12593v5), Appendix B, Definition B.2, p. 52 | Split connected reductive group, canonical torus, all embeddings and fixed extension F′ are part of the lift condition. |
| 2.8 | [CHT](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), Corollary 2.4.21, p. 46; Lemma 2.4.22, p. 47 | General minimally ramified dimension and special prime-to-p inertia description are distinct. |
| 1.4 | [Gee](https://arxiv.org/pdf/2202.05818v2), Corollary 3.12, Lemma 3.13, p. 13; Corollary 3.14, p. 14; [Kisin notes](https://people.math.harvard.edu/~kisin/notes/notes.pdf), (1.3.1)(2), p. 3 | Relation-space direction, framed cocycles and the unobstructed conclusion agree. |
| 1.16 | [BIP](https://arxiv.org/pdf/2110.01638v2), Proposition 3.33, equations (21)–(22), p. 26; [PQ](https://arxiv.org/pdf/2404.14622v2), Lemma 3.1, pp. 22–23 | κ topology/cohomology and relative determinant presentation remain explicit; p|d is allowed. |
| 7.3 | [ACC+](https://arxiv.org/pdf/1812.09999v2), §6.2.6, p. 139 | Character descent uses an injective coefficient map; comparison gives a surjection onto the reduced flag image. |
| 6.21 | [LLHLM](https://arxiv.org/pdf/1608.06570v4), (3.14), p. 43; matching, p. 47; Table 3, pp. 53–54; Table 4, p. 55 | Retained corrected rows, independently derived γαγ sign, added explicit positive/negative controls. |
| 6.6 | [Caraiani–Newton](https://arxiv.org/pdf/2301.10509v3), Proposition 5.3.2, pp. 75–76 | Trivial residual, μ_p in K, determinant ε⁻¹, dimensions and the two ordinary components agree. |
| 1.20 | [PQ](https://arxiv.org/pdf/2404.14622v2), Proposition 3.6, p. 24; Corollary 3.12, Proposition 3.13, p. 26; [BCGP21](https://arxiv.org/pdf/1812.09269v3), Proposition 7.4.2, p. 189 | Relative Lie-kernel presentation and central quotients retain hypotheses; fixed-similitude smooth ring has ten variables. |
| 6.23 | [Clozel–Thorne](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf), §5.1, accepted manuscript p. 39 | Partition conditions and smooth pure-point/component interface are the intended rank-n extension. |
| 2.2 | [Gee](https://arxiv.org/pdf/2202.05818v2), Definition 3.36(1), Theorem 3.38(2), p. 21; [CHT](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), Definition 2.4.14 and following remark, p. 43 | Gee's fixed-determinant rank-two statement alone is not the general-rank theorem. General Frobenius lifting gives d² variables. |
| 2.22 | [BCGP21](https://arxiv.org/pdf/1812.09269v3), Proposition 7.4.7, pp. 189–190; Proposition 7.4.21, p. 197 | Dimension eleven, generic-point uniqueness and the completed unrestricted similitude matrix ring agree. |
| 6.3 | [CHT](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), §2.4.2, pp. 37–38 | The decreasing-flag cyclotomic exclusion is χ̄_j/χ̄_i, not its inverse. Retained the package's correction and obstruction witness. |
| 5.2 | [Kisin 2-adic](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi), (2.4.1)–(2.4.6), pp. 30–33 | Corrected unramified ψ, crystalline H¹_f points and the precise split-character exception. |

For the author-flagged unverified pagination, additionally checked **every Kisin PST occurrence**: §1.2 pp. 4–5, Proposition 1.3 p. 5, Corollary 1.5.1 p. 7, Proposition 1.6.4 pp. 8–9, Corollary 1.7 pp. 9–10, Proposition 2.4.7 p. 16, Proposition 2.5.4 p. 18, Theorem 2.5.5 pp. 19–20, Lemma 2.6.1/Corollary 2.6.2 pp. 20–21, §2.7 pp. 21–23, §3.1/Propositions 3.1.2 and 3.1.6 pp. 24–27, Lemma 3.2.1/Proposition 3.3.1 pp. 27–29, Theorem 3.3.4 pp. 29–30, Theorem 3.3.8 p. 30, and Errata E.4 p. 34. Read [BCDT](https://math.stanford.edu/~conrad/papers/tswfinal.pdf) §1.1 pp. 7–8 and §4.3 pp. 27–28. The bibliography now specifies these editions without an approximate page-offset rule.

Additional issue-driven reads were Kisin's finite-flat Proposition 2.5.15(2), author pp. 48–49; Calegari–Geraghty [§8.5.1](https://arxiv.org/pdf/1207.4224v2), pp. 81–82; CHT Lemmas 2.4.27–2.4.30, pp. 51–53; and the finite-flat/sign supplier passages used by the amended examples. The public copies, source fingerprints and exact new locators are recoverable from this report and the handoff. No source passage or restricted file was placed in the repository.

## Adversarial mathematics pass

Read every statement, identity, convention and Check, including the targets whose full carriers are README-only. The following table covers every target; ranges mean each target in the range was inspected with the indicated boundary or counterexample. This checks statements against failure modes and source hypotheses, not proofs of all research theorems.

| Targets | Instances and failure modes inspected | Outcome |
| --- | --- | --- |
| 1.1–1.5 | d=1, trivial residual group, non-Schur data, ∏ C_p; H²=0; relative versus absolute dimension | Φ_p, continuity and Schur hypotheses retained; obstruction surjection has the correct direction. |
| 1.6 | p=2 empty strict interval; repeated jump; split ε⁻¹⊕1 and its dual | Fixed the false general inertia dictionary; multiplicity-one and unramified K remain essential. |
| 1.7–1.9 | Rank-one character equality; zero weight; u versus u+3; ordered nonsplit extension; irreducible quadratic Frobenius over ℚ₃ | Distinguished Hodge/ordinary order, lattice height and geometric flag image; strengthened tests. |
| 1.10–1.14 | p|d; real identity versus odd diagonal; characteristic-two unipotent; trace-zero nilpotent | Integral splitting restricted to p∤d; dimensions clarified; no division by two in the quadric. |
| 1.15–1.18 | Finite κ, characteristic-zero κ, k((t)); arbitrary topologies; smooth affine group versus unstructured matrix subgroup | Coefficient data, residue kernels and natural topologies are explicit; corrected fixed-determinant dependency. |
| 1.19–1.24 | Rank one and local roots of unity; zero Lie kernel; GSp₄ dimensions 11/10; torus weights; rank-one ΦΓ modules; d divisible by p | Retained torsion character factors, relative presentations and rational power-map comparison; fixed dependencies. |
| 2.1–2.4 | Wild versus tame inertia, q=1 formal relation, rank one, unramified residual scalar matrices | No assertion that full tame inertia is ℤ_p; unramified framed d² count and minimal functor differ. |
| 2.5–2.6 | Φ=diag(2,1), σ unipotent; Φ=I; zero/noninvertible inertia | Arithmetic exponent direction fixed; Steinberg identity fails at I for q=2; continuity remains additional data. |
| 2.7–2.11 | Zero and regular nilpotent; p=3; q=1 and q=2; finite Taylor–Wiles group algebra | Modified cubic coefficient is formed in ℤ before reduction; 2 invertible and N⁴=0 remain explicit. |
| 2.12 | Both parity branches; x₀(2+x+y)=0 with unit second factor; monodromy dropped | Odd-parity mixed equals unramified; ramified dimension is N²−1. |
| 2.13–2.15 | Zero type quotient, reducible lift, p dividing rank, distinct inertial characters | Nonzero/flat/component hypotheses retained; no blanket domain assertion. |
| 2.16–2.17 | d=1, d=2 at p=5,q=11; fixed determinant; four distinct paired GSp₄ eigenvalues | Corrected two-scalar inertia condition; excluded rank one from the extra tangent count. |
| 2.18–2.19 | Same inertia, distinct N; p=2 versus odd p; scalar residual Frobenius | Full type and its flat closure remain distinct; odd-prime rank-two hypothesis retained. |
| 2.20–2.24 | q=2,p=5, residual I; q≡1; unramified complement with ramified determinant; unique generalization | Made rigidity induction concrete; removed 2.23's false dependence on 2.16; kept each block condition's determinant data. |
| 2.25–2.30 | U/P/H ramification, rank-one reference, regular unipotent N; p=2; equal-characteristic local field | Multiplier, purity, smooth-centralizer and root hypotheses retained; no blanket use of odd-prime exponential formulas. |
| 3.1–3.3 | Filtration profiles [1,1,1], [2,1], [3]; h=0; N=0; empty Hodge type | Flag dimensions 3,2,0 are distinct; scalar filtration dimension zero does not identify the Hodge type. |
| 3.4–3.7 | Empty quotient, finite nonreduced E-algebra, finite ramified coefficient extension, nilpotent generic fibre | Point criterion distinguished from reduced flat closure; replaced setup citation and named the base-change proof inputs. |
| 3.8 | Empty block; quadratic self-twist; p=2,3,≥5 centre comparison | Qualified full-WD twist witness; retained δ_Mε determinant and all integral qualifications. |
| 3.9–3.14 | d=1; Δ=0; repeated jumps; fixed determinant p|d; nonregular type; ordinary versus crystalline | Dimension claims use nonzero rings and the appropriate generic/relative convention; no integral p∤d split used at p|d. |
| 4.1–4.4 | μ_p and constant group, compatible p-divisible tower; nodal special fibre; zero vector; series divisible by ϖ | Strengthened finite-flat tests; remove common ϖ-power before preparation. |
| 4.5–4.9 | e=1<p−1, e=p−1, p=2; two models over K containing ζ_p; six-point ℙ¹ fibre | Strict uniqueness range and generic/integral distinction retained; local-model hypotheses do real work. |
| 4.10–4.15 | Connected generic versus closed fibre, ordinary/nonordinary, distinct versus equal residual characters, μ_p∉K, tame/odd-p generic reducedness | No arbitrary fixed-(d_m,d_et) connectedness claim; component theorems retain the stated local-field and supplier assumptions. |
| 5.1–5.3 | Connected versus étale object at p=2; Tate-curve extension; unramified ψ; two mod-two involutions | Fixed the crystalline ordinary point criterion; connected dyadic restrictions retained. |
| 5.4–5.7 | k=p−1,p,p+1; ℚ_p versus larger unramified K; p=2 residual homothety; dihedral determinant correction | Endpoint inputs are explicit; no extrapolation from strict Fontaine–Laffaille range or integral determinant splitting. |
| 5.8–5.14 | Zero étale quotient; determinant unit; generic closed immersion; residue degree one; trivial residual action | Open-and-closed connected part, dyadic smoothness and component hypotheses remain scoped; fixed general determinant dependencies. |
| 6.1–6.2 | d=1; coinciding characters; χ=ω, ω=1; cyclotomic obstruction; split non-Schur residual data | Versal/universal distinction and exceptional relation counts retained. |
| 6.3–6.6 | Reversed χ-ratio; rank-one discrete series; torus with ramified inertia; trivial residual data over ℚ_p versus K⊃μ_p | Correct decreasing-flag ratio retained; added GL₁ failure; Snowden's two components require μ_p⊂K. |
| 6.7–6.8 | ℤ₃,n=2; β²=0 over 𝔽₃; common minimal prime; two components meeting | Rank-two eigenvalue module is not a product; connection is not generally transitive at intersections. |
| 6.9–6.13 | Identity shape; nonprincipal tame type; scalar filtration; partition (d) and (1,…,1); small versus endpoint torsion weights | Descent data, dual type, genericity, reduced-flat form and finite-local-algebra flag criterion retained. |
| 6.14–6.18 | Dual finite-flat normalization; trace splitting at p|d; repeated eigenvalue; quotient by a regular sequence | Restricted 6.16 splitting; type-three/non-Gorenstein conclusion uses the actual eight-variable presentation. |
| 6.19–6.21 | n,m at endpoints; identity matrix determinant; first versus second factor of γαγ; 𝔽₇₉ sign witness | Kept induced character data; independently verified corrected GL₃ matching relation and added three tests. |
| 6.22–6.25 | Pure versus nonpure point; partitions; collision locus; unframed versus flag image | Smoothness/components retain purity and degree hypotheses; no equality of all unreduced rings. |
| 6.26–6.29 | a=2 and dual twist; Borel versus parabolic; dimensions 6,4,2,1,0; p=2 weight components | Correct fixed multiplier and duality conventions retained; explicit GL₃ rings have no invented map to the type ring. |
| 6.30–6.33 | Zero type ring, length 0/1 versus ≥2, 5/10-genericity, distinguished versus nondistinguished flag point | Weak patching existence/support is an actual local target; regularity transfers to image only under its stated hypotheses. |
| 6.34–6.35 | Borel/diagonal/P dimensions 16/14/15; simultaneous H² exceptions; finite-flat twist; weight-space dominance | No blanket flatness or complete-intersection special-fibre assertion in the double exception; dominance remains a hypothesis. |
| 7.1–7.2 | Z/9 matrices M=diag(4,7), U unipotent; rank one; arbitrary coefficient ring | Same characteristic polynomials but (M−I)(U−I) has entry 3; ordered products cannot be omitted. Finiteness is over the image ring. |
| 7.3–7.4 | Noninjective coefficient map; repeated versus distinct characters; field versus integral algebra | Kept injective descent and reduced comparison; ordered triangularization theorem is a field theorem. |
| 7.5–7.6 | Torsion unramified quotient, characteristic-zero localization, collision characters and degree threshold | J=I is an annihilator identity; comparison over the distinct-character open is topological/reduced, not an integral isomorphism. |
| 8.1–8.4 | Empty resolution; proper map versus local smoothness alone; p=2 endpoint; XY−πu with π=0 or a unit | Retained algebraization/injectivity hypotheses; nodal domain requires nonzero nonunit π and unit u. |
| 8.5–8.6 | Unit versus uniformizer Kummer class; missing V⊕V; Schur d=2,p=2 | Fixed-determinant strict tangent uses trace kernel in H¹(ad); category quotient arrow direction is R^T→R^S. |
| 8.7–8.10 | Identity mod 2; selected versus both residual ordinary lines; inertia-rigid ring with multiple components; residual unramified quotient absent | Domain/normality/smoothness kept separate; existence statement retains its residual shape. |
| 8.11–8.14 | q≡−1, v₂(q+1)=1 versus ≥2; q=2,p=3; fixed γ; dual weight-two convention | Dyadic character parity and coefficient extension retained; fixed γ adds no free unramified variable. |
| 8.15–8.19 | Endpoint p+1, dyadic Serre weights 2/4, zero type quotient, completed tensor of real and p-adic rings | Monodromy distinguishes dyadic branches; nonemptiness is a separate target; relative dimensions 2+4=6 use the actual completed tensor product. |

## Pins, ownership and ten Lean signature checks

Read the reviewed library audit: no LocalGaloisDeformationRings-specific reviewed entry was available; the relevant completed local algebra and representability audits were consulted. Independently read all nine baseline declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: `MvPowerSeries`, `ProfiniteGrp`, `Module.Finite`, `IsAdicComplete`, `IsLocalRing.ResidueField`, `Matrix.symplecticGroup`, both named Weierstrass declarations and `TauCeti.ContCohomology.H2`. H² is an additive quotient at the pin; neither κ-linearity nor local duality follows from that carrier.

Compared targets by mathematical object with current upstream roadmaps and Completed roadmaps at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read relevant finite-generation, full-tame, Kummer, determinant, relative-group and symplectic interfaces. Added the current `ClassFieldTheory/Local/Duality/FiniteModule` finite-module bijectivity declarations to the ownership boundary. They supply finite discrete Tate duality, not all natural-topology κ comparisons. No retained target duplicates that theorem; no further target removal or renumbering was necessary.

The earlier downward moves remain in force: target 3.8 owns the local block-centre/full-WD comparison formerly assigned to higher p-adic local Langlands, and 6.30 owns the scoped GL₃ weak minimal patching input. General global patching is not moved. The handoff preserves these consumer-routing instructions. No FoundationsAndLibraryIntegration stage or UPSTREAM marker remains.

| Lean signature inspected | README agreement and limiting hypotheses |
| --- | --- |
| `HasHeightLE`, `height_zero_iff_isUnit` | Fixed free matrix condition; square matrix over a commutative ring; not the geometric lattice functor. |
| `OddInvolutionEquation`, `odd_involution_matrix_iff` | Both involution and determinant equations; characteristic two allowed; no division. |
| `IsTameMatrixPair`, `SteinbergFrobRelation` | Invertible matrices and arithmetic q direction; continuity/profinite quotient remains a separate heavy target. |
| `modified_exp_log_inverse` | Both fourth-power nilpotence assumptions and invertibility of 2 occur in the type. |
| `modified_exp_pow` | Cubic coefficient is integral before coefficient-ring reduction; no inverse of 3 is assumed. |
| `filtrationFlagDimension` | Multiplicity-list dimension only; labels and jump values are explicitly not forgotten by the Hodge-type construction. |
| `Connects`, `connects_trans_of_unique_component` | Actual minimal primes; uniqueness at the middle point, not automatic transitivity. |
| `identity_frobenius_determinant_coefficients` | Actual polynomial matrix; both coefficients 2 and 3; cubic determinant term retained. |
| `ordinary_eigenvalue_equation_iff` | Rank-two determinant one, β=α−1, trace shift; valid over a commutative coefficient ring. |
| `det_ordinary_iff_ordered_triangularization` | Field coefficients, positive rank, injective character function, all characteristic-polynomial and ordered-product equations. |

Also inspected `nodal_ring_flat_domain`: complete DVR, π nonzero and nonunit, u a unit. Its π=0 and unit-constant negative controls distinguish zero divisors from the zero ring. No general-DVR theorem was replaced by a ℤ_p-only signature.

## Validation and remaining work

- Final `lean-check` at the pinned Mathlib: exit 0; zero errors; 19 warnings, all for `sorry`. Only Mathlib is imported. More than 20 GB was available; checks were serial, with no language server or Lake build/update/cache invocation.
- `python3 scripts/check_blueprint.py research/blueprint/packets/LocalGaloisDeformationRings.json`: exit 0, zero errors and warnings; 157 nodes, 247 API items, 162 packet tests. This is validation of the unchanged input, not a declaration that its historical notes were synchronized.
- Inventory: every API name occurs under the stated namespace convention; all 43 primary definition/construction names occur in Lean or its closing comment; 47 Checks blocks, each with at least three bullets. New mathematical tests and narrower corrected hypotheses supplement the packet's tests.
- Intake `check-files` on the package deliverables, review report and handoff: zero problems. `git diff --check`: clean. Metadata parsing, internal links, layer order, placeholder, process and private-path checks pass.

No unresolved package defect remains from this review. The accepted packet still has ten historical gaps and 22 requests, including supplier theory that is planned rather than implemented. Their exact contracts remain visible in the package. The reviewer did not mark them discharged or edit implementation statuses. A future authorized packet synchronization should carry back the source, tangent and Taylor–Wiles corrections listed in the handoff; this package-only issue does not authorize that mutation. No scratch artifact is needed to use the package or resume its upstream port.
