# Independent package review: K-theory of finite and local fields

Issue #11235; job `REV-PKG-KTheoryFiniteLocalFields~codex`; Codex,
session `codex-OSCajf`; 19 October 2026. Verdict: **needs_changes**.

This is the completed independent review after #11184, starting at atlas
commit `706a65a05dca5c9fe34aeebb10cefd79752de01e`. I did not write the
package or its preceding fixes. I read the complete package, the accepted
280-node packet, the previous adversarial review and both fix handoffs.
The packet and programme-order files are unchanged.

## Verdict

The first six prerequisite defects from the previous review now have explicit
targets or checked supplier exports. The finite-field/hermitian dependency
cycle is resolved by the authorized GeneralAlgebraicKTheory export. The
suggested file obeys the carrier rule and elaborates. Two concrete defects
remain after the corrections in this review:

| Finding | Exact evidence and affected consumers | Required completion |
| --- | --- | --- |
| R1: supplier order is still unassigned | `CaraianiNewton.md` assigns no tier or bundle to KTheoryFiniteLocalFields, RefinedTraceMethods, MotivicEtaleKTheory, K2SymbolsBrauer or HermitianKTheoryOfPoincareCategories. None of these five is on the inspected upstream main. RefinedTraceMethods' genuine/modern cyclotomic foundations and relative trace theorem feed §§4.1–4.8,5.16–5.17; MotivicEtaleKTheory §§1.5–1.6,4.4,6.6,7.4–7.5,8.1–8.7,10.3–10.6 feed §§3.3–3.4,6.6,6.10–6.11. The package also consumes K2SymbolsBrauer Layers 2–4/7 and HK.0–1/HK.7. These are atlas contracts, not existing upstream roadmaps or an authorized bundle. | The maintainer must register an earlier supplier order, a bundle or an authorized split of these contracts. The issue authorizes #1212 §§13.8a–c, not a programme-order change. Moving all the general cyclotomic, motivic and hermitian theories into this package would duplicate their owners and is not a clear local repair. |
| R2: the multiplicative hermitian supplier is missing | Packet target `L.1/finite-even-multiplicative-l-tate-comparison` was absent from the README. I restored it as `finiteEven_multiplicativeLTate` in §1.7, with the exact required general E∞ refinement of Ξ stated under supplier contracts. CDH III Remark 3.1.5, p.51 explicitly attributes this refinement to Paper IV. GN #851 §6.8a supplies the underlying spectrum square; its `finiteEvenFieldHomotopyLimit` does not supply the general E∞ map. HK.0–1/HK.7 do not state that export either. GN's `genuineLTheoryModule` is a different module contract. | Assign and source the natural E∞-ring map Ξ for commutative rings, including products and units, in the general hermitian owner; then cite that exact export for §1.7. This review does not certify an unread Paper IV construction. The ordinary finite-even spectrum equivalence does not settle the restored ring target. |

These findings concern prerequisite closure and fidelity, not the absence of
proofs of planned theorems. The existing 39 source-proof gaps are not silently
closed. ArithmeticGaloisDuality is **not** an unregistered supplier: it has the
Tier 8 bundle and upstream PR #858. CrystallineCohomology has Tier 9 and #857;
GeometryOfNumbersAndQuadraticArithmetic has Tier 3 and #851. Their presence
does not assign an order to this package. The #851/#1212 finite-field edge is
now directed from #1212 to #851 and then to the applications here.

## Corrections applied

- Restored the finite-even multiplicative target, its degree-two invertible
  generator, unit and inverse-product checks. Marked its missing general
  supplier rather than inferring ring compatibility from a spectrum
  equivalence. No finite-field computation was weakened or removed.
- Made §0.5's residue hypothesis precise: characteristic different from p
  and an isomorphism on the p-primary root groups. For p=3,b=1, reduction to
  F7 satisfies the order-three condition; F19 has nine such roots and does
  not. This also excludes residue characteristic p.
- Corrected HM03 Theorem 6.1.10's locator to pp.103–104; the statement starts
  on p.103. Corrected CMM 4.36 from “Corollary” to “Theorem,” and DM 8.10
  from “Proposition” to “Theorem,” in both its use and reference entry.
- Read and refreshed compatible supplier heads: #1212 to
  `e25a1fe493e4aafe1dcd177fe8c6a7981c4f8901`, #1227 to
  `9cfa5854c4fb8f0499149bd3c940d455522390e2`, and #1229 to
  `900144ae62e309634ae4bc61c1c7fffb0268beba`. The consumed sections retain
  the stated contracts. #1142 remains at
  `4c951ced56bd5eaeae86ca3d2a474c503cc3ab40`; #851 remains at
  `01c64f0cc5f154a3d190697951ead2fffc2af693`.
- Named DerivedModuleAlgebra §1.T.1 as the existing owner of countable
  abelian lim/lim¹ and Mittag–Leffler theory. StableHomotopyKTheory §7.9
  supplies its spectral application, rather than a second abelian theory.
  Pinned this and the GeneralizedCohomology, étale-foundation and Popescu
  contracts to inspected upstream main
  `29036506c60139c6fd776ad4cf811f3967f9b240`.

Suggested.lean and metadata.toml required no edits. The README retains all
mathematical detail; its size is governed by the 12 October shape rule,
which supersedes the stale 200 KB sentence in the generated issue.

## Disposition of the earlier seven findings

| Earlier finding | Independent check of the current repair | Disposition |
| --- | --- | --- |
| Completion and Adams operations | #1212 §§13.8a–c explicitly supplies integer Adams operations, finite-group KU completion, virtual Brauer lifting, stable Frobenius/plus comparison and the group computation. §§0.1–0.2 separately plan compact-kernel lim¹ and completed unit operations. The trivial group has discrete rank Z; the C2 augmentation ideal has I²=2I. | Mathematical prerequisite targets present; #1212 is expressly authorized. |
| Multiplicative Eilenberg–Moore | §0.3 states the actual pullback theorem, field coefficients, simply connected base, degreewise finite type, bar comparison, products, edges and convergence. It is not attributed to a generic exact-couple theorem. | Repaired at roadmap level. |
| Absolute logarithmic Witt theory | §5.2a constructs the absolute initial object, level-one comparison and standard filtration for prelog Z_(p)-algebras at odd p. CR.4.6's relative W-linear theory is distinguished explicitly. | Repaired; the logarithmic extension still has a future proof, not a falsely verified nonlog proof. |
| Early Chern and Lang comparison | §§1.8–1.9 contain universal classes, Moore-Hurewicz/slant, the signed factorial comparison, Lang torsor, classifying comparison and transgression. Actual upstream étale projective-bundle/Kummer geometry is an input. Motivic Layer 11's real-place theorem is downstream of rigidity and is not imported into these targets. | Earlier cycle repaired; R1 still applies to later motivic consumers. |
| Geisser–Levine and approximation | §5.17 separately states p-torsion-freeness and the logarithmic higher-K comparison. Actual upstream SchemeAndStackFoundations §0.15 supplies Popescu for regular maps of noetherian rings. Approximation occurs at finite Witt length before inverse limits. | Repaired at target level. |
| Space-level local splitting | §§0.4–0.5,6.12 now include height-one localization/realization, Burnside completions, root retraction with both homotopies, multiplicative cancellation, local Iwasawa calculation, spectrum realization, positive cover and valuation fibre. The end splitting is not its own prerequisite. | Proof chain present; locator and root hypotheses clarified here. |
| Authorized supplier order | Checked the order file, actual upstream main and named supplier PRs. #1212→#851 removes the formerly alleged hermitian cycle. The remaining atlas-only contracts have no authorized route. | R1 remains; R2 is the distinct missing multiplicative export found in this review. |

## Sources: the 39 flagged boundaries

I opened the public sources and read the indicated statements and the relevant
surrounding arguments. This ledger separates a checked statement or secondary
locator from an independently read original proof. In particular, an author
attribution to another paper is not counted as reading that paper. All prose
below is original; no source passages are reproduced. Abbreviations and fixed
versions are those in the package's References. HM03 pages are its author
version; K-book PDF pages are printed pages plus eight.

