# Independent package review: ModularityAndLanglandsExtensions

**Verdict: needs_changes.** The package has the required mathematical shape and its compact Lean file elaborates. The corrections below repair several false normalizations and overbroad source claims. It is not ready for an upstream draft: six proposed method owners do not have supplying roadmaps, several existing suppliers lack the requested comparisons, and some primary-source obligations remain open. Those are concrete dependency defects, not failures of Lean elaboration.

This completes issue #9226, independently of package issue #9182 and its author, session `codex-8M65j7`. Reviewer: Codex, session `codex-0ANVwD`; date: 2026-10-14. The claim was confirmed by [the worker bot](https://github.com/CBirkbeck/tauceti-explorer/issues/9226#issuecomment-6157503835). Review input: package commit `19bc189ba`. Reviewed files: [README](../packages/ModularityAndLanglandsExtensions/README.md), [Suggested.lean](../packages/ModularityAndLanglandsExtensions/Suggested.lean), and [metadata](../packages/ModularityAndLanglandsExtensions/metadata.toml). The accepted packet and other workers' deliverables were not edited.

## Corrections applied

1. **Archimedean GSp₄ chamber and character lattice, §§3.26 and 3.28.** Replace λ₁<0 by λ₁>0, as in Pilloni §15.2.4, author p. 109. Require λ∈X*(T)+(2,1;0); for λ=(λ₁,0;c), the integral parity condition is λ₁−3≡c modulo 2 (Pilloni §5.1.1, p. 20). The witness λ=(1,0;2) gives minimal holomorphic Sp₄ K-type (2,2); λ₁=0 and λ=(1,0;1) are excluded. Retain the finite-level and fixed non-Eisenstein eigensystem hypotheses of Pilloni's packet switching. Add direct Schmidt 2017 §2.3, published pp. 2390–2391, and Schmidt 2018 §§1.1–1.2, pp. 3088–3092, references.
2. **Residue cardinality, §3.4.** The unramified parameter normalization uses q^(3/2), with q the residue cardinality of the local field, rather than the unrelated coefficient prime p. The explicit q=9, p=5 witness gives 27 for the normalization factor.
3. **Rank versus degree, §1.15.** SP_n uses Sym^(n−1). The low-rank endpoint is rank at most five, not symmetric-power degree at most five. Related link labels now use the same convention.
4. **Single-valued archimedean character.** Write the discrete-series inducing character as (z/|z|)^(k−1). The former fractional power of z/z̄ does not specify a character. For k=2 and z=−1 the value is −1, while z/z̄=1 loses that value.
5. **Compact-group imports.** Distinguish Layer 5 Peter–Weyl matrix coefficients from Layer 6 class-character completeness. Finite linear combinations are dense in the appropriate class functions; a single irreducible character, or the uncompleted span, does not constitute all continuous functions.
6. **Existing lifting endpoints.** Point ordinary and Fontaine–Laffaille consumers to PotentialAutomorphyInfrastructure Layer 5, §§5.22–5.23. Separate the missing local-connects, potentially semistable and general-number-field extensions. In particular Qian's ordinary transport uses the existing ordinary endpoint; its missing Dwork comparison is a different obligation.
7. **Exterior-square analytic scope, §3.11.** The BCGP proof of Proposition 8.3.2, author p. 247, supports its GL₄ assertion at s=1. It does not source the former full vertical-line statement in general rank. The subsection now requests the general-rank analytic extension explicitly; AL.4's unramified factors do not prove continuation or nonvanishing.
8. **Automorphic induction.** Remove the false attribution to Arthur 2003 §4, p. 45, which states an Artin conjectural specialization. Request the all-place cyclic induction and orbit criterion from ET.7a with a primary Arthur–Clozel locator. BCGNT Proposition 6.2.3, proof p. 63, identifies Chapter 3, Theorem 4.2 for its particular untensoring argument, not every claim in this contract.
9. **Locator corrections.** Arthur's local Theorem 1.5.1 is on pp. 41–43, with the theorem beginning on p. 42; stable transfer identities also use Theorem 2.2.1, pp. 65–66. The global formula discussion extends through p. 48, where ε_ψ is specified. ACC+ Theorem 6.1.2 hypothesis (5) is on arXiv v2 p. 134 (Annals p. 1031). The cuspidal Buzzard–Kilford comparison is NT I Theorem 3.2, arXiv v3 pp. 53–54.
10. **FKP scope, §§2.13 and 2.30.** Restore the large cyclotomic degree, primitivity and ordinary symplectic local-lift hypotheses of Proposition 9.1, arXiv v5 pp. 41–43. Constituent self-duality includes the cyclotomic multiplier. Retain the auxiliary Steinberg place in the compatible-system comparison. Mark the additional all-coefficient-primes local comparison required by the Zariski-density argument. For n>1 formal-character independence excludes the principal GL₂ alternative after the regular-unipotent argument; at n=1, GSp₂=GL₂ already.
11. **Source boundaries.** Mark the still-unread primary proofs and exact comparisons explicitly, including Khare's weight-one descent and its corrigendum, BHR Proposition 5.3.7, Clozel's two inputs, Kim's symmetric-fourth/icosahedral inputs, Henniart's completion, and the full Adams–Johnson definition. Reading a later paper's quotation is not certification of that primary proof.
12. **Current-library boundary.** Import the classical rational newform Satake parameter and angle API from `TauCeti.NumberTheory.ModularForms.Newforms.Satake`. Its angle comparison assumes prime p, trivial local nebentypus and a Ramanujan bound; it proves neither that bound nor CM-field Sato–Tate. No distinct endpoint target was deleted.

