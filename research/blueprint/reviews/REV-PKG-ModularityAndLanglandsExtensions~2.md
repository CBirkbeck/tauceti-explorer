# Independent package review: ModularityAndLanglandsExtensions, round 2

**Verdict: needs_changes.** The review is complete. The package is not ready for an upstream draft: six required supplying roadmaps are absent, several available suppliers do not establish the stronger comparisons requested here, and primary-source obligations remain. The compact Lean file elaborates, but that does not discharge these mathematical prerequisites.

Issue [#9885](https://github.com/CBirkbeck/tauceti-explorer/issues/9885); reviewer Codex, session `codex-YyKNJP`; 2026-10-17. The [bot confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9885#issuecomment-6236374750). Input commit: `2b9d356ca`. I did neither package job. I read the accepted packet, the preceding independent review and the round-2 handoff, then independently checked the package and the supplier scopes below. The round-2 input explicitly describes itself as incomplete. This is a completed fixing review with an adverse verdict, not a package-revision checkpoint.

The reviewed [README](../packages/ModularityAndLanglandsExtensions/README.md), [Suggested.lean](../packages/ModularityAndLanglandsExtensions/Suggested.lean) and [metadata](../packages/ModularityAndLanglandsExtensions/metadata.toml) retain their mathematical specification. The packet, reader document and neighbouring packages were not edited.

## Fixes made

1. **Real scalar packets, §3.18.** Mœglin–Renard's module is a highest-weight module with generating K-type `(−k,…,−k)`. The positive holomorphic lowest-weight convention uses its contragredient. Removed the unrelated global RAESDC premise from the local membership argument and added explicit parameter tests: the trivial `g=1,k=0` module and, for `g=2`, a parameter containing the `k=2` module but not the `k=1` module despite identical infinitesimal characters. Primary checks: Mœglin–Renard Theorems 7.1–7.2, p. 19, conventions pp. 1–6; Chenevier–Taïbi §5.2.2, pp. 303–305.
2. **Equidistribution, §4.3.** Restored integer norms and absolute convergence of the representation Euler products in Kedlaya's hypotheses. Specified enumeration in nondecreasing norm order. A bounded tie contributes at most `M dim ρ` to a character sum; the norm-cutoff theorem does not license arbitrary reordering. Added trivial-character, two-class and tie-cutoff Checks. The Weyl consequence is a deduction, not an attribution of a proved theorem to Kedlaya's Conjecture 24.3.
3. **Rank-one endpoints, §§1.9 and 4.16.** The standing range for NT II's rank-n theorem is `n≥1`; the `n=1` case is the original GL₂ representation. Its analytic corollary is still stated in the source's range `n≥2`. Added trivial rank-one and identity rank-two parameter Checks to the all-place lift definition.
4. **Available supplier scopes.** Mapped ET's old contract labels to the actual transfer, unitary trace, local-parameter and base-change sections. Mapped the real-representation contract to AF Layers 2 and 6. MP §3.7 already states nonarchimedean Howe duality including dyadic fields: it must not be described as merely elementary theta modules. The missing real comparison and GRS descent remain explicit. GL2ModularityLifting §5.7 now contains a precise Hilbert potentially Barsotti–Tate lifting theorem; the contract records its strong residual modularity, cyclotomic, residue-field, exceptional p=5 and ordinary-component requirements.
5. **Cyclic automorphic induction.** Added the primary Arthur–Clozel source: Chapter III Definition 6.1/Theorem 6.2, p. 215; Lemma 6.4, pp. 217–218; Corollary 6.5, p. 218. These establish almost-everywhere induction and the orbit/stabilizer cuspidality alternative in the induced-from-unitary-cuspidal class. The all-place Weil-parameter assertion remains a distinct supplier obligation. Uniqueness from almost-everywhere factors does not prove ramified or archimedean local compatibility.
6. Removed residual acceptance/instruction wording from the mathematical README. No source passage, local filesystem path or source asset was added. Suggested.lean and metadata are unchanged.

## Remaining repairs

The R-numbers below refer to the preceding review, but their status reflects the present supplying files, not their historical state.

| Item | Independent finding and exact next repair |
|---|---|
| R1 — absent owners | No packet/package supplying the six contracts exists for `SymmetricPowersByAnalyticContinuation`, `SymmetricPowersByUnitaryLevelRaising`, `SymmetricPowerAutomorphyLifting`, `SymmetricPowersByTensorFunctorialityLifting`, `PotentialAutomorphyDworkMotivesPartII` or `OpenImageTheoremsForAbelianVarieties`. Establish these owners and their permitted tier/bundle exports, or change ownership through an authorized plan revision. Their names and quoted endpoint theorems do not close the eigenvariety, level-raising, tensor, Dwork and open-image proofs. |
| R2 — Dwork at the coefficient prime | Supply semistability and the regular ordinary filtration at `v(t)<0` for the coefficient-prime realization, then preserve the required Hodge multiset and lattice filtration through local subquotients and global semisimplification. Qian thesis Remark 3.0.13, p. 55, distinguishes this from auxiliary-prime monodromy; Remark 4.0.4, p. 65, prevents a shortcut from an auxiliary ordinary realization to automorphic ordinarity. Resume §§2.3–2.5, 2.26, 2.29 and 2.32–2.33. |
| R3 — lifting scope | PA §§5.22–5.23 genuinely provide the ACC+ Fontaine–Laffaille and ordinary endpoints. They do not provide BCGNT Theorem 3.2.1's component-wise local connects relation, Caraiani–Newton Theorem 1.3's potentially semistable branch with AKT residual modularity and the X₀(15) application, or CG Theorem 5.16's conditional general-number-field branch. Supply those exact exports for §§1.5, 2.9, 2.14 and 2.20. |
| R4 — analytic/cohomological/theta comparisons | AL §4.3 constructs unramified representation factors and convergence, not the required analytic continuation/nonvanishing or converse-theorem inputs. ALS's Hecke correspondences and general automorphic-cohomology comparison need the exact Harder Bianchi/parabolic comparison of §4.14; the parallel-weight-one Galois attachment needs its specified export. MP's nonarchimedean duality does exist, but its own §3.7 leaves original archimedean Howe/automatic-continuity comparisons open; it does not close the real theta input to §3.18 or the GRS descent. |
| R5 — classification and categorical suppliers | ET Layers 4, 6, 10 and 11 provide substantial transfer, unitary trace and packet material. Full weighted/twisted stabilization and the requisite local intertwining identities still need exports in each consumed group/parameter scope. AF Layers 2 and 6 contain discrete-series and coherent representation theory, but not the full AJ parameter/induction/character-map construction requested by §3.17. ES5 supplies a semisimple parameter map, not the stable-category adjunction and singular-support equivalence of FS I.10.2. Preserve TWFL and the nongeneric KMSW hypotheses. |
| R6 — exact rank-two witness and constituent systems | The Hilbert pBT export is now present in GL2ModularityLifting §5.7; remove the older claim that no precise export exists. Match the actual modular witness in BCGP Proposition 10.1.3 to its local/exceptional hypotheses, rather than applying a generic lifting label. Independently, PMCS's pure *extremely regular* BLGGT statement does not give Patrikis–Taylor's merely regular pure polarized constituent systems over one common avoidance extension. Construct that latter export for §§2.7 and 2.31; a reducible direct sum need not itself have a cuspidal realization. |
| R7 — two-place repair checked | The finite-set variant in §§2.13 and 2.30 repairs the one-place argument: choose two trivial Steinberg places of distinct residue characteristics. For every new coefficient prime one is away from it, so strict **ramified** compatibility transfers maximal monodromy there. FKP Theorem E accepts simultaneous finite local prescriptions, and Proposition 9.1's Moret–Bailly construction accepts both negative-valuation conditions. This mathematical repair is sound conditional on the named local-prescription and strict-compatibility suppliers; weak good-place compatibility alone still does not suffice. No error in FKP's published theorem is asserted. |
| R8 — primary verification | Clozel's weight/conjugation locators, the AJ defining data and Arthur–Clozel's almost-everywhere existence/orbit criterion have primary support. Still obtain the corrected Khare 1997/1999 descent proof, BHR Proposition 5.3.7, Henniart 2009's completed comparison, Kim 2003/2004, the all-place induction comparison and the general-rank exterior-square analytic theorem. These are explicitly delimited, not certified by later citations or bibliographic metadata. |

These are supplying constructions and ownership decisions outside the review's editable paths. The tier order places this roadmap at 26, with GL2ModularityLifting, PMCS and PA below it. PA Part II **does exist**, with PL.0–PL.9 targets; it, MP and ES lie outside the 94-roadmap order and need an allowed upstream placement. AG Part II and TorsionCohomologyInfrastructure have downward moves from this roadmap recorded in the order file; preserve those moves when repairing ownership. No upward supplier was introduced. References from an import contract to its later definition describe the interface and are not an earlier construction of it.

## Source checks

The fixed random sample is `random.Random(9885).sample(packet["nodes"], 15)`. It differs from the preceding review's sample. All fifteen targets and their cited primary statements were read; an unsupported stronger comparison is reported explicitly below. Page numbers are printed/arXiv page numbers unless marked PDF. These checks establish locators, hypotheses and the comparisons described, not every proof of every classification theorem.

| Sample | Primary location read | Result |
|---|---|---|
| KMSW inner forms, §3.13 | arXiv 1409.3731v3, Theorem* 1.6.1 pp. 80–81; Theorem* 1.7.1 pp. 88–89; Chapter 5 pp. 205–206 | Fixed real form versus union of inner forms, generic pure-inner global scope and the two additional nongeneric inputs remain distinguished. |
| Completed symmetric-power L, §4.6 | NT II v2 Corollary B p. 2; Dummigan–Martin–Watkins §§2–3 pp. 1314–1317; Martin–Watkins §4.2 PDF p. 7 | Bad factors, conductor and real gamma parity are part of completion; degree zero has a zeta pole. |
| Expected crystallinity, §0.6 | Cleared Pilloni manuscript, Remark 5.3.2 and surrounding comparison, author pp. 25–26 | Expected de Rham/crystalline assertions remain conjectural; the Newton/Hodge inequality is not promoted to their proof. |
| PD local lifts, §2.10 | BLGGT v4 Theorem 4.3.1, p. 55 | Odd coefficient prime, split local set, cyclotomic irreducibility, multiplier and PD Hodge constraints retained. The random node's id ends in `pd-lifts`, not §2.11's endpoint. |
| Dwork Steinberg/ordinarity, §2.4 | Qian thesis §4.0, pp. 64–65, including Remark 4.0.4 | Maximal auxiliary monodromy, the local-global bound and the ordinary central-character calculation have different roles. |
| One-prime criterion, §4.4 | NT Hilbert v2 Lemma 2.1, pp. 9–10 | All-place lift equivalent to one/every coefficient realization; coefficient-isomorphism change uses the conjugate automorphic representation. |
| Qian auxiliary choice, §2.3 | arXiv 2104.09761v1 Proposition 4.1, pp. 21–22 | Congruence, size, unramifiedness, image and avoidance hypotheses retained; arbitrary ordinary primes do not replace the auxiliary choice. |
| Automorphic induction contract | Arthur–Clozel III §6 pp. 214–219; Arthur 2003 §4 pp. 44–45 | Added correct primary existence/orbit locators. Arthur's Artin-conjecture paragraph does not prove induction; the all-place extension remains open. |
| Patrikis–Taylor, §2.7 | Author manuscript Theorem A p. 2; Theorem 2.1 p. 12 and Corollary 2.2 p. 13 | One common CM extension for a finite family, avoidance and constituent systems; no claim that their reducible sum is cuspidal. |
| Finite-image deformation points, §1.4 | CG arXiv 1207.4224v2 Lemma 4.14, pp. 52–53 | Finite image at all characteristic-zero points plus finitely many points gives reducedness after inverting p; a weight-one label alone does not. |
| Scalar real packets, §3.18 | Mœglin–Renard v4 Theorems 7.1–7.2 p. 19; Chenevier–Taïbi §5.2.2 pp. 303–305 | Highest-weight/contragredient convention and purely local hypotheses repaired; three discriminating membership Checks added. |
| Local Arthur packets, §3.12 | Arthur manuscript Theorem 1.5.1 pp. 41–43 and Theorem 2.2.1 pp. 65–66; Mok v5 Theorem 2.5.1 PDF p. 32 | Packet multisets and tempered parameterization scopes retained; the p-adic bijection is not asserted for a fixed real form. |
| Twisted modular curve, §2.8 | CG §10, pp. 97–98 | Full-level twist and its rational point, not X₀(q); genus-zero cases q=3,5 do not extend to q=7. |
| Compatible system from PA, §2.30 | FKP v5 Theorem E pp. 5–6 and Proposition 9.1/proof pp. 41–43; BLGGT v4 Theorem 5.5.1 | Two local conditions can be imposed simultaneously; one is away from any chosen coefficient prime. |
| Arthur hypothesis register | BCGP 2021 v3 §1.4.1 p. 14; BCGP 2025 v1 §1.6 pp. 7–8; AGIKMS v3 §0.4 p. 15; Arthur Preface pp. xvi–xvii and Hypothesis 3.2.1 p. 137 | TWFL is retained after the newer intertwining work; ordinary fundamental-lemma transfer is not a substitute. |

Additional checks covered the author's unverified list and the previous review's unresolved inputs:

| Input | This run's primary reading/access result |
|---|---|
| Clozel | Editor's public scan: Theorem 3.13 p. 112 and Lemme 4.9 pp. 144–145, read visually. Conjugation permutes the infinity weight, and purity here is archimedean. No claim to have audited all pp. 112–129 of the conjugation proof. |
| AJ87 | Numdam primary paper, pp. 277–281, 285–286 and 305–308: induction degree, root inequality, transported character, Weyl double cosets, admissible parameter factorization and unequal-rank reduction checked. The full character-identity proof and AF carrier are separate. |
| HSBT | Annals primary PDF, Theorem 4.2 and proof, p. 809: abelian variety with RM and a multiplicative place; Brauer argument does not itself state a theorem for arbitrary systems. |
| Taylor parity | ANT primary PDF, Theorem 1.1/Proposition 1.2, pp. 409–410: odd rank, RAESDC realization and irreducibility are essential. |
| Caraiani | arXiv 1202.4683v1 Theorem 1.1 p. 1 and arXiv 1010.2188v1 Theorems 1.1–1.2 pp. 1–2: cohomological conjugate-self-dual CM scope, with p=ℓ and p≠ℓ kept separate. |
| Buzzard–Kilford | Author `annuli.pdf`, Theorem A p. 2: full eigencurve indices start at zero; the cuspidal restriction cited through NT I has positive indices. The boundary is open. |
| Anastassiades–Thorne | Cambridge author manuscript Theorem 5.1 pp. 19–20: everywhere-unramified CM extension, split ramification, Steinberg congruence and excluded residual character-twist shape checked. |
| Allen–Newton–Thorne | arXiv 1912.11269v2 Theorem 1.1 pp. 1–2: all eight hypotheses, including ordinary modular witness, residual constituents, primitivity, cyclotomic exclusions and ℓ>3, ℓ∤n. |
| Newton–Thorne Selmer | arXiv 1912.11265v2 Theorem A p. 2: enormous image on the infinite cyclotomic extension, and the adjoint extension with negative adjoint action of complex conjugation. |
| Schmidt | 2017 author PDF §2.3 pp. 2390–2391: λ=(p,0), p>0, minimal holomorphic K-type (p+1,2). 2018 author PDF §§1.1–1.2 pp. 3088–3092: six parameter types, parity and local packet restrictions. |
| Qian coefficient comparison | Thesis Lemma 3.0.12/Remark 3.0.13 p. 55 and Remark 4.0.4 p. 65 read directly. These locate R2; they do not construct the missing comparison. |
| Rank-two residual application | BCGP v3 Proposition 10.1.3/proof p. 266: the residual and ordinary modular-witness arguments must accompany the available Hilbert lifting theorem. |
| Khare and corrigendum | Oxford 1997 access route and 1999 DOI did not yield the corrected proof. KW I §10.1 pp. 20–21 read as secondary application, not a replacement. |
| BHR | Duke DOI/author publication record did not yield Proposition 5.3.7's proof. Cleared Pilloni comparisons were read in place. Exact primary proof/page remains open. |
| Henniart | Journal route timed out and attempted linked PDF was not obtained. No full finite-place proof was certified from its abstract. |
| Kim 2003/2004 | AMS PDF refused access; Springer 2004 route provided metadata rather than proof. Both primary-proof obligations remain open. |
| General exterior-square analysis | AL's actual construction and BCGP's GL₄ s=1 application do not close the requested all-rank theorem; retain the separate analytic supplier obligation. |

The cleared Pilloni file was read at its supplied location, with no copy or extracted passage saved. All descriptions in the deliverables are original. The public-source fingerprints below preserve provenance without retaining PDFs or extracted text.

## Adversarial mathematics and definition Checks

I walked all 121 numbered targets and 21 front-matter targets, including every convention, API and Check. The table groups related targets to expose the actual test rather than claim truth from elaboration. Every numbered target occurs in one row; the following front-matter table accounts for the remaining 21.

| Targets | Instances and failure modes tested | Outcome |
|---|---|---|
| 0.1–0.3 | Empty condition list; conditional versus known constructor; trivial rank-one Euler factor; weak versus strict ramified compatibility; changing coefficient isomorphism | Empty conditions do not change a constructor; actual implications and realization comparisons still required. |
| 0.4–0.6 | k=0; r=2; negative r; zero/constant/linear polynomials; x=0; repeated Hodge numbers; conjectural crystallinity | Lists retain multiplicity; exact three collision equations; inverse evaluation excludes zero; conjecture remains separate. |
| 1.1–1.5 | Trivial Artin representation; reducible finite image; even complex conjugation; p=2/5; finite versus infinitely many characteristic-zero deformation points; X₀(15) hypothesis | Cuspidal Artin assertion keeps irreducibility/odd scope; exact lifting and curve-analysis gaps R3/R6 remain visible. |
| 1.6–1.9 | Identity R; rank-one trivial lift; ramified identity lift; p^a=5 versus 7; a=0; p=2,a=3,n=4; one common conjugation/field embedding | All-place identity survives ramification; strict cardinality bound excludes 5, not characteristic 2. Added identity Checks. |
| 1.10–1.15 | CM Sym² decomposes; isobaric tensor product; degrees 0–4 versus ranks 1–5; exterior-square bad places | Cuspidality not inferred from existence; Henniart/Kim and analytic gaps retained. |
| 2.1–2.3 | Empty local set; incompatible prescribed completions; coefficient versus auxiliary prime; ℓ′ congruence and scalar outside cyclotomic field | Moret–Bailly needs realizable local points and avoidance; auxiliary choices are not arbitrary. |
| 2.4–2.6 | Maximal N at auxiliary prime versus coefficient prime; semisimplification; automorphic/Galois ordinary distinction; residual irreducibility | R2 persists; source's Steinberg ordinary calculation does not construct every transport. |
| 2.7–2.9 | Reducible pure sum; finite family and common extension; q=3,5 versus 7; residue cardinality versus coefficient characteristic; local connects | Constituent cuspidality distinguished from isobaric sum; X_E(q) is full-level; R3/R6 retained. |
| 2.10–2.12 | ℓ=2; bound ℓ≥2(d+1); repeated HT weights; multiplier at complex conjugation; prescribed local indices | PD/residual conditions carried by actual subgroup and local place; no small-prime extension inferred. |
| 2.13–2.14 | Two Steinberg places with distinct residue characteristics; n=1; finite local prescriptions; arbitrary number field | Two-place repair valid; general-field modularity remains conditional. |
| 2.15–2.19 | Local weight change without residual automorphy; rank one; extremely regular versus regular pure; constituent polarization | BLGGT hypotheses retained; PT supplier cannot be replaced by extreme regularity. |
| 2.20–2.23 | General-number-field assumptions; weak versus cuspidal automorphy; degree-zero zeta pole; virtual Brauer exponents | Conditional scope preserved; meromorphic conclusion not silently made entire. |
| 2.24–2.28 | Choice of compatible-system member; density one versus every prime; tensor of two copies; reducible constituents | Strict compatibility and irreducibility scopes remain distinct; tensor cuspidality needs its source hypotheses. |
| 2.29–2.33 | Auxiliary ℓ′ versus ℓ; monodromy at ℓ=q₀, then ℓ=q₁; nonordinary excluded local lifts; n=1 | Second place repairs monodromy argument; Dwork coefficient-prime filtration still a missing construction. |
| 3.1–3.4 | Orthogonal versus symplectic square pole; empty sign index; one odd/even block; two odd blocks; q=9 versus p=5; N=0 | Determinant constraint precedes quotient; q^(3/2)=27 is local normalization, not 5^(3/2). |
| 3.5–3.8 | Repeated summands; wrong dual-group parity; global determinant character; Yoshida versus general type; weight (2,2) frontier | Non-discrete/repeated parameters excluded; conjectural RM realization not asserted as known. |
| 3.9–3.14 | Fixed real form versus all forms; tempered versus general A-packet; multiset versus set; generic versus nongeneric global parameter | Arthur/Mok/KMSW scopes and hypothesis gate retained; R5 supplies missing comparisons. |
| 3.15–3.16 | Split/non-split quadratic spaces; pure-inner enhancement; similitude central character | Vogan union and similitude quotient data not replaced by a split packet. |
| 3.17–3.18 | Rank-one induction; wrong root sign/degree; necessary parameter conditions versus full AJ data; g=1,k=0 and g=2,k=1,2 | AJ construction remains required; scalar highest/lowest-weight convention corrected and discriminating packet examples added. |
| 3.19–3.23 | Non-generic A-parameter; generic standard module; unitary versus arbitrary induction; full discrete versus tempered spectrum | Generic multiplicity claim not extended to all parameters; TWFL and exact intertwining conditions retained. |
| 3.24–3.29 | Reducible nongeneral-type Galois representation; tempered infinity and cuspidality; λ=(1,0;2), λ₁=0, wrong lattice parity; pairing through a lattice | Holomorphic positive chamber and residual pairing require their actual comparisons; source gaps remain explicit. |
| 4.1–4.4 | n=1; CM/weight one; trivial character pole; C₂ character; tie cutoff; arbitrary reordering; conjugate coefficient embedding | Fixed norm-order/absolute-convergence hypotheses and added character/tie Checks. |
| 4.5–4.8 | Density one versus all primes; Sym⁰ pole; Sym² middle sign; two conjugate pairs of differing weight; fixed n versus infinitely many n | Gamma and purity scopes sound; nonparallel higher-degree CM witness rules out an overbroad purity inference. |
| 4.9–4.12 | Supercuspidal local component; CM exceptional case; determinant ε^−m; weight zero; finite local list | Method-owner gaps and determinant/local conditions preserved. |
| 4.13–4.16 | Normalized SU₂ class; torus/CM alternatives; weight k<2; Bianchi parabolic versus full cohomology; rank-one identity | Known and conditional equidistribution separated; rank range repaired, Harder comparison still required. |
| 4.17–4.24 | Totally real versus CM fields; conjugate-self-dual versus arbitrary GL₂; degree 6/8 versus rank 7/9; conductor factor nonzero | Imported symmetric-power method scopes retained; no ownership closure inferred from endpoint names. |
| 4.25–4.30 | Weight two; trivial versus nontrivial central character; one pair versus many CM embeddings; cusp versus Eisenstein class; level-one mass condition | Coefficient and Hecke/cohomology realizations must be the same object; R4 remains. |
| 5.1–5.5 | Generic versus nongeneric; wrong square-L pole; split classical versus arbitrary group; metaplectic genuine representation | GRS/Howe constructions still needed; known transfer does not settle arbitrary functoriality. |
| 5.6–5.8 | Rank-one reciprocity; torus categorical specialization; ordinary versus stable category; bounded powers versus unbounded symmetric degrees | Frontier predicates remain conjectural; semisimple map not categorical equivalence; limiting exponent requires unbounded degrees. |

| Front-matter targets | Witness / boundary checked |
|---|---|
| Polarization; edition concordance | n=2 at algebraic weights 0 and 1 gives the same odd multiplier only after the conjugation sign correction; v1/v4 numbering distinguished. |
| Symmetric-power lifting; accessible refinements | Rank one is trivial; rank two identity; CM decomposition may be noncuspidal; repeated refinement characters fail n-regularity. |
| Component propagation; Buzzard–Kilford; one-to-all; theta level raising; one seed; n-regular congruences; symmetric-power lifting | Classical point and refinement hypotheses travel together; BK indices include ordinary zero before cusp restriction; p=577 satisfies the n=3 congruence modulus 288; NT II bound is on p^a and permits p≤n. These seven method imports remain R1 obligations. |
| TWFL; archimedean reciprocity | Proven unweighted FL does not imply TWFL; χ(x)=sgn(x)|x|^t restricts to |z|^(2t) over ℂ, losing sign. |
| System Euler/gamma factors; Frobenius/duality | X−1 versus 1−T at 1/2; Sym² conjugation has trace +1 and determinant −1; geometric inversion does not dualize the Tate module. |
| Rational odd Artin; field/weight boundaries | Even complex conjugation does not give holomorphic weight one; an arbitrary number field does not inherit totally-real modularity. |
| Trace/intertwining inputs; symplectic classification input | Nongeneric parameter and arbitrary inner twist require more than generic pure-inner KMSW; full stabilization is a separate construction. |
| Cyclic base change; automorphic induction | Quadratic character restriction forgets a real sign; Galois-invariant inducing character has smaller orbit and noncuspidal induction; almost-everywhere uniqueness does not establish all-place comparison. |

The 27 definition/construction targets each have at least three discriminating Checks; all 151 API names and all 142 target anchors are retained. Checks test actual objects rather than supplied equalities: zero/degenerate rank, nonexamples, repeated roots/weights, wrong parity, ramification and alternate normalizations. Accessible refinements retain their additional Checks. A direct numerical audit covered 1,329 small Hodge-collision, determinant-sign and distinct-characteristic selection instances. These computations supplement the mathematical pass; they are not proofs of the source theorems.

## Lean signatures and current-library boundary

Two full style models read were upstream RepresentationTheory.ClassicalGroups and RepresentationTheory.CompactGroups, including their Suggested files. The target file has 230 lines, six light definitions, fourteen theorem declarations and thirteen examples. Its real bodies use existing lists, polynomials, matrix groups, finite sign functions and integer weights. The additive subgroup proof is light packaging of an existing carrier. There are no admitted data carriers, abstract replacement predicates for missing theories or auxiliary theory development. The closing comment lists the heavy README-only definitions.

| Signature checked | README agreement and adversarial witness |
|---|---|
| `singularWeightHodgeList` / `_length` | Four entries, repetitions retained; (k,r)=(0,2) gives [0,0,1,1]. |
| `_nodup_iff` / `_r_two` | k:ℕ, r:ℤ; k+1 cannot vanish; precisely the three listed collision equations. |
| `reciprocalEulerPolynomial` / `_coeff_zero` | Actual-degree `Polynomial.reverse`; monicity gives constant coefficient one, including Q=1. |
| `_eval` | Field and x≠0 explicit; multiplying by the inverse power gives Q(x⁻¹), with no zero-division shortcut. |
| `_matrix` | A genuinely invertible matrix; n=0 gives determinant and constant polynomial one. |
| `ProjectiveImageSandwich` | Same finite field, embedding and conjugation in both subgroup inclusions; positive a/n and prime p explicit. |
| `.bound` / `.mono` | Strict p^a>max(5,2n−1); rank decreases only to positive m. |
| `.conjugation` | Conjugate actual GL₂ representation, transported to PGL₂ through the quotient map. |
| `orthogonalSignKernel` / `_mem_iff` | Weighted additive parity equals multiplicative determinant-one condition. |
| `_even` / `_one_odd` | All-even blocks give top; one odd block gives bottom; empty index gives top. |
| `IsParallelWeight` / `.twist` | Any index type and numerical weight only; adding an embedding-dependent scalar cancels from differences. |
| `parallelWeight` / `_independent` | k=λ₁−λ₂+2; independence requires the parallel predicate, not a claimed automorphic attachment. |

Read the pinned Mathlib declarations, not just their names: `Polynomial.reverse`, `coeff_zero_reverse`, `eval₂_reverse_mul_pow`; `Matrix.charpoly`/`eval_charpoly`; `Matrix.trace`; `Matrix.ProjGenLinGroup.mk`/`map`; `Matrix.ProjectiveSpecialLinearGroup.toPGL`. Their domains, inverse direction and scalar assumptions match the retained signatures. Shared Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; configured Tau Ceti build pin: `f790474821cf4256814db967cb154e7af3d0c369`.

Duplication was checked separately against current upstream roadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. I searched by mathematical objects and read matching statements in all nine named newer roadmaps and their Suggested files, including OperatorTheory's separate subfiles, and the four named Completed roadmaps. The wider Completed search also encountered HodgeStructures, Multiquadratic and UniversalCovers; their Hodge/field/covering foundations do not assert these automorphic endpoint comparisons.

The relevant current-library hits are the elliptic Tate-module representation, Weil pairing/determinant and rational newform Satake API. The determinant requires a separably closed extension and ℓ invertible; H¹ is the rational cohomological dual. Satake parameters retain multiplicity, including the bad-prime zero root; `satakeAngle` assumes prime p, real a_p and a Ramanujan bound, and the exponential parameter theorem additionally requires trivial local nebentypus. None proves CM Sato–Tate or the bound itself. Existing boundaries already import them. The finite GL₂ character-table hit is representation theory of a finite group, not local Langlands. No distinct endpoint target duplicated a current declaration or required removal.

`data/library-coverage.json` has no layer keyed to this roadmap, but does mention five overlaps in other audits: rational weight-one/Deligne–Serre and rank-two base-change/monomial induction. These are already supplier boundaries, not newly planned constructions. The broader Artin predicate and all-rank induction contract differ in scope. No stub or replacement foundational theory was added; no Lake command was run in either current checkout.

## Validation

- `lean-check research/blueprint/packages/ModularityAndLanglandsExtensions/Suggested.lean`: exit 0; 22 warnings, all `declaration uses sorry`, no errors or other warnings. Suggested.lean did not change afterwards.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularityAndLanglandsExtensions.json`: 0 errors, 0 warnings. The unchanged packet has 142 nodes. The checker counts 136 API items and 98 tests on definition/construction nodes; the all-node totals used in this report are 151 API items and 110 tests.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/ModularityAndLanglandsExtensions/Suggested.lean`: exit 0.
- Final README inventory: 121 numbered subsections plus 21 front-matter targets, 204 distinct explicit anchors, 907 internal links, no missing target anchor/API name or broken internal link. All 27 definition/construction targets have at least three Checks. There are 34 Checks blocks, up from 32; none was removed.
- `python3 research/blueprint/intake.py check-files` on the four changed deliverables: 4 files, 0 problems. `git diff --check`: exit 0. No packet, reader document, neighbouring package or source asset changed.
- `metadata.toml` remains exactly `topic = "math.NT"`.

The handoff preserves the remaining supplier repairs and the primary locators needed to resume. This review does not approve forwarding the package to TauCetiRoadmap.

## Public-source provenance

Accessed 2026-10-17. Hashes identify the public PDFs read for the locators above; they do not certify unexamined proofs. Failed access attempts are listed in the source-check table, without a claim to have read their texts. The restricted Pilloni author copy is identified by the cleared library catalogue and its statement/page locators, without reproducing it.

| Public file/version | SHA-256 |
|---|---|
| [adams-johnson-1987](https://www.numdam.org/item/CM_1987__64_3_271_0.pdf) | `4c5a4c42a0254d9efb06119d7bff2725582605be84a772ca3807355ef341e849` |
| [adjoint-selmer](https://arxiv.org/pdf/1912.11265v2) | `8a495edca1791edcbdf94783e799616b837d6f88c77847f3ab93f8bf541d53c5` |
| [agikms-2024](https://arxiv.org/pdf/2410.13504v3) | `7aef44234d64dd4ba0099989d20ad945b4d692287da4d29cff289862b2945b23` |
| [allen-newton-thorne](https://arxiv.org/pdf/1912.11269v2) | `077a344352c80389ce75d5c61a69fba90413303aca911a616fe46dbeb8514bfa` |
| [anastassiades-thorne](https://api.repository.cam.ac.uk/server/api/core/bitstreams/390b6779-8e4f-40b4-95bc-2e999c59cd2d/content) | `9a26f24839c896775b1b69dadfee6ed2bf83348f8adf5e539073844263e39fac` |
| [arthur-2003](https://www.claymath.org/library/cw/arthur/pdf/57.pdf) | `bba47c00934e711f40424ddd4e67229b73f7763a0c3df71cb06ee9fed4248e5e` |
| [arthur-2013-archive](https://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf) | `e8227d7c636903c568b6903b5d585edb912028f27c52d8687f463aaef8e1275f` |
| [arthur-clozel-1989](https://www.claymath.org/library/cw/arthur/pdf/30.pdf) | `3033d863634f5a1e8c26e48ba5b5ec9d8f95fb411b2a6d21c1580db80bc01737` |
| [bcgnt-2025](https://arxiv.org/pdf/2309.15880v3) | `0ad015dfe35d40489a2b8b462ac93d5dd715dbbae7d3fbf18377beaed654579d` |
| [bcgp-2021](https://arxiv.org/pdf/1812.09269v3) | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` |
| [bcgp-2025](https://arxiv.org/pdf/2502.20645v1) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` |
| [blggt-2014-v4](https://arxiv.org/pdf/1010.2561v4) | `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24` |
| [buzzard-kilford](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/annuli.pdf) | `d3615813aaa4d79bbe59bc1d55b3ea25c5cb0fac098b5f9982868b498e7af181` |
| [caraiani-2012a](https://arxiv.org/pdf/1202.4683v1) | `6ec698414d5d3ad03f3d1c98de178b39d69722699f4a08a059e8d14027df885e` |
| [caraiani-2012b](https://arxiv.org/pdf/1010.2188v1) | `769e68e2384b42caf16861d9011b35afe48018eba006074ce0d6c4111451f3b3` |
| [cg-2018](https://arxiv.org/pdf/1207.4224v2) | `67896c853258801967270f8927e5bb33c0315989d3a4188d53435a9305993ebb` |
| [chenevier-taibi-2020](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf) | `ea90fb0faabeaaa56be15f2c6f9c22450e7891c2181130fd79fe356cd83ba3de` |
| [clozel-1990](https://www.jmilne.org/math/Books/AA1988a.pdf) | `ed6ec30fc1f53f7c8ac4276ef449e1cad3ab42457bf5b7ee90a33413345ff96c` |
| [dmw-2009](https://archive.intlpress.com/site/pub/files/_fulltext/journals/pamq/2009/0005/0004/PAMQ-2009-0005-0004-a005.pdf) | `2117e594cb278522034646bcde9eb533139eac3ba08e23d2fc40c6f40f059d13` |
| [fkp-2022](https://arxiv.org/pdf/2008.12593v5) | `6c260021acef4649492892fc266f703aa69401879bf87e1c2492bf2ef24ff1e2` |
| [hsbt](https://annals.math.princeton.edu/wp-content/uploads/annals-v171-n2-p04-p.pdf) | `5e3fc579911961071bb7e7f7a7a4f4154d621d0abccafcf4d03702fbcfb3d1ab` |
| [kedlaya-ant-2025](https://kskedlaya.org/papers/ant-ptx.pdf) | `7a934fce8272cedd36ad609f79bbe79af0056320bb1e0bc690c87af990f305be` |
| [kmsw-2014](https://arxiv.org/pdf/1409.3731v3) | `a8458c8eb2147e96514c9fa04be42c1af52f7fd043c8e50f6187ccaee6ad1fbc` |
| [kw-2009-I](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [martin-watkins-2006](https://magma.maths.usyd.edu.au/~watkins/papers/antsVII.pdf) | `ea2aaf25330c562ff2a8c5997f74e8623ef524139769622d871ff1abe9e20e7f` |
| [moeglin-renard-2018](https://arxiv.org/pdf/1802.04611v4) | `6fadbad5b976e5b55264cfb8ebacb485bd7e3aa6187bf5e1cc9cc450884a9b61` |
| [mok-2015-v5](https://arxiv.org/pdf/1206.0882v5) | `48be19203a9dc55ffc6df58f68e391490c8411afb0af6d72aa7edb8c5d6136df` |
| [newton-thorne-II](https://arxiv.org/pdf/2009.07180v2) | `0f08214ebe03344c2e2851be76c49213dc4adf7928ff561610b674c423a2a6bf` |
| [nt-2026](https://arxiv.org/pdf/2212.03595v2) | `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c` |
| [patrikis-taylor-2015](https://virtualmath1.stanford.edu/~rltaylor/irred.pdf) | `32d9d2bdee659b72a6606680a1a305d33884bb9c071162884b8be0edc5871183` |
| [qian-2023](https://arxiv.org/pdf/2104.09761v1) | `4110023d4691d628adbc96842793696978de962b6109044e5d32779160835415` |
| [qian-thesis-2023](https://stacks.stanford.edu/file/druid:yn815wp7042/Thesis%20Final%20Version-augmented.pdf) | `22a4ae5094188762e36b3ffb13415662f21029767f78703941e9087350fe5ab8` |
| [schmidt-2017](https://math.ou.edu/~rschmidt/papers/hodge.pdf) | `291401f12a55595c20cab21ef4d764fed9d774c3dcf50186bbd5b5bcad30c3b2` |
| [schmidt-2018](https://sites.math.unt.edu/~schmidt/papers/packets_paramodular.pdf) | `e9e3fb40c1254487c1548b389f852884213ad28862b76f9b51111b2ad57abc9f` |
| [taylor-2012](https://msp.org/ant/2012/6-3/ant-v6-n3-p01-p.pdf) | `690907d784cc80eb471561d864d6975b3ad980e2267afab70847c20da5327492` |