| Packet gap | Reading and locator checked | Consequence for this package |
| --- | --- | --- |
| 1. Stable defining-characteristic acyclicity | Haine Theorem 5.8 p.9; K-book IV.1.12 p.269 (PDF277); #1212 §13.8b. | The authorized supplier actually states stable mod-p acyclicity. Finite GL2(F2) is not acyclic; the original Quillen proof is not certified here. |
| 2. Two-primary cohomology comparison | Haine's cohomology/Quillen statements pp.9–11; exact #1212 §13.8b scope. | Its all-primes export is used. The odd-prime exterior-algebra proof is not silently extended to two. |
| 3. Quillen detection | Haine §§5–6, especially Theorem 5.8 and Construction 6.11 pp.9–11; Mestel Theorems 19–20 pp.15–16. | Detection and rational comparison are explicit #1212 exports; this is not a new proof of all original detection lemmas. |
| 4. Green integrality | Mestel's Brauer discussion and Theorem 20 pp.15–16; #1212 §13.8b. | Integral virtual lift is the supplied input; an honest complex representation is not asserted. Original Green proof remains unread. |
| 5. KU completion and odd vanishing | Atiyah–Segal Theorem 2.1 pp.3–4 and Proposition 4.2 p.10, read in the scan; #1212 §13.8a. | Finite-group completion plus local compact-tower target, not compactness of the whole representation ring or a discrete ML argument. |
| 6. Multiplicative Eilenberg–Moore | Eilenberg–Moore Theorem 12.1 p.220 and §16 pp.227–230; Mestel Theorem 19 p.15. | §0.3 includes pullback, product and convergence hypotheses, beyond a generic spectral sequence. |
| 7. Exceptional Moore products | K-book IV.2.8, Scholium 2.8.1 and Corollary 2.8.2 pp.281–282; #1227 §§7.28,7.30. | Keep generic exclusions {2,3,4,8} and the additional finite-field refinement separate. Original Browder/Araki–Toda proofs unread. |
| 8. Higher λ/Adams operations | K-book IV.5.5.1–5.9 pp.314–316; #1229 §§6.3.4–6.4. | Exact general-ring representation construction and Hiller lift are stated exports; no split modular representation ring is used. |
| 9. Expository Quillen proof | Haine Definition 6.3 p.10 and Construction 6.11 p.11; Mestel's Theorems 19–20 pp.15–16; #1212 §§13.8b–c. | The connected fibre, stable Frobenius paths and K-group theorem are supplied together. Mestel's entire §§7–9 computation was not rederived here. |
| 10. Rigidity proof | CMM Theorem 1.4 p.3, Theorem 4.36 and Remark 4.37 pp.36–37. | Corrected theorem kind. Henselian pair, Jacobson condition and invertible coefficients are retained. |
| 11. Merkurjev K2 torsion | K-book III.6.6 p.237 and VI.7.3 p.509. | §3.4 retains the independent mixed-characteristic torsion-freeness obligation; finite quotient alone does not prove it. Original 1983 proof unread. |
| 12. Characteristic-p K2 Hilbert 90 | K-book III.6–7 and the explicit characteristic-p target in §3.4. | The source's later Hilbert-90 consequence is not used circularly to prove the torsion theorem. Original characteristic-p torsion/Hilbert-90 proof unread. |
| 13. Moore kernel divisibility | K-book III.6.2.3–6.2.4 pp.233–234 and III.6.7–6.8 pp.238–240. | Full root group, surjectivity and primewise kernel arguments remain separate targets. Original Moore appendix not read. |
| 14. Linear cyclotomic structure | HM03 §1.2 pp.12–15 and §1.5 pp.24–28. | The classical linear construction is a target; a modern spectral-category localization does not replace it without comparison. |
| 15. Additivity/approximation inputs | HM03 §1.3 pp.16–21, Theorem 1.4.1 pp.21–23 and §1.5 pp.24–28. | Read the local proofs and their citations. Original McCarthy, Bökstedt, Waldhausen and TT arguments were not independently reread; specialized target statements remain. |
| 16. Linear dévissage | HM03 Propositions 1.5.1–1.5.4 pp.24–27. | Preserve linear torsion-complex comparison; no false THH(Perf_tors)≃THH(k) substitution. Original Dundas–McCarthy/Dundas proofs unread. |
| 17. Absolute log-Witt initiality | HM03 Definition 3.2.1, Proposition 3.2.2, Addendum 3.2.3 and Lemma 3.2.4 pp.47–49; HM04 introduction pp.1–5. | HM04's ordinary construction does not prove its logarithmic extension. §5.2a now plans that extension and its solution set explicitly. |
| 18. THH of a DVR | HM03 Proposition 2.3.4 pp.38–40 and Remark 2.4.2 p.43; §5.3's use of the quoted ordinary computation. | Lindenstrauss–Madsen original not read. §§5.8–5.9 are proof targets, not source-proof closure. |
| 19. Completed logarithmic THH | HM03 Remark 2.4.2 p.43 and its mod-p calculation. | Keep the Bockstein argument from dκ=κ dlog(−p); no inference from ordinary THH(K). |
| 20. Tsalidis replacement | Nikolaus–Scholze Corollary II.4.9 p.52 in arXiv v2; HM03 Theorem 5.4.3 p.86 and Addendum 5.4.4 p.87. | §5.12 tracks bounded-below geometric fixed points and the finite-coefficient shift. Original Tsalidis proof unread. |
| 21. R/F/V and auxiliary inputs | Hesselholt 1996 Lemmas 1.5.1/1.5.6; HM03 Lemma 5.2.1 p.75; HM97b §3's geometric statement. | At odd p the η correction vanishes. Original cyclic-polytope and cited normal-basis arguments are not certified here. The packet's “Proposition 9.1” attribution is not located in the cyclic-polytope paper. |
| 22. Perfect-field and continuity input | HM97a Theorems B–D p.ii and Appendix B pp.50–52; #1229 §6.4. | §1.5 gives the all-perfect-algebra Frobenius/Adams consequence. Finite-field orders alone do not prove it. |
| 23. General perfect-residue Galois input | HM03 Theorem 6.1.6 pp.101–102; actual ClassFieldTheory finite-field signatures. | §5.15 separately plans the Brauer/residue/Artin–Schreier argument outside finite local fields; finite-field duality is not silently generalized. |
| 24. Twisted TR/regular comparison | Hesselholt05 Theorem 11 PDFpp.30–31 (printed100–101); Geisser–Hesselholt Theorem 3.1 PDFpp.19–20. | The secondary statements are checked. The quoted original representation-graded proposition remains unlocated; §5.17 retains a proof obligation. |
| 25. Space-level homotopy type | DFM §§2–4, especially Theorems 3.5/4.1 pp.8–12; DM §§4.7–4.18 pp.15–17, Theorem 5.4 pp.19–20, Theorem 6.11 pp.25–26, Theorem 8.10/Proposition 8.17 pp.34–36, Theorem 9.1 p.40, §§13.1–13.3 pp.55–56; Thomason Theorems 4.1/4.11 pp.516/520. | Read the root-lifting/retraction and realization contracts; corrected DM 8.10 and clarified root identification. The package now plans the intermediate maps; original Carlsson/Rector foundations are not independently proved here. |
| 26. General-residue cd bound | HM03 §6.1 and §5.15's newly explicit Galois argument. | Infinite perfect residue is distinguished from ClassFieldTheory's finite p-adic field scope. The higher-cohomology vanishing is a named local proof target. |
| 27. Higher-coefficient even splitting | HM03 Theorem A p.2, Theorem 6.1.6 pp.101–102 and 6.1.10 pp.103–104. | Only mod p has the stated natural splitting; higher coefficients retain the natural exact sequence and abstract splitting. No coherent natural splitting is silently assumed. |
| 28. Geisser–Levine | Theorem 1.1 p.460, Theorem 8.1 pp.489–490 and Theorem 8.3 p.491. | §5.17 now owns the higher-K comparison and p-torsion-freeness; Bloch–Gabber–Kato is insufficient by itself. |
| 29. Lang/geometric foundations | AV author/v1 Lemma 2.7.1 and proof pp.16–17, including (2.10); the package's additional Lang target. | Original QuillenICM construction was not independently obtained. Its required fibration/transgression is explicitly planned, rather than assigned to field cohomology. |
| 30. General hermitian structures | CDH II Example 1.2.5 p.20 and Corollary 4.4.13 p.107; III Recollection R.6–R.10 pp.9–10 and Corollaries 1.3.3–1.3.5 p.28. GN #851 §6.8a's actual exports. | GN supplies the general square and symmetric heart comparison. HK has an actual atlas design now, unlike the old gap description; its route still needs R1. |
| 31. Classical finite-field comparison | CDH III Theorems 3.1.1/3.1.3 pp.49–50 and Proposition 3.1.4 pp.50–51. | Classical theorem is connective; full symmetric even-field theorem is supplied by GN. Original Friedlander/Fiedorowicz–Priddy/HKO/BKSØ proofs unread. |
| 32. Hiller at two | CDH III Remark 3.1.6 pp.51–52, K-book IV.5.5.1–5.9 and #1229 §6.4. | General perfect characteristic-two result follows from the explicitly planned Frobenius/Adams argument, not a finite-cardinality calculation. Original Hiller proof unread. |
| 33. Dyadic Witt bound | CDH III Remark 3.1.10 pp.52–53 and GN's exact local Witt input. | Lam VI.2.29 was not obtained; the original is neither freely read here nor in the cleared library index. The finite-exponent Witt input remains explicit. |
| 34. Small-rank multipliers | AV Lemma 2.7.1 pp.16–17, its source correction and the packet's finite-rank target. | Only absence of two-torsion is used. SL2(F9) has multiplier Z/3, so blanket H2=0 is not restored. Original Steinberg computation unread. |
| 35. Early Chern construction | WeibelChern §§2.1–2.8 pp.8–12, Theorems 3.2–3.3 pp.13–15 and Proposition 5.1 p.24. | §1.8 includes the degree-two/even-modulus additivity correction, mixed-product sign and signed factorial; it precedes local rigidity. |
| 36. Cohen/Witt presentation | HM03 (2.2.1) p.33; Sharifi §§6.3–6.4 pp.130–133. | The latter gives finite-local-field inputs, not arbitrary perfect-residue Cohen lifting. §5.2 explicitly plans the general embedding/presentation. |
| 37. Profinite embedding changes | Baker §2 pp.3–4, (2.1); #1212 integer operations. | §0.2 plans continuous completed unit operations; it does not pretend a profinite exponent is an integral BU operation. |
| 38. Connes at two | HM04 discussion following Theorem E p.5. | d²=ηd and η≠0 alone do not witness d²≠0. The false witness remains absent; positive odd-prime statements retain their hypotheses. |
| 39. Popescu | Stacks Theorem 16.12.1, tag 07GC, and actual SchemeAndStackFoundations §0.15; CMM Theorem 4.29 p.33. | General regular-map theorem is already upstream. Finite-length colimits and subsequent pro-zero/lim¹ arguments remain distinct. |