The README retains all 142 input targets, 151 named API items and 110 prose Checks. There are 121 numbered subsections and 21 front-matter targets. All 27 definition/construction targets have at least three discriminating Checks; the additional accessible-refinement comparison also has four. The final document has 201 distinct explicit anchors, 895 internal links with resolved destinations, and 49 references. No mathematical target was dropped to shorten the package.

## Unresolved defects and exact work required

| Defect | Affected assertions | Required repair |
|---|---|---|
| R1: six proposed suppliers have no supplying roadmap/package | Imported eigenvariety and level-raising contracts; §§4.1, 4.9, 4.11, 4.16–4.18, 4.22–4.24; Dwork and auxiliary-curve steps in Layer 2 | Establish exact lower-tier/bundle exports from SymmetricPowersByAnalyticContinuation, SymmetricPowersByUnitaryLevelRaising, SymmetricPowerAutomorphyLifting, SymmetricPowersByTensorFunctorialityLifting, PotentialAutomorphyDworkMotivesPartII and OpenImageTheoremsForAbelianVarieties. A proposed owner name and source theorem are not a closed prerequisite. |
| R2: coefficient-prime Dwork comparison is absent | §§2.3–2.5, 2.26, 2.29, 2.32–2.33 | Supply the actual semistable/ordinary filtration at v(t)<0 at the coefficient prime and prove preservation through subquotients and global semisimplification. Qian thesis Remark 3.0.13, printed p. 55, records the relevant distinction; automorphic ordinarity alone does not close it. |
| R3: existing ordinary/FL endpoints have narrower scope | §§1.5, 2.9, 2.14, 2.20; general-number-field conditional consequences | Export BCGNT Theorem 3.2.1 with local connects, Caraiani–Newton Theorem 1.3 with potentially semistable local conditions, the associated AKT residual modularity and X₀(15) point analysis, and CG Theorem 5.16's conditional general-number-field comparison. Do not replace these by the ordinary or FL theorem. |
| R4: coarse suppliers lack strengthened comparisons | §§1.8, 3.2, 3.11, 4.14, 4.27, 4.30, 5.4–5.5 | AL.4 needs Langlands–Shahidi analytic continuation/nonvanishing beyond its unramified factors; ALS.3 needs Harder's Bianchi Eichler–Shimura theorem beyond Hecke chains; R19.2 needs parallel weight one beyond cohomological Hilbert forms; MP.3 needs full Howe duality and GRS descent beyond elementary theta. |
| R5: trace-formula and parameter construction gaps | Layer 3 classifications and §5.7 | ET.3's ordinary transfer and ET.4's restricted unitary comparison must be extended to the specified weighted/twisted stabilization and local intertwining. AF.1 must construct the full Adams–Johnson carrier, not define it from AMR §8.1's necessary conditions. ES5's semisimple parameter map does not supply FS I.10.2's stable-category equivalence. TWFL remains an explicit mathematical hypothesis, rather than a silently assumed theorem. |
| R6: two requested exports are not verified at their consumed generality | §§1.3 and 2.7, 2.31 | Verify R22.5's exact totally real Hilbert-field potentially Barsotti–Tate lifting export. R24.5 must provide Patrikis–Taylor's regular pure polarized constituent systems and a common extension; BLGGT extreme regularity and a cuspidal realization of the whole reducible sum are different assertions. |
| R7: all-primes monodromy comparison | §2.30 | Prove the regular-nilpotent local comparison for a member whose coefficient prime equals the residue characteristic of v₀, or supply a second appropriate Steinberg place. Strict off-coefficient-prime compatibility at one place and ℓ-independent formal character do not, by themselves, give this input. The README now makes the stronger conclusion conditional on it; this review does not claim an error in FKP's theorem. |
| R8: incomplete primary-source verification | Source-boundary paragraph; §1.2, §1.14, §3.26, §4.7; cyclic induction and AJ contracts | Obtain the primary statements and proof locators listed in the source table below. No unauthorized book copy or inaccessible proof was substituted. General-rank exterior-square analysis additionally needs its own precise theorem locator. |