R2 additionally checks CDH III Remark 3.1.5 p.51. That paragraph supplies the
finite-field ring statement and attributes the general E∞ construction; it
does not close the missing general supplier proof.

## Reproducible random sample of 15 other locators

Sample: Python `random.Random(11235).sample(population, 15)`, where the
population is the 358 packet-node source entries remaining after excluding
nodes named in the 39 gaps' `neededBy` fields. Entries retain packet order.
The following are the selected source entries, not a hand-picked replacement
sample. Every selected passage was opened and read.

| Target suffix | Locator checked | Result |
| --- | --- | --- |
| `residue-field-to-witt-mod-p` | HM03 §3.1 p.46, (3.1.3), Proposition 3.1.5 | Equation/theorem distinction and perfect-residue coefficient map agree. |
| `bott-element-in-tr` | HM03 §5.2 p.76 | Root normalization and ramified coordinate conversion agree. |
| `homotopy-orbit-comparison` | HM03 Remark 3.3.4 p.52 | Degree-two term is the cokernel, as the package now says. |
| `thh-resolution-theorem` | HM03 Theorem 1.4.1 proof p.22 | Linear-category replacement and resolution hypotheses retained. |
| `log-de-rham-witt-dvr-divisible` | HM03 Corollary 3.2.7 p.50 | Degree restriction i≥2 and unique divisibility retained. |
| `completion-map` | K-book V.6.8.2 p.413 (PDF421) | Arithmetic completion map, not a quotient definition. |
| `finite-classical-h3-coefficient-comparison` | AV Lemma 2.7.1 proof pp.16–17 | Source's overstrong H2 assertion is not copied; odd-order condition is used. |
| `gamma-hat-mod-p-isomorphism` | HM03 Theorem 5.4.3 p.86 | Isomorphism starts in degree zero; negative degrees not included. |
| `fpsi` | Haine Definition 6.3 p.10 | Connected fibre/path model. Switching 1−ψ and ψ−1 uses inversion, not a silently identical chosen path. |
| `swallowing-lemma` | HM03 Lemma 1.3.10 p.20 | Inclusion of weak-equivalence classes and linear model match. |
| `galois-transfer-formula` | K-book IV.2.8.2 proof p.282 (PDF290) | Degree composite and Galois-sum composite have the correct directions. |
| `even-k-field-splitting` | K-book V.6.9.2 p.414 (PDF422) | Integral even splitting retained; adjacent odd isomorphism starts at i≥2, excluding K1's valuation factor. |
| `h1-of-tate-twists` | K-book VI.7.4.3 p.510 (PDF518) | Free rank and finite twist torsion distinguished. |
| `ring-of-integers-versus-field` | Handbook §5.6 p.165 (PDF27) | p-primary comparison starts at n≥2; K1 is not identified. |
| `tate-cohomology-ring-of-odd-cyclic-group` | HM03 Lemma 4.2.1 p.62 | Odd-prime exterior generator, integral two-primary square correction kept separately. |

## Adversarial mathematics pass

Each row includes the definitions, all named API identities and the Checks of
that subsection. I recomputed the indicated instances and checked the domains,
degree ranges and hypotheses in the surrounding formulas. “Retained” means
no further counterexample found, not that a future proof has been completed.
The source and routing limitations above continue to apply.

| Statements, conventions and APIs | Instances and calculations tried | Outcome |
| --- | --- | --- |
| Coefficient convention and completion | m=1; negative connective degree; K2(Z;Z/2)=Z/4; K2(F3;Z/2)=Z/2 despite integral K2=0. | Retain cofiber and Bockstein, not tensor-only groups or an automatic Z/m-module structure. |
| Boundary, reciprocity and twists | Residue F5: ∂{2,π}=2, ∂{π,2}=3, ∂{π,π}=4; arithmetic Frobenius versus its inverse. | Signs agree with the coordinate and the stated Hilbert-symbol convention. Twists use Galois action, not ordinary tensor powers of Q/Z. |
| TR conventions | n=1 versus n≥2; R-limit turns R into identity; equalizer of id,F. | No lower-level map at n=1; id−F is additive, not a ring homomorphism. |
| 0.1 Compact tower and augmentation API | Solve finitely many recurrence equations backwards; use compactness. C2 gives I²=2I; trivial group leaves rank Z. Discrete Z with ×2 has nonzero lim¹. | Retain compact-kernel proof and constant-rank split; no false discrete ML inference. |
| 0.2 Completed unit Adams API | u=1,−1; weights in degrees two/four are −1,+1 for u=−1; u=ℓ fails to preserve invertible Bott. ℓ=2 has nonprocyclic unit group. | Retain unit and continuity hypotheses; no global integral operation for a general profinite exponent. |
| 0.3 Pullback/Tor, products and convergence | ΩK(Z,2)=S1 has generator of total degree one from (−1,2); identity pullback gives H*(X). Base S1 violates simple connectivity. | Retain degreewise finite type, bar signs and genuine convergence hypotheses. |
| 0.4 Height-one realization and module presentations | Zero module realizes zero; free induced module gives periodic KU piece; a one-relation module requires a cofiber with its degree shift. Finite prime-to-p factor of Zp× cannot be discarded. | Retain full realization, mapping/Ext and cover targets, not a list of group orders. |
| 0.5 Burnside, representations and transfers | G=1 gives Z; H=1 gives A(G); C_p,C_p has p+1 transitive basis classes. A modular unipotent extension has exact class 2 but a different split class. Identity and point-cover transfers give id and multiplication by sheet number. | Retain exact representation ring. Clarified root isomorphism with F7/F19 and characteristic-p controls; two retraction homotopies remain required. |
| 1.1 Coefficients and products | Modulus one; F5 K1 mod4; F3 K2 mod2; Z K2 mod2. Inclusion and reduction at m dividing m' have different Bockstein multipliers. | Retain exact sequence and exceptional Moore-product scope. |
| 1.2 Bott classes | Primitive order-four root in F5; mod-two Bott over Z/Q2 can have order four; characteristic equal to coefficient prime lacks the required primitive root. | Retain specified Bμ lift and Bockstein normalization; no arbitrary UCT splitting. |
| 1.3 Embedding change | Finite eigenvalue groups permit a chosen integer; incompatible choices do not define a global operation. Trivial representation and rank-zero subtraction. | Completed operation uses §0.2; no unqualified integral profinite Adams claim. |
| 1.4 Normalized fibre classes | q=2: π1=0,π3=Z/3; q=5 determinant generator has order four. q=1 would create even homotopy and is excluded. Stabilization adds a trivial line before subtracting rank. | Retain connected supplied fibre and relative Chern normalization. |
| 1.5 Adams, restriction, norm and transfer | F2⊂F4 in K3: restriction multiplies by 5 into Z/15; transfer composed with restriction is ×2 on Z/3, opposite composite is 1+4 on Z/15. K0 transfer multiplies rank by degree; K1 is norm. Imperfect Fp(t) has no pth root of t. | Retain positive-degree and perfectness restrictions; tensor-square uses separability; determinant and K2 are suppliers. |
| 1.6 Algebraic closure and completion | Finite-field characteristic-prime positive groups vanish after completion, but K0 completes to Zp. Coefficient even groups survive away from p. Algebraic closure has torsion in odd integral degree. | Retain integral/coefficient/completed distinction, products and transition maps. |
| 1.7 Hermitian variants | F2 bilinear line is nonzero; hyperbolic plane is Witt-zero. F4 K1=Z/3 disappears only after 2-completion. Surjective Frobenius, not cardinality, handles a perfect infinite field. | Retain arbitrary perfect-field extension and classical connective scope. Restored multiplicative ring target; R2 prevents acceptance of its supplier. |
| 1.8 Universal Chern, slant and edge | Weight one multiplier +1; weight two over F7 mod3 gives the minus sign; weight three over F3 mod2 has factorial zero. In F5 mod2 use a=2, not ζ=−1, whose Kummer class is zero. Q2 Bott has order four. | Retain degree-two even-modulus quadratic correction and mixed integral/coefficient product. No factorial inversion is assumed. |
| 1.9 Lang and finite-rank H3 | Rank one Sp2=SL2 is identity; rank zero has no class. q=3,5 transgressions are 8c2,24c2. Gm Lang map has exponent q−1; disconnected groups fail surjectivity. SL2(F9) multiplier is Z/3. | Retain actual natural edge map, q² Frobenius weight and absence of two-torsion, not blanket H2=0. |
| 2.1 Henselian rigidity | Z5 with modulus four; principal units obstruct characteristic-prime rigidity. Unit ideal is outside the Jacobson condition. | Retain henselian pair and invertibility hypotheses. |
| 2.2 Localization and Bockstein | Boundary of a uniformizer is 1; unit/uniformizer symbols over F5 give inverse answers after swapping. n=0 is not the positive-degree sequence. | Retain left linearity and Bockstein anticommutation. |
| 2.3 Integral torsion and even section | K1 retains a valuation Z; positive even residue K is zero. Changing π by a unit gives zero in the uniquely prime-to-p divisible even group. | Retain i≥2 for odd O→E isomorphism; canonical integral even section is distinct from coefficient sections. |
| 2.4 Coefficient algebra and section change | π=5→10 adds [2] mod4. Four basis classes over the polynomial Bott base versus two over the full residue K-ring. F2 has trivial tame units. | Retain coefficient-dependent section, square correction and Moore-product restrictions. |
| 2.5 Prime-to-p invariants/e-invariant | K1 completion has an extra Zℓ valuation factor; weight zero invariants are infinite; q is an ℓ-adic unit for negative twists. | Retain degree and nonzero-weight restrictions. |
| 3.1 Full norm residue | Exponent d dividing w gives power w/d; equal characteristic has no p-primary roots; choosing a primitive root would change a coordinate, not the canonical map. | Retain map to the actual root group and its compatibility API. |
| 3.2 Tame coordinate and Hilbert sign | Over F5, (r,s,u,v)=(0,1,2,1),(1,0,1,2),(1,1,1,1),(−1,1,2,3) give 2,3,4,4. Uniformizer change cancels c exponents. F2 and zero ring have trivial unit group. | All three general Lean identities and five named controls agree. Hilbert tame component uses the negative exponent of this boundary. |
| 3.3 Kernel and surjectivity | Uniformizer/unit pairs detect tame roots; principal units are needed for wild roots. A split finite quotient does not imply a uniquely divisible kernel. | Retain independent degree-two norm-residue theorem and primewise proof obligations. |
| 3.4 All-prime divisibility | Mixed-characteristic p-divisibility does not imply p-torsion-freeness. In Fq((t)), p-basis dimension one kills two-forms but needs the logarithmic-symbol comparison. | Retain separate Merkurjev and characteristic-p torsion targets; no circular Moore theorem. |
| 3.5 Moore and integer ring | Residue F2 has trivial tame factor; mixed-characteristic roots include a wild factor. Integral O subgroup sees the tame boundary, not all wild torsion as a prime-to-p statement. | Retain full μ(E), unique divisibility and the restricted integer-ring torsion claim. |
| 4.1 Linear Waldhausen THH | Zero category, identity and natural weak equivalence; localizing Zp to Qp changes the mod-p logarithmic answer. | Retain model dependence and symmetric-monoidal compatibility hypotheses. |
| 4.2 TR, TC, R/F/V | First Witt length; finite Fp gives adjacent Frobenius/restriction equations; V is additive transfer. | Retain ring maps R,F, module projection formulas and actual coherent limits. |
| 4.3 Circle operator and HZ-module splitting | Odd p kills η; p=2 does not permit d²=0 from that reasoning. A general Moore cofiber is not an HZ-module. | Retain η relation and actual module hypothesis; no unsupported nonzero-square witness. |
| 4.4 Norm, orbits and comparison | First fixed-point level, zero spectrum, connective logarithmic q-model; arbitrary unbounded cyclotomic object is excluded. | Retain Γ/Γ-hat maps, coefficient action and bounded-below input. |
| 4.5 Tate cochains and products | Trivial cyclic integral module gives even Tate classes; at two the odd generator can have nonzero square. Filtration shift in the 3×3 triangle changes total degree. | Retain odd-prime exterior convention, Connes d2 direction and multiplicative filtration. |
| 4.6 Linear additivity/fibration | Identity functor and zero exact category; v⊆w, not the reverse, in swallowing/change-of-weak-equivalence. | Retain exact-functor and saturation/extension hypotheses; the source citations do not prove stable-category dévissage. |
| 4.7 Resolution and torsion complexes | Acyclic complex is zero; torsion-homology resolution differs from replacing all torsion complexes by the residue stable category. | Retain linear comparison and finite/projective resolution hypotheses. |
| 4.8 Logarithmic DVR object and trace square | Valuation-zero class, uniformizer boundary, zero complex; THH(K) is not the logarithmic target. | Retain connective proof, module boundary and preferred localization maps; no ring-map claim for the suspended boundary. |
| 5.1 Perfect fields and prime-field TC | Fp versus algebraic closure: TC degree −1 is Zp versus zero. Positive R-limit terms die with lim¹ control. In TC-minus(Fp), uv=p, not zero. | Retain Witt F/cokernel, nontrivial extension, degrees and characteristic-p fibre sequence. |
| 5.2 Cohen, ghosts and ramification | Zp versus ramified e>1; infinite perfect residue versus finite local field; Witt length zero and one. Frobenius congruence is needed for the ghost image. | Retain actual W(k) embedding/presentation target and non-componentwise mod-p Witt quotient. |
| 5.2a Absolute initial log-Witt API | Level one; trivial log structure; Fp[x,y] has nonzero p-torsion dx∧dy. Fil0 is all and Filn zero. im V alone omits dV. | Retain absolute differential, solution set, level-one theorem and nonmultiplicativity of the filtration in general. Relative W-linear theory cannot replace it. |
| 5.3 Residue map/modified V | e=1 versus e>1; length one A/p; level n dimension ne; Vπ(1)=π^e modulo p in the chosen coordinate. | Retain twisted scalar action and relations; Frobenius and Teichmüller are not conflated. |
| 5.4 Log differentials | π has log residue 1 while ordinary du has zero residue; e prime to p versus wildly ramified e. | Retain e-dependent relative cyclic quotient, divisible coefficient-differential part, ω1[p] and i≥2 unique divisibility. |
| 5.5 Twisted derivation/homotopy-orbit module | Base constants have twisted differential zero; uniformizer term and R/F-twisted scalar multiplications; degree-zero boundary. | Retain the twisted Leibniz rule and hW quotient action; no ordinary derivation substitution. |
| 5.6 Mod-p log-Witt basis | n=1, s=0, i=0, and the r(i) cutoff; last V-layer length changes. | Retain strict inequalities and excluded endpoint classes; a mod-p module basis is not an integral free basis. |
| 5.7 TR log structure maps | Unit and π; adjacent n≥2; FdV=d at odd p. | Retain prelog compatibility and derived relations, not V multiplicativity. |
| 5.8 Ordinary DVR THH | Unramified derivative is a unit; ramified different changes odd cyclic quotients; degree zero remains A. | Retain source-proof boundary and distinction from log THH. |
| 5.9 Log THH and κ | κ has degree two; dκ=κ dlog(−p); p-adic even positive groups vanish after the Bockstein argument. Tame versus wild base change. | Retain ordinary/log difference, noncanonical odd quotient and actual descent hypotheses. |
| 5.10 Low TR and norm/restriction | n=1 and n=2; degree-two hTR is a cokernel. dlog class need not lift naturally. | Retain corrected exact sequence and low-degree-first proof order; no induction using its own high-degree result. |
| 5.11 Lubin–Tate, α and Bott | v(π)=1, v(p)=e; e=1 as a control; a compatible primitive root fixes the Bott scalar. | Retain unit polynomial, ramification exponents and root normalization; π is not replaced by p in ramified scope. |
| 5.12 Infinite cycles and Γ-hat | Uniformizer, dlog and V(1) cycles; degree zero threshold; geometric fixed points remain bounded below. A dual finite Moore spectrum shifts the threshold. | Retain mod-p/completed comparison argument and all-level propagation, not an unshifted application to arbitrary coefficients. |
| 5.13 Tate differentials | Unramified e=1 versus deep ramification; r=0, s=0 and last surviving filtration; dimension count after differentials. | Retain page lengths, inequalities and the designated generators, not an extension from the unramified table. |
| 5.14 Bott/pro-Witt | ν=1 versus ν>1; tensor over Z after coefficient reduction; roots of exact order; pro-isomorphism not levelwise. | Retain corrected scalar ring, transition maps and p-power torsion calculation. |
| 5.15 TC and local trace | Finite residue gives H1(k,Z/p)=Z/p; algebraically closed residue gives zero. Degree zero comparison fails. Natural mod-p split versus higher exact sequence. | Retain explicit general-residue Br/cd proof targets and n≥1 comparison. Corrected theorem page. |
| 5.16 Monoid/truncation | Truncation exponent a=1 gives zero relative ideal; weight divisible by a versus not; unit/basepoint terms. | Retain cyclic-bar decomposition, representation shift and ordinary HH/THH distinction. |
| 5.17 Twisted TR, GL and nilpotent thickenings | a=1; perfect field versus regular Fp-algebra; characteristic zero HC route. Approximate smooth local rings at finite length, then control R-limit/pro-zero. | Retain distinct GL theorem, regularity/noetherian scope and finite-level Popescu argument. |
| 6.1 Maximal divisible subgroup | Q gives all, Z and finite Z/6 give zero, Q×Z/6 retains only Q. Ambient unrelated roots do not define a coherent divisible subgroup. | All eight API targets plus two named controls agree; complement is noncanonical. |
| 6.2 Completion and supplied Tate module | Tp(Z)=0 but completion is Zp; bounded-exponent groups have zero Tate module; divisible torsion can contribute through the shifted term. Finite rank requires the actual level-cardinality hypotheses. | Retain additional left-exactness/torsion lemmas as new targets on the supplied carrier; no unrestricted direct-sum/product assertion. |
| 6.3 Cyclotomic invariants | Weight zero is excluded from finite wi. Odd p and p=2 have different unit-group structure; finite cyclotomic torsion changes the exponent. | Retain nonzero twist, image subgroup and finite/infinite factor distinctions. |
| 6.4 Three Galois coefficient systems | i=0,1,2; Kummer at i=1 has local units plus valuation; Qp coefficients have vector-space rank, Qp/Zp coefficients divisible terms. | Retain dual twist 1−i, limit control and separate compact/discrete groups. |
| 6.5 Valuation ring versus field | n=1 retains valuation; n≥2 has the residue p-primary comparison. | Retain degree restriction. |
| 6.6 Étale edge and extension | Q2 weight one has even mod-two K2 of order four rather than two split copies. Odd p mod p natural splitting differs from higher coefficient abstract splitting. | Retain Thomason/Godement and convergence targets, exact edges and two-primary nonsplitting. |
| 6.7 Completed groups | Qp small p=2,3; unramified degree d and cyclotomic torsion in completed K3; discrete coefficients are not completed groups. | Retain H1 odd/H2 even identification and small-prime torsion. |
| 6.8 Integral structure/lattice | K1 versus positive higher odd degree; rational divisible summand; finite coefficient orders versus a torsion-free completed lattice. | Retain finite torsion, divisible parts, rank relation and exact lattice map, not equality with an integral quotient. |
| 6.9 Integral-to-completed map | A rational summand maps to zero, divisible torsion can have a shifted Tate contribution; multiplication/tensor is not completion. | Retain distinct even/odd kernel and cokernel descriptions. |
| 6.10 Uncountability/Milnor | Finite type countable subfield cannot exhaust binary Laurent series; finite-stage relations descend before residue detection. | Retain separability/finite generation in the independence argument and rational factorial passage; uncountability is not inferred from an unrelated field alone. |
| 6.11 Equal characteristic | Fq[[t]]/Fq((t)); degree zero versus positive degree; p-basis dimension one. Invertible-prime part survives while positive p-completed part vanishes. | Retain GL input, de Rham–Witt quotient tower and integral/divisible distinction. |
| 6.12 Actual space equivalence | Trivial root group excluded; finite prime-to-p descent; d=1 versus d>1; missing rank component and positive cover; valuation fibre rather than just matching homotopy groups. | Retain actual retraction, local free-module rank, realization and fibre maps. Root/DM locator fixes apply. |
| 6.13 Dyadic GW | Z2 has 2 noninvertible. Shift changes duality sign; finite residue supplies the even theorem. K(V) itself need not be derived complete. | Retain L-theory completeness argument and integral conclusion for V only. |
| 7.1 Arithmetic completion | Identity map; zero K-class; field embedding versus product of completions. | Retain actual ring-map functor and spectrum maps. |
| 7.2 Transfer/boundary completion | Split prime gives several local factors; ramification/residue degree enters normalized boundaries; uniformizer/unit witness. | Retain sum over places, restriction/transfer directions and both squares. |
| 7.3 Hilbert completion | Full root group versus exponent projection; prime dividing coefficient modulus; swapped units/uniformizer. | Retain reciprocity normalization and local-symbol compatibility. |
| 7.4 Chern and unramified classes | Unit Kummer class is unramified at invertible residue characteristic; ramified symbol is not. Signed factorial need not be a unit. | Retain residue-invertibility and actual comparison-map hypotheses. |
| 7.5 Trace completion square | Ordinary TC(Ov) maps to logarithmic TC(Ov|Fv); fraction-field ordinary TC is a different target. | Retain preferred homotopy of the square and odd-p, positive-degree isomorphism. |
| 7.6 Semilocal completed map | Product over all v|p; empty and singleton finite products; p=2,3 torsion versus p≥5 simplifications. | Retain completion of spectra and subsequent edge, not algebraic tensor of integral K3. |