The tier-order document puts this roadmap at tier 26. PotentialAutomorphyInfrastructurePartII **does exist** in the atlas, with PL.0/PL.1/PL.5 material; the package author's older handoff incorrectly describes it as nonexistent. It is outside the 94-roadmap order, as is MetaplecticAutomorphicForms. Their exact contracts and an allowed upstream order must still be settled. The six proposed owners in R1 are a separate absence. Local ordering is sound among the numbered targets; forward references from front-matter import specifications to their definitions are references, not constructions in an earlier layer. This does not certify global atlas closure or resolve the reverse coarse-stage dependency on ML.1.

These repairs require supplying theories or ownership/order decisions beyond the package-review edit scope. The report identifies where to resume; it does not invent placeholder carriers or edit neighbouring packets.

## Source verification

The random sample was selected reproducibly by `random.Random(9226).sample(packet["nodes"], 15)`. Each selected locator was opened and read in its primary edition where accessible. The two unsupported generalizations in that sample became explicit source boundaries. Results below are in the reviewer's own words; no source excerpts or source files are committed.

| Sample target | Primary locator checked | Result |
|---|---|---|
| Symmetric-power automorphy lifting | NT II, arXiv 2009.07180v2, Theorem 2.1, pp. 5–6 | Both forms have weight two and are nonordinary at every p-place; the bound is on p^a and the Steinberg condition is an iff. |
| Twisted exterior-square analytic assertion | BCGP, arXiv 1812.09269v3, proof of Proposition 8.3.2, p. 247 | GL₄ and s=1 support found. General GL₂n/full-line scope was not supported by this locator and was corrected. |
| Sym⁶ and Sym⁸ | Clozel–Thorne III, accepted manuscript, Theorem 6.1, p. 44, and introduction p. 2 | Totally real and cyclotomic avoidance conditions retained. |
| p–r switch | BCGNT, arXiv 2309.15880v3, Proposition 6.2.3, pp. 61–63 | All seventeen assumptions read, including local connects and the descent/induction step. |
| Hilbert symmetric powers | NT Hilbert, arXiv 2212.03595v2, Theorem A p. 1 and Theorem 6.5(1), p. 50 | Non-CM, regular algebraic and Hilbert-field scope match. |
| Totally real odd Artin | Pilloni–Stroh, Theorem 0.3, author p. 2; BCGP application p. 266 | Finite-image, totally odd irreducible scope retained explicitly. |
| SP_n predicate | NT Hilbert, Conjecture B, p. 3 and discussion p. 13 | Rank n means degree n−1; cuspidality restricted to non-CM input. |
| GRS descent | Jiang–Zhang, arXiv 1508.03205v4, Theorem 1.1, p. 6, and Theorem 7.2, p. 75 | Generic descent needs the specified symplectic pole and central-character data. |
| Totally real potential automorphy | BLGGT v4, Corollary 4.5.2, p. 60 | Prime bound and prescribed local/disjointness conditions read in the totally real version. |
| Residual symplectic potential automorphy | ACC+, arXiv 1812.09999v2, Proposition 7.2.3, pp. 204–205 | Conclusion matches the residual representation, not a chosen characteristic-zero lift. |
| Automorphic induction contract | Arthur 2003, §4, p. 45; BCGNT proof of Proposition 6.2.3, p. 63 | Arthur locator was unrelated to the claimed theorem. Exact all-place cyclic induction remains a primary-source gap. |
| Symmetric-power lift over number fields | Clozel–Thorne III introduction p. 2; NT Hilbert Lemma 2.1, pp. 9–10 | All-place definition distinguished from the one-prime Galois criterion and weak matching. |
| Functorial lift predicate | NT I introduction p. 1 | Composition of local parameters at every place; isobaric existence is not cuspidality. |
| GSp₄ archimedean limit packet | Pilloni §15.2.4 p. 109 and §5.1.1 p. 20; CG Theorem 7.11, pp. 854–855; Schmidt 2017 §2.3, pp. 2390–2391 | Positive chamber and lattice parity corrected; BHR primary proof still open. |
| Dwork fibre transport | Qian §4, author pp. 20–24; thesis Remark 3.0.13, printed p. 55; ACC+ Theorem 6.1.2(5), arXiv p. 134 | Distinguish auxiliary-prime monodromy from coefficient-prime ordinarity; supplier gap retained, ordinary lifting locator repaired. |

The package author's unverified-source list and secondary-only proof inputs received the following additional checks. A successful bibliographic landing-page check is explicitly distinguished from reading the proof.