## Pinned declarations and duplication audit

Read all 102 baseline declaration signatures and their local hypotheses at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The audit covers finite-field
automorphisms/norms and matrix orders; henselian root lifting and local
valuations; split K0/representations; Witt/truncated-Witt operators; ordinary
differentials/exterior algebra; group/Tate cohomology; roots and cyclotomic
characters; completions and cardinal/transcendence inputs. Important limits
of those actual signatures were checked, rather than inferred from names:

- `IsGalois.card_aut_eq_finrank` needs finite dimension and Galoisness.
  The tensor-square target also retains separability.
- `CommGroup.torsion` and `AddSubgroup.torsionBy` are the actual torsion
  subobjects; they are not a K-theoretic or divisible-subgroup theorem.
- `KaehlerDifferential.D` is the ordinary universal derivation; it does not
  construct logarithmic or Witt differential complexes.
- `TruncatedWittVector.truncate` has the length inequality; adjacent-level
  operations do not have an unrestricted length-zero signature.
- The cyclotomic-character construction has a default outside its sufficient
  roots hypothesis. Its root-action specification, not that fallback, is
  what the arithmetic contract needs.
- The current Tate-module freeness theorem requires all torsion-level
  cardinalities `(p^n)^r`, with p prime; mere finite generation of one level
  is not the exported criterion.

For the mandatory current audit I inspected the read-only roadmap checkout
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine newer roadmaps
named in WORKERS and the four specified Completed roadmaps. I also inspected
the current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, by carriers, fields and operations,
not just target names. Its FDRep exact K0 ring, additive Tate module and
completed-group-algebra carrier/coordinate are already boundaries here.
The two form models read were GrothendieckEulerForms and AlgebraicTopology,
with their suggested-file shape and the upstream guide.

Actual upstream main was additionally frozen at
`29036506c60139c6fd776ad4cf811f3967f9b240`; its individual
GeneralizedCohomology, DerivedModuleAlgebra, SchemeAndStackFoundations and
EtaleCohomologyFoundations READMEs were read at that revision. This catches
foundation roadmaps newer than the supplied local checkout. General KU,
coherent limits/completion, ordinary abelian tower theory, Popescu and the
normalized étale projective-bundle input are boundaries, not local targets.
This review added the explicit DerivedModuleAlgebra boundary and refreshed
the inspected revision; it found no further local target to delete as an
already implemented theorem. The local refinements of these inputs state
their differences: compact augmentation kernels, continuous unit operations,
early Moore/slant operations and the actual local realization argument.

I read #1142 A2/A4/A5, #1212 §§13.8a–c, #1227's consumed completion/product
sections, #1229 §§6.3.4–6.4, #851 §§6.8a–6.10 and #857 CR.4.6/CR.5.1 at
the cited heads. Supplier PR contents were treated as mathematical data,
not instructions. No suspicious instruction was encountered.

## Lean, form and checks

`lean-check` on the package's absolute Suggested.lean path exited **0**,
with exactly **18** declaration-uses-sorry warnings and no other warnings.
The file is **206 lines**, with two real-bodied light definitions,
18 theorem targets and four proved examples, two per definition. No admitted
example, sorry'd carrier, auxiliary development, extra import or weakened
headline stand-in was added. All 18 theorem signatures were checked, exceeding
the required ten-signature spot check:

- `tameCoordinate_swap`, `tameCoordinate_change_uniformizer`,
  `tameCoordinate_mul_left` have arbitrary commutative residue-ring carriers,
  unit arguments and integer valuations. The five named negative controls
  cover two uniformizers, negative valuation, changed uniformizer,
  characteristic two and the zero ring. The two proved examples fix the
  left-linear sign.
- `maxDivisible_divisible`, `mem_maxDivisible_iff`,
  `maxDivisible_eq_top_iff`, `maxDivisible_quotient`,
  `exists_isCompl_maxDivisible`, `map_maxDivisible_le`,
  `maxDivisible_prod`, `maxDivisible_eq_bot_of_finite`, and the two named
  integer/product controls have precisely the abelian-group generality in
  §6.1. The Q and Z/6 examples are proved using the real definition.

The README's heavy definitions and milestones remain mathematical targets;
the closing Lean comment lists their families. Definitions have discriminating
computed/degenerate/agreement or non-example Checks; the adversarial table
above records the inspection. The newly restored §1.7 target introduces no
new Lean carrier. Metadata is the single appropriate line
`topic = "math.KT"`. The document is in original prose, with source locators,
layer order, hypotheses, APIs and worked examples, and no job/process labels.

Validation results and the complete node-to-package coverage map follow.

## Complete accepted-plan coverage map

All 280 nodes are accounted for below in packet array order. `Boundary` means
the target is consumed from the named existing/authorized owner, not replanned
here. The common `KTheoryFiniteLocalFields:` prefix is omitted. New prerequisite
targets added by the fixes, including Layer 0 and §5.2a, were checked separately
in the adversarial table. A location records fidelity, not supplier approval;
R1 applies to the atlas-only dependencies and R2 to the restored ring refinement.