| Previously open input | What this review read or attempted | Remaining limit |
|---|---|---|
| Harris–Shepherd-Barron–Taylor | [Annals primary PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf), Theorem 4.2 and proof, pp. 809–810 | Its abelian-variety/RM hypotheses are narrower than a general compatible-system endpoint; BLGGT supplies the latter argument. |
| Taylor parity input | [Primary ANT PDF](https://msp.org/ant/2012/6-3/ant-v6-n3-p01-p.pdf), Proposition 1.2, pp. 409–410 | Odd n and irreducibility of the RAESDC realization are essential; it is not an arbitrary-rank parity theorem. |
| Caraiani purity and local compatibility | [arXiv 1202.4683v1](https://arxiv.org/abs/1202.4683v1), Theorem 1.1 p. 1; [arXiv 1010.2188v1](https://arxiv.org/abs/1010.2188v1), Theorems 1.1–1.2 pp. 1–2 | CM RACSDC scope and the two ℓ=p/ℓ≠p branches were kept distinct. |
| Buzzard–Kilford | Author's `annuli.pdf`, Theorem A p. 2; NT I Theorem 3.2, pp. 53–54 | Full eigencurve indexing includes zero; the cuspidal statement uses positive indices. |
| Anastassiades–Thorne | Primary Cambridge author manuscript, Theorems 1.1 pp. 2–3 and 5.1 pp. 19–20 | Level raising requires split/unramified extension and places, the congruence and excluded residual character-twist shape. It still needs its method owner. |
| Allen–Newton–Thorne | [arXiv 1912.11269v2](https://arxiv.org/abs/1912.11269v2), Theorem 1.1 pp. 1–2 | All eight hypotheses read, including constituents, Steinberg place, primitivity and residual image restrictions; not a generic reducible lifting theorem. |
| Newton–Thorne adjoint Selmer | [arXiv 1912.11265v2](https://arxiv.org/abs/1912.11265v2), Theorem A p. 2 | The enormous-image hypothesis is needed for the stated vanishing. |
| Schmidt 2017 and 2018 | [2017 author PDF](https://math.ou.edu/~rschmidt/papers/hodge.pdf), §2.3, pp. 2390–2391; [2018 author PDF](https://sites.math.unt.edu/~schmidt/papers/packets_paramodular.pdf), §§1.1–1.2, pp. 3088–3092 | These primary readings replace the prior secondary-only checks for these specific archimedean/type comparisons. |
| Clozel 1990 Theorem 3.13 and Lemme 4.9 | Checked the [editor's publication entry](https://jmilne.org/math/Books/index.html) and searched for an authorized freely readable primary text; none obtained | Independence-of-isomorphism and purity proof locators remain gaps; no unofficial book mirror used. |
| Khare weight-one descent | Primary 1997 Oxford entry required access; [1999 corrigendum DOI](https://doi.org/10.1155/S1073792899000537) also did not provide the proof in this run; KW I §10.1 pp. 20–21 read | Obtain both the corrected theorem and its proof; the infinite-prime finite-dimensional descent sketch is secondary evidence. |
| BHR Proposition 5.3.7 | Primary [Duke DOI](https://doi.org/10.1215/S0012-7094-94-07326-2) was inaccessible; Pilloni and CG comparisons were read | Exact BHR proof and page remain open; its attribution is retained with an explicit source boundary. |
| Henniart 2009 | [Journal abstract](https://www.mathnet.ru/eng/mmj335) confirms completion at every finite place; linked AMS full-text route unavailable | Exact proof locator and the separately required archimedean comparison remain open. |
| Kim 2003 and Kim 2004 | AMS 2003 PDF access failed; [Springer 2004 entry](https://link.springer.com/article/10.1007/s00222-003-0340-5) exposed subscription metadata, not its proof | Symmetric-fourth and icosahedral proofs remain primary-source gaps; NT II's statement does not replace them. |
| Complete Adams–Johnson conditions | AMR, arXiv 1507.01432v2, §8.1 p. 31 read | That list gives consequences of AJ87's conditions, not the complete defining conditions. Obtain the actual definition and AF.1 construction. |
| Arthur classifications and conditional input | Arthur 2013 Theorems 1.5.1–1.5.2, pp. 41–48, and 2.2.1, pp. 65–66; AGIKMS arXiv 2410.13504v3 §0.4 p. 15 | This verifies corrected statement locators and the explicit assumption boundary, not all classification proofs or a missing stabilization owner. |

The cleared Pilloni manuscript was read in the maintainer's library without copying the file or any passage. All committed mathematical descriptions are original formulations with locators. No assertion of source verification above relies on a search snippet or on an unofficial book copy.

## Adversarial mathematics pass

The table accounts for every numbered target and every front-matter target/convention. A range includes each subsection in that range. These are mathematical instantiations and hypothesis checks, not claims that the corresponding heavy objects have been implemented. Source and supplier failures remain R1–R8.

| Statements checked | Instances / plausible wrong version tested | Outcome |
|---|---|---|
| Polarization and automorphic realization | Rank 2, algebraic purity weights 0 and 1; cyclotomic multiplier at complex conjugation | Keep n+w_alg sign and HT(ε)=−1; motivic weight is w_alg+n−1. |
| BLGGT edition concordance | Totally real versus imaginary CM; v1 numbering versus v4 | Use the registered edition and field-specific hypotheses, not interchangeable theorem numbers. |
| Symmetric-power lifting convention | n=1,2,3; dihedral induction | Rank n is degree n−1; trivial, identity and noncuspidal dihedral cases distinguished. |
| Accessible/n-regular refinements | Ratio −1, n=2 and 3; Steinberg and supercuspidal | Two-regular need not be three-regular; Steinberg has one accessible refinement, supercuspidal none. |
| Eigenvariety propagation | n=1; nonaccessible/nonregular point; different components | Component implication retains refined-point and regularity input; R1 prevents closure. |
| Buzzard–Kilford boundary | p=2; zero component versus positive cusp indices | Ordinary component of full curve separated from the cuspidal restriction. |
| Level-one propagation | n=1; CM versus non-CM source | Universal non-CM implication does not give cuspidality for CM input; R1. |
| Steinberg level raising | Nontrivial local component; Steinberg place added at a chosen prime | Keep ordinary/nonordinary and level conditions; no arbitrary level-raising claim; R1. |
| One level-one symmetric-power seed | Rank-one lift; prescribed positive n | Existence at one form is not propagation without the other imported theorem; R1. |
| n-regular congruences | α/β a root of unity of small order | Excluded ratio controls the conclusion; R1. |
| Symmetric-power automorphy lifting | p=2,a=3,n=4; field size 5; one form ordinary | Size 8>7 passes the numerical bound; size 5 fails; both forms must be nonordinary. |
| TWFL gate | Conditional record without a proof; known ordinary fundamental lemma alone | Does not discharge non-split weighted/twisted hypotheses; R5. |
| Archimedean reciprocity/sums/restriction | GL₁ sign and norm character; trivial GL₂; D₂ at z=−1 | Weil abelianization is not finite Galois reciprocity; fractional character fixed. |
| Compatible-system Euler/gamma factors | Trivial, quadratic odd, elliptic and zero systems | Factors distinguish signs; weak good-place compatibility does not fix bad/real data. |
| Frobenius/duality bridge | Trivial and cyclotomic line; elliptic Tate module and its dual | Inverting Frobenius does not dualize the representation or negate HT weights. |
| Rational odd Artin import | Dihedral versus A₅; reducible 1⊕1 | Finite-image irreducibility and oddness required; weight-one descent source gap retained. |
| Field/weight boundary | Rational weight one versus totally real weight one; arbitrary-field elliptic curve | Scope does not silently transfer from ℚ; general-field modularity remains conditional/potential. |
| Trace/intertwining inputs | Ordinary versus twisted orbital integrals; non-split group | Restricted ET inputs do not certify full stabilization; R5. |
| Symplectic classification branch | GSp₄ versus unitary group; non-general-type transfer | Unitary classification alone does not provide the symplectic classification; R5. |
| Cyclic base change/descent | Quadratic character fixed under Galois; reducible restriction | Cuspidality orbit/irreducibility conditions retained; Galois descent restricted to its CM/totally-real predicate. |
| Cyclic automorphic induction | Degree one; inducing representation fixed by a proper subgroup | Full orbit needed for cuspidality; incorrect source removed; R8. |
| §§0.1–0.3 | Empty hypotheses, false conditional assertion, rank one, reducible isobaric sum, weight one | Status is not proof; NT cuspidality/regularity is stronger than an isobaric or weight-one realization. |
| §0.4 | k=0,2,3; r=2 and negative r; k+r=1 or k+2r=3 | Four entries retained; all pairwise collisions match the exclusions. Checked 135 numerical instances. |
| §0.5 | Q=0,1,X−1; quadratic with zero constant term; matrix dimension zero; x=0 | Actual-degree reverse retained; inverse evaluation requires x≠0; GL hypothesis avoids singular-matrix degree loss; det(empty)=1. |
| §0.6 | k=0,r=2; repeated weights versus regular weights; bad p | Numerical prediction does not prove de Rham/crystalline status; retain conjectural tag and good-prime condition. |
| §§1.1–1.2 | Trivial line versus 1⊕1; equal HT weights versus regular pair | Strong Artin matches every place; irregular-system descent needs fixed level and infinitely many coefficient primes; R8. |
| §§1.3–1.5 | Solvable mod-5 image; a p-place in S; F with infinitely many X₀(15) points | Excluded image/ramification/point-count instances do not meet hypotheses; lifting and curve-analysis gaps R3/R6. |
| §§1.6–1.7 | Determinant, identity and dihedral lift; p=5,a=1 and a=0 | Lift may be isobaric; one embedded finite field and one conjugation are required for both projective inclusions. |
| §§1.8–1.9 | Totally odd finite image versus infinite image; CM symmetric square | Finite-image scope made explicit; symmetric-power existence does not assert cuspidality. |
| §§1.10–1.15 | Sym⁰, Sym¹, Sym², dihedral/tetrahedral exceptions | Low-rank theorems retain their cuspidality exceptions; rank-five label corrected; R8 for primary fourth-power completion. |
| §§2.1–2.2 | Empty local set; additional prescribed split places; reducible residual symplectic representation | Disjoint extension and every imposed local condition belong to the construction; residual result is not a lift theorem. |
| §§2.3–2.6 | Coefficient prime equals geometric place; ℓ=n; nonordinary auxiliary prime | Prime inequalities and auxiliary-prime distinction retained; missing geometry R1/R2. |
| §2.7 | Regular but not extremely regular system; reducible direct sum | Constituent systems and common extension are needed; whole sum need only be isobaric; R6. |
| §2.8 | q=3,5,7; trivial torsion action; full level versus cyclic subgroup | q=3 twist has rational point/genus zero; q=7 X(7) and X₀(7) have different genera. |
| §2.9 | Remove any local-connects hypothesis; identify p and r | Seventeen switching assumptions retained; ordinary endpoint does not replace the required extension; R3. |
| §§2.10–2.11 | p=2; ℓ at the stated bound; singular HT weights | Potential diagonalizability, local lift and residual subgroup hypotheses remain explicit. |
| §§2.12–2.13 | GL-reducible but GSp-irreducible residual image; induced residual representation | Residual realization allowed; FKP primitivity/ordinary/cyclotomic hypotheses restored. |
| §2.14 | Even versus odd symmetric-power dimension; missing Conjecture B | Conditional status and parity retained; R3. |
| §§2.15–2.18 | Different local indices i; totally real versus CM primes; repeated HT weights | Prescribed lifts and avoidance fields use the matching index/field, with prime bounds retained. |
| §§2.19–2.22 | Reducible constituent; CM elliptic curve; rank-one symmetric power; absence of Conjecture B | Constituent and non-CM hypotheses distinguished from conditional general-field conclusions. |
| §§2.23–2.25 | Rank-one trivial character with a pole; degree-zero system; real odd rank 3 | Meromorphic versus entire separated; full factors need strict compatibility; rank parity retained. |
| §§2.26–2.29 | Auxiliary ℓ′=ℓ; missing ordinary filtration; two equal constituents | Seed, transport and semisimplification are different comparisons; ordinary lifting mapped correctly; R2. |
| §2.30 | n=1; coefficient prime at v₀; omit Steinberg monodromy | All-primes density now requires the missing comparison; principal GL₂ distinction used only for n>1; R7. |
| §§2.31–2.33 | Regular non-extreme system; ℓ=n; arbitrary nonordinary lift | Patrikis–Taylor scope and Qian ordinary local/prime conditions retained; R2/R6. |
| §§3.1–3.3 | Quadratic and order-three line; GL₂ determinant; empty/even/odd sign blocks | Symplectic versus orthogonal and determinant-one kernel distinguished before central quotient. |
| §3.4 | q=9,p=5; unramified N=0; regular nilpotent N of rank 3 | Residue factor corrected; packets need not be singletons. |
| §§3.5–3.6 | SO₁ empty parameter; SO₃ simple parameter; repeated summand; Yoshida transfer | Multiplicity-free/type/determinant requirements retained; discrete is not synonymous with general type. |
| §§3.7–3.8 | Coefficient degree one; total dimension 2[E:ℚ]; size-three inertial block | Conjectural eigenform realization is distinct from a known theorem; square-zero abelian inertia rejects the wrong realization. |
| §§3.9–3.10 | Split SO₂; SL₂ dihedral/Klein-four packet; nongeneric unitary parameter | Outer-automorphism quotient and packets of size 2/4 retained; restricted known KMSW input is not unrestricted classification. |
| §3.11 | GL₄ versus GL₂n; s=1 versus arbitrary 1+it; nonunitary twist | Analytic generalization and locator narrowed as above; R4/R8. |
| §§3.12–3.14 | Generic versus non-generic parameter; even orthogonal outer action; nontrivial ε_ψ | Distinguished s_ψ and multiplicity character are not replaced by identity; page ranges fixed; R5. |
| §§3.15–3.16 | Nonsplit odd orthogonal quadratic space; GSp versus PGSp | Inner form and similitude data retained; unitary comparison alone is insufficient. |
| §§3.17–3.18 | Regular-integral consequence alone; scalar lowest weight at a boundary | Necessary AJ conditions are not a definition; full parameter/lowest-weight conditions still required; R5/R8. |
| §§3.19–3.21 | Nongeneric parameter; real/complex versus nonarchimedean field; noncanonical bad/good split | Generic scope and canonical decomposition retained; irreducibility is not asserted for arbitrary standard modules. |
| §§3.22–3.25 | Yoshida and Saito–Kurokawa versus general type; reducible transfer; missing TWFL | Transfer/reducibility/descent preserve explicit classification assumptions; R5. |
| §§3.26–3.28 | λ=(1,0;2), λ₁=0, wrong parity λ=(1,0;1); reducible non-Eisenstein candidate | Chamber/parity and finite-level congruence corrected; unitary pairing requires actual twist and irreducible restriction. |
| §3.29 | a=b=2; b=2 gives repeated spin weights; normalizing twist | Half-integral spin weights agree with the specified infinitesimal character; singularity not erased by an invented regularity premise. |
| §§4.1–4.2 | n=1; CM or weight-one input | Symmetric-power existence and non-CM cuspidality distinguished; R1/R8. |
| §§4.3–4.5 | Trivial character with a pole; norms q=1; finite exceptional prime set | Nontrivial characters need boundary holomorphy/nonvanishing; actual prime norms exceed one; density-one does not mean every prime. |
| §§4.6–4.7 | Sym⁰ with ζ pole; Sym² middle sign +1; singleton/empty embedding type; unequal differences | Gamma and numerical weight conventions discriminate the wrong formulas; no element of empty type is fabricated. |
| §§4.8–4.10 | Nonunitary isobaric lift; supercuspidal local factor; determinant with wrong twist | Purity argument needs the actual unitary constituents; finite-place/local-type conditions retained. |
| §§4.11–4.12 | Mixed-parity twist; omit a dihedral auxiliary prime; rank two weight zero | Continuous twist need not be algebraic; all NT Proposition 6.1 conditions remain; R1. |
| §§4.13–4.15 | Trivial representation; bad prime in the sequence; Bianchi holomorphic q-expansion | Character criterion uses actual normalized good classes; Bianchi Fourier model is Whittaker/Bessel; conditional CG scope retained. |
| §§4.16–4.19 | CM form; supercuspidal component; cyclotomic avoidance fails; semistable bad place | Universal NT endpoint versus restricted earlier theorem distinguished; R1. |
| §§4.20–4.24 | Non-self-dual CM field input; Hilbert versus rational field; n=0 | Potential purity, full functoriality and Sato–Tate implications retain their respective hypotheses; positive degree for entireness. |
| §§4.25–4.26 | Parallel versus nonparallel weight; finite/infinite ψ; CM representation | Non-CM arithmetic group formula is separate from existing compact-group theory and classical Satake API. |
| §§4.27–4.30 | Good versus ramified Hecke prime; nonintegral ideal; fixed versus growing level/weight | Bounds and mass/prime equidistribution have different quantifiers; Harder comparison still needed; R4. |
| §5.1 | Nongeneric cusp form; wrong central character; rank-one boundary | Generic transfer and its image require the stated pole and character constraints. |
| §§5.2–5.3 | Trivial group; determinant map; map not preserving Weil projection; SL₂ packet size >1 | L-homomorphism includes Weil direction; general LLC is not a bijection of individual representations. |
| §§5.4–5.5 | Noncuspidal GL₂n input; absent pole; metaplectic central character | Generic/cuspidal/square-integrable and local-descent conditions retained; R4. |
| §§5.6–5.7 | Reducible r; finite-image line; equal semisimple Weil part with distinct N; nonquasicompact global sheaf | Cuspidal reciprocity needs irreducibility; categorical assertion distinguishes monodromy and support/Ind-completion; R5. |
| §5.8 | Nonunitary isobaric constituents; residue degree f>1; bounded set of n | Require unbounded powers and unitary constituents; cancel f from both eigenvalue and norm exponents. |

All 27 definition/construction Check blocks were read for discriminatory content, rather than merely counted. Examples distinguish the defined object from a plausible wrong one: lost Hodge multiplicities; characteristic versus Euler polynomial; unrestricted versus determinant-one signs; separate conjugations in the image sandwich; cuspidal versus isobaric lift; full versus cyclic level; degree versus rank; weak versus all-place matching; and stable categorical data versus a semisimple parameter function. None needed replacement by a vacuous existence or supplied-equality test.

## Lean signature and library checks

Suggested.lean remains unchanged: 230 lines, six real-bodied light definitions, fourteen theorem signatures and thirteen examples. No admitted data definitions, fake automorphic carriers, auxiliary theory development, `True` placeholders or conclusion-as-hypothesis were found. Heavy definitions remain in the README and are accounted for in the closing comment, including accessible refinements.

| Signature(s) independently checked | README match / boundary witness |
|---|---|
| `singularWeightHodgeList_length`, `_nodup_iff`, `_r_two` | k is natural and r integral; k+1 never vanishes. Repeated entries at r=2 retained. |
| `reciprocalEulerPolynomial_coeff_zero` | Semiring and actual monic Q; Q=1 works, nonmonic Q does not get constant 1. |
| `reciprocalEulerPolynomial_eval` | Field, arbitrary polynomial and x≠0; no evaluation at an inverse of zero. |
| `reciprocalEulerPolynomial_matrix` | Invertible matrix over a field, including Fin 0; characteristic degree matches matrix size. |
| `ProjectiveImageSandwich.bound` | Bound uses p^a, not p, with p prime and a,n≥1. |
| `ProjectiveImageSandwich.mono` | Only smaller positive rank m≤n; no rank-zero cusp assertion. |
| `ProjectiveImageSandwich.conjugation` | Change of basis composes the single simultaneous projective conjugation. |
| `orthogonalSignKernel_mem_iff` | Weighted parity sum modulo 2 is the actual carrier condition. |
| `orthogonalSignKernel_even` | Every dimension even, including empty index set, gives the full sign group. |
| `orthogonalSignKernel_one_odd` | Exactly one odd block gives the zero additive subgroup. |
| `IsParallelWeight.twist` | Add the same scalar to both entries at each embedding; their difference is unchanged. |
| `parallelWeight_independent` | Requires parallel difference; empty index type cannot supply τ or σ. |

The numerical witnesses and Sym² conjugation matrix agree with the README; the latter has trace +1 and determinant −1. Five examples have actual proofs. The remaining signatures/examples use `sorry`, so successful elaboration is not a truth certificate.

Pinned declarations were read locally: `Polynomial.reverse`, `Polynomial.eval₂_reverse_mul_pow`, `Matrix.charpoly`, `Matrix.trace`, actual PGL central quotient/scalar-extension maps and `Matrix.ProjectiveSpecialLinearGroup.toPGL`. Elaboration used Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and the shared Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369`.

Current-upstream duplication audit used roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti library `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The two full style models were RepresentationTheory/ClassicalGroups and RepresentationTheory/CompactGroups, with their Suggested files. All nine newer roadmaps and the four specified Completed roadmaps were screened by mathematical object and scope. Relevant local/profinite, Frobenius and monodromy matches were read; these do not supply the automorphic, Weil–Deligne, packet or categorical comparisons here. In particular ProfiniteArithmetic's compatible characters are not weakly compatible Galois systems, and the geometric Frobenius/integrability matches do not construct arithmetic monodromy.

The current elliptic Tate action and determinant declarations were read with their field, separable-closure, prime and characteristic hypotheses. The newly found Satake API is imported in the ownership boundary as described above. Standard symmetric/exterior powers, compact-group characters and Haar integration continue to belong to their existing upstream owners. **Target removals: none**; the new Satake citation supplies an existing rational specialization, while the retained endpoint has its stated CM-field or automorphic comparison scope. No Lake command was run in either current read-only checkout.

## Validation

- `lean-check` on the absolute Suggested.lean path: exit 0; 22 warnings, all `declaration uses sorry`, with no other warning or error. Available memory before the single elaboration was 106 GB. Suggested.lean was not changed afterwards.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ModularityAndLanglandsExtensions/Suggested.lean`: exit 0.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularityAndLanglandsExtensions.json`: exit 0, zero errors/warnings. The unchanged packet still has six planned and zero closed stages, fourteen gaps and sixty-one requests. This checker result does not override the closure findings.
- Independent inventory/link audit: all 142 input anchors retained once, all 201 explicit anchors distinct, all 895 internal links resolved, 151 API bullets and 110 Checks retained, every definition/construction has at least three Checks. No numbered target has a prerequisite in a later numbered subsection. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` id remains in the README.
- Exhaustive small numerical Hodge check: 135 instances, k=0,…,8 and r=−6,…,8; all match the duplicate-free criterion. Empty/one-odd/two-odd sign cases and q=9 normalization also computed independently.
- `metadata.toml` remains `topic = "math.NT"`, appropriate for these endpoints.
- Deliverable intake and whitespace checks are recorded in the accompanying handoff. Only the package README, its review verdict, this report and this review's handoff are changed.

The review is complete. An accepted verdict requires resolving R1–R8 at the precise contracts above; a successful `sorry` build and a valid packet do not establish those contracts.