| Node | Package location or owner |
| --- | --- |
| `L.1/k-theory-mod-m` | §1.1 |
| `L.1/mod-m-products` | §1.1 |
| `L.1/bott-element` | §1.2 |
| `L.1/brauer-character` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/green-virtual-character` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/brauer-lift` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/brauer-lift-frobenius-invariant` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/brauer-lift-lambda-ring` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/brauer-lift-stabilisation` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/brauer-lift-cyclic` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/fpsi` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/fpsi-homotopy` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/fpsi-lifting` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/quillen-map` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/fpsi-cohomology` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/fpsi-cohomology-ring` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/gl-sylow-in-wreath` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/gl-cohomology-detection` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/gl-mod-p-acyclic` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/quillen-homology-iso` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/quillen-fibration` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/quillen-k-groups` | Boundary: GeneralAlgebraicKTheory §§13.8a–c; refinements §§0.1–0.3,1.3–1.4 |
| `L.1/frobenius-is-adams` | §1.5 |
| `L.1/adams-psi-p-frobenius` | §1.5 |
| `L.1/adams-on-finite-field-k` | §1.5 |
| `L.1/galois-tensor-splitting` | §1.5 |
| `L.1/restriction-and-transfer` | §1.5 |
| `L.1/galois-transfer-formula` | §1.5 |
| `L.1/frobenius-action-extension` | §1.5 |
| `L.1/finite-field-galois-descent` | §1.5 |
| `L.1/finite-field-transfer-formulas` | §1.5 |
| `L.1/finite-field-products-vanish` | §1.5 |
| `L.1/determinant-degree-one` | Boundary: AlgebraicKTheory A2/A4/A5; §1.5 uses |
| `L.1/degree-two-symbols` | Boundary: AlgebraicKTheory A2/A4/A5; §1.5 uses |
| `L.1/finite-field-mod-m-groups` | §1.6 and coefficient products §1.1 |
| `L.1/browder-mod-l-ring` | §1.6 and coefficient products §1.1 |
| `L.1/algebraic-closure-k-groups` | §1.6 and coefficient products §1.1 |
| `L.1/algebraic-closure-mod-m-ring` | §1.6 and coefficient products §1.1 |
| `L.1/completed-k-theory` | §1.6 and coefficient products §1.1 |
| `L.2/gabber-rigidity` | §2.1 |
| `L.2/rigidity-finite-residue-field` | §2.1 |
| `L.2/rigidity-l-adic` | §2.1 |
| `L.2/dvr-localisation` | §§2.2,2.4 |
| `L.2/localisation-bockstein-compatibility` | §§2.2,2.4 |
| `L.2/henselian-dvr-mod-m-splitting` | §§2.2,2.4 |
| `L.2/odd-k-l-torsion` | §2.3 |
| `L.2/even-k-uniquely-l-divisible` | §2.3 |
| `L.2/prime-to-p-ring-of-integers` | §2.3 |
| `L.2/even-k-field-splitting` | §2.3 |
| `L.2/odd-k-ring-of-integers-equals-field` | §2.3 |
| `L.2/change-of-uniformiser` | §2.4 |
| `L.2/local-field-prime-to-p` | §2.5 |
| `L.2/mod-m-local-field-ring` | §2.5 |
| `L.2/w-invariant-local-field` | §2.5 |
| `L.2/separable-closure-l-torsion` | §2.5 |
| `L.2/e-invariant-local-field` | §2.5 |
| `L.3/norm-residue-map` | §3.1 |
| `L.3/norm-residue-power-compatibility` | §3.1 |
| `L.3/hilbert-symbol-components` | §3.1 |
| `L.3/tame-unit-pair` | §3.2 |
| `L.3/tame-uniformizer-unit` | §3.2 |
| `L.3/tame-integer-coordinates` | §3.2 |
| `L.3/tame-component` | §3.2 |
| `L.3/norm-residue-local-reciprocity` | §3.2 |
| `L.3/norm-residue-split-surjective` | §3.3 |
| `L.3/moore-kernel` | §3.3 |
| `L.3/local-k2-localisation-sequence` | §3.3 |
| `L.3/moore-kernel-prime-to-p` | §3.4 |
| `L.3/k2-no-p-torsion-char-p` | §3.4 |
| `L.3/k2-p-divisible-equal-characteristic` | §3.4 |
| `L.3/moore-kernel-p-divisible-mixed-characteristic` | §3.4 |
| `L.3/merkurjev-p-torsion-free` | §3.4 |
| `L.3/moore-kernel-uncountable` | §§3.5,6.10 |
| `L.3/moore-theorem` | §3.5 |
| `L.3/ring-of-integers-subgroup` | §3.5 |
| `L.3/moore-equal-characteristic` | §3.5 |
| `L.3/moore-mixed-characteristic` | §3.5 |
| `L.4/thh-of-linear-waldhausen-category` | §4.1 |
| `L.4/thh-structure-maps-f-equivalences` | §4.1 |
| `L.4/tr-pro-spectrum` | §4.2 |
| `L.4/norm-restriction-cofibre-sequence` | §4.4 |
| `L.4/p-typical-tc` | §4.2 |
| `L.4/connes-operator` | §4.3 |
| `L.4/moore-spectrum-splitting-for-hz-modules` | §4.3 |
| `L.4/tr-homotopy-orbit-spectral-sequence` | §4.4 |
| `L.4/pi0-tr-is-witt-vectors` | §4.2 |
| `L.4/hm-conventions-agree-with-nikolaus-scholze` | §§4.4,4.8 |
| `L.4/integral-and-p-typical-tc-agree-after-completion` | §§4.4,4.8 |
| `L.4/log-thh-bounded-below` | §§4.4,4.8 |
| `L.4/tate-cohomology-hm-model` | §4.5 |
| `L.4/tate-cohomology-ring-of-odd-cyclic-group` | §4.5 |
| `L.4/multiplicative-tate-spectral-sequence` | §4.5 |
| `L.4/tate-spectral-sequence-connes-module` | §4.5 |
| `L.4/tate-d2-is-connes-operator` | §4.5 |
| `L.4/three-by-three-lemma` | §4.5 |
| `L.4/exact-simplicial-homotopy-invariance` | §4.6 |
| `L.4/weak-equivalence-transformations-give-exact-homotopies` | §4.6 |
| `L.4/isomorphism-nerve-degeneracy-equivalence` | §4.6 |
| `L.4/thh-additivity-theorem` | §4.6 |
| `L.4/thh-relative-s-construction-square` | §4.6 |
| `L.4/cofibration-weak-equivalence-nerve-lemma` | §4.6 |
| `L.4/swallowing-lemma` | §4.6 |
| `L.4/thh-fibration-theorem` | §4.6 |
| `L.4/thh-resolution-theorem` | §4.7 |
| `L.4/dundas-mccarthy-equivalence-criterion` | §4.7 |
| `L.4/torsion-homology-complex-replacement` | §4.7 |
| `L.4/thh-torsion-complexes-f-equivalence` | §4.7 |
| `L.4/thh-projective-complexes-f-equivalence` | §4.7 |
| `L.4/thh-of-dvr-with-log-poles` | §4.8 |
| `L.4/dvr-tr-agrees-with-ring-tr` | §4.8 |
| `L.4/tr-localization-sequence` | §4.8 |
| `L.4/k-tc-localization-square` | §4.8 |
| `L.5/complete-dvr-eisenstein-presentation` | §5.2 |
| `L.5/ghost-image-criterion` | §5.2 |
| `L.5/verschiebung-one-is-teichmuller-minus-p` | §5.2 |
| `L.5/teichmuller-pth-power-additive-mod-p` | §5.2 |
| `L.5/residue-field-to-witt-mod-p` | §5.3 |
| `L.5/modified-verschiebung` | §5.3 |
| `L.5/witt-mod-p-of-dvr` | §5.3 |
| `L.5/log-differentials-residue-sequence` | §5.4 |
| `L.5/relative-log-differentials-of-dvr` | §5.4 |
| `L.5/log-differentials-divisible-part` | §5.4 |
| `L.5/log-differentials-p-torsion` | §5.4 |
| `L.5/tame-base-change-of-log-differentials` | §5.4 |
| `L.5/hochschild-homology-of-perfect-field` | §5.4 |
| `L.5/homotopy-orbit-de-rham-witt-module` | §5.5 |
| `L.5/kernel-of-restriction` | §§5.2a,5.4,5.6 |
| `L.5/log-de-rham-witt-dvr-divisible` | §§5.2a,5.4,5.6 |
| `L.5/log-de-rham-witt-dvr-mod-p` | §5.6 |
| `L.5/tr-log-structure-maps` | §5.7 |
| `L.5/dlog-relation` | §5.7 |
| `L.5/tr-log-dvr-is-log-dga` | §5.7 |
| `L.5/thh-of-dvr-p-adic` | §5.8 |
| `L.5/thh-of-dvr-mod-p` | §5.8 |
| `L.5/log-thh-low-degrees` | §5.9 |
| `L.5/log-thh-mod-p` | §5.9 |
| `L.5/log-thh-p-adic` | §5.9 |
| `L.5/log-thh-tame-descent` | §5.9 |
| `L.5/tr-log-dvr-is-log-witt-complex` | §§5.7,5.10 |
| `L.5/homotopy-orbit-comparison` | §5.10 |
| `L.5/frobenius-on-homotopy-orbits` | §5.10 |
| `L.5/log-de-rham-witt-tr-level-two` | §5.10 |
| `L.5/norm-restriction-exact-low-degrees` | §5.10 |
| `L.5/tr2-of-dvr-divisible` | §5.10 |
| `L.5/log-de-rham-witt-tr-low-degrees` | §5.10 |
| `L.5/connecting-map-of-kappa` | §5.11 |
| `L.5/lubin-tate-unit-polynomial` | §5.11 |
| `L.5/log-thh-mod-p-alpha-presentation` | §5.11 |
| `L.5/bott-element-in-tr` | §5.11 |
| `L.5/reduction-mod-p-of-thh-dvr` | §5.12 |
| `L.5/kappa-differential` | §5.12 |
| `L.5/tate-perfect-field-generators` | §5.12 |
| `L.5/tate-infinite-cycle-dlog` | §5.12 |
| `L.5/tate-infinite-cycles-uniformizer` | §5.12 |
| `L.5/tate-infinite-cycles-v1` | §5.12 |
| `L.5/log-derivative-frobenius-lemma` | §5.12 |
| `L.5/tate-spectral-sequence-first-level` | §5.12 |
| `L.5/gamma-hat-mod-p-isomorphism` | §5.12 |
| `L.5/gamma-hat-all-levels` | §5.12 |
| `L.5/tate-spectral-sequence-unramified` | §5.13 |
| `L.5/tate-spectral-sequence-deeply-ramified` | §5.13 |
| `L.5/tate-spectral-sequence-e-r-terms` | §5.13 |
| `L.5/tate-spectral-sequence-differentials` | §5.13 |
| `L.5/frobenius-surjective-odd-degrees` | §5.13 |
| `L.5/tr-mod-p-dimension` | §5.13 |
| `L.5/bott-multiplication-standard-basis` | §5.14 |
| `L.5/image-of-log-de-rham-witt` | §5.14 |
| `L.5/log-de-rham-witt-tr-mod-p` | §5.14 |
| `L.5/log-de-rham-witt-tr-mod-pv` | §5.14 |
| `L.5/roots-of-unity-torsion-in-log-drw` | §5.14 |
| `L.5/tc-of-log-dvr-mod-p` | §5.15 |
| `L.5/thh-of-perfect-field` | §5.1 |
| `L.5/tr-of-perfect-field` | §5.1 |
| `L.5/tc-of-perfect-field` | §5.1 |
| `L.5/trace-equivalence-finite-witt-algebras` | §5.15 |
| `L.5/trace-isomorphism-for-local-field` | §5.15 |
| `L.5/thh-of-pointed-monoid-algebra` | §5.16 |
| `L.5/cyclic-bar-construction-of-truncated-monoid` | §5.16 |
| `L.5/hochschild-homology-of-truncated-polynomial-algebra` | §5.16 |
| `L.5/thh-of-truncated-polynomial-algebra` | §5.16 |
| `L.5/tate-spectral-sequence-truncated` | §5.16 |
| `L.5/tate-image-of-uniformizer-truncated` | §5.16 |
| `L.5/relative-tc-of-truncated-polynomial-algebra` | §5.17 |
| `L.5/twisted-tr-of-regular-fp-algebra` | §5.17 |
| `L.5/relative-k-of-truncated-polynomial-over-perfect-field` | §5.17 |
| `L.5/relative-k-of-truncated-polynomial-regular-fp` | §5.17 |
| `L.5/relative-cyclic-homology-of-truncated-polynomial-algebra` | §5.17 |
| `L.5/relative-k-of-truncated-polynomial-char-zero` | §5.17 |
| `L.5/tr-of-smooth-fp-algebra` | §5.17 |
| `L.5/tc-of-regular-fp-algebra` | §5.17 |
| `L.6/maximal-divisible-subgroup` | §6.1 |
| `L.6/p-adic-tate-module` | Boundary: current TauCeti Tate module; extra API §6.2 |
| `L.6/completion-exact-sequence` | §6.2 |
| `L.6/divisible-subgroup-criterion` | §§6.1,6.8 |
| `L.6/torsion-free-lattice-lemma` | §6.8 |
| `L.6/p-adic-w-invariant` | §6.3 |
| `L.6/w-invariant-prime-to-p-factor` | §6.3 |
| `L.6/p-adic-w-invariant-of-q-p` | §6.3 |
| `L.6/h0-of-tate-twists` | §6.4 |
| `L.6/local-duality-for-tate-twists` | §6.4 |
| `L.6/h1-of-tate-twists` | §6.4 |
| `L.6/h1-with-divisible-coefficients` | §6.4 |
| `L.6/ring-of-integers-versus-field` | §6.5 |
| `L.6/hm-etale-comparison` | §6.6 |
| `L.6/hm-theorem-a` | §6.6 |
| `L.6/finite-coefficient-lichtenbaum-quillen` | §6.6 |
| `L.6/odd-completed-k-groups-are-h1` | §6.7 |
| `L.6/even-completed-k-groups-are-h2` | §6.7 |
| `L.6/completed-k-groups-of-p-adic-fields` | §6.7 |
| `L.6/completed-k-groups-of-q-p` | §6.7 |
| `L.6/completed-k3-of-unramified-fields` | §6.7 |
| `L.6/discrete-coefficient-k-groups` | §6.7 |
| `L.6/p-primary-torsion-of-odd-k-groups` | §6.8 |
| `L.6/odd-integral-k-groups` | §6.8 |
| `L.6/even-k-groups-mod-p-powers` | §6.8 |
| `L.6/even-integral-k-groups` | §6.8 |
| `L.6/even-k-groups-tate-module` | §6.8 |
| `L.6/divisible-rank-relation` | §6.8 |
| `L.6/finite-coefficient-k-groups-structure` | §6.8 |
| `L.6/k3-torsion-free-lattice` | §6.8 |
| `L.6/even-integral-to-completed-comparison` | §6.9 |
| `L.6/odd-integral-to-completed-comparison` | §6.9 |
| `L.6/uncountable-transcendence-basis` | §6.10 |
| `L.6/rational-symbol-residue-separation` | §6.10 |
| `L.6/finite-stage-relation-descent` | §6.10 |
| `L.6/local-symbol-family-independent` | §6.10 |
| `L.6/equal-characteristic-milnor-uncountable` | §6.10 |
| `L.6/milnor-k-of-local-fields` | §6.10 |
| `L.6/uniquely-divisible-summand` | §6.10 |
| `L.6/hm-theorem-d` | §6.12 |
| `L.6/power-series-de-rham-witt` | §6.11 |
| `L.6/geisser-hesselholt-regular-local` | §6.11 |
| `L.6/equal-characteristic-relative-k-theory` | §6.11 |
| `L.6/equal-characteristic-completed-k-groups` | §6.11 |
| `L.6/equal-characteristic-unique-p-divisibility` | §6.11 |
| `L.6/equal-characteristic-integral-structure` | §6.11 |
| `L.7/completion-map` | §7.1 |
| `L.7/restriction-completion-square` | §7.2 |
| `L.7/transfer-completion-formula` | §7.2 |
| `L.7/boundary-at-a-prime-via-localisation` | §7.2 |
| `L.7/karoubi-completion-square` | §7.2 |
| `L.7/boundary-completion-compatibility` | §7.2 |
| `L.7/hilbert-symbol-completion` | §7.3 |
| `L.7/etale-chern-class-completion` | §7.4 |
| `L.7/unramified-chern-class-reduction` | §7.4 |
| `L.7/cyclotomic-trace-completion` | §7.5 |
| `L.7/semilocal-completed-map` | §7.6 |
| `L.5/fp-tc-minus-filtration-extension` | §5.1 |
| `L.5/fp-negative-topological-cyclic-homology` | §5.1 |
| `L.5/fp-periodic-topological-cyclic-homology` | §5.1 |
| `L.5/fp-cyclotomic-frobenius-on-tc-minus` | §5.1 |
| `L.5/fp-cyclotomic-tate-cover` | §5.1 |
| `L.5/fp-cyclotomic-shift-model` | §5.1 |
| `L.5/char-p-algebra-tc-fibre-sequence` | §5.1 |
| `L.1/finite-even-k-two-completion` | Boundary: GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.10 |
| `L.1/finite-even-tate-k-groups` | Boundary: GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.10 |
| `L.1/finite-even-symmetric-l-groups` | Boundary: GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.10 |
| `L.1/finite-even-l-tate-generator` | Boundary: GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.10 |
| `L.1/finite-even-l-tate-equivalence` | Boundary: GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.10 |
| `L.1/finite-even-shifted-hermitian-comparison` | Boundary: GeometryOfNumbersAndQuadraticArithmetic §§6.8a–6.10 |
| `L.1/finite-field-classical-hermitian-connective-comparison` | §1.7 |
| `L.1/finite-even-multiplicative-l-tate-comparison` | §1.7 restored multiplicative refinement; R2 |
| `L.1/perfect-char-two-k-two-completion` | §1.7 |
| `L.1/perfect-char-two-symmetric-l-base-change` | §1.7 |
| `L.1/perfect-char-two-shifted-hermitian-comparison` | §1.7 |
| `L.6/dyadic-field-hermitian-two-comparison` | §6.13 |
| `L.6/dyadic-integer-hermitian-two-comparison` | §6.13 |
| `L.6/dyadic-integer-symmetric-l-two-complete` | §6.13 |
| `L.6/dyadic-integer-integral-hermitian-comparison` | §6.13 |
| `L.1/classical-degree-three-pullback` | §1.9 |
| `L.1/lang-degree-three-edge` | §1.9 |
| `L.1/finite-classical-h2-no-two-torsion` | §1.9 |
| `L.1/finite-classical-h3-coefficient-comparison` | §1.9 |
| `L.1/finite-rank-symplectic-h3-mod-two` | §1.9 |
| `L.1/stable-sl-plus-universal-cover` | §1.9 |
| `L.1/stable-sl-degree-three-hurewicz` | §1.9 |
| `L.1/finite-field-k3-coefficient-two` | §1.9 |
| `L.1/finite-field-chern-bott-product` | §§1.8–1.9 |
| `L.1/finite-field-k3-etale-isomorphism` | §§1.8–1.9 |
| `L.1/finite-rank-symplectic-etale-isomorphism` | §1.9 |

## Final validation

| Check | Result |
| --- | --- |
| `lean-check` on Suggested.lean | Exit 0; exactly 18 `sorry` warnings, no others. File unchanged after this run. |
| `python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryFiniteLocalFields.json` | Exit 0; 0 errors, 0 warnings; 280 nodes, 102 baseline declarations, 39 gaps, 34 requests. |
| `python3 scripts/check_sorry_data.py research/blueprint/packages/KTheoryFiniteLocalFields/Suggested.lean` | Exit 0. |
| `python3 research/blueprint/intake.py check-files` on the three package inputs, review.json, report and handoff | Exit 0; 6 files, 0 problems. |
| JSON parsing of review.json | Exit 0. |
| `git diff --check` | Exit 0. |

Only README.md, review.json, this report and its handoff changed. There is no
packet, supplier, programme-order or generated-site edit. The review is ready
to submit with the two findings above; no conditional acceptance is recorded.
