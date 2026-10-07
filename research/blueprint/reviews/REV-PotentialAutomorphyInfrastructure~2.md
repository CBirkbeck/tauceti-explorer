# Independent review of potential automorphy infrastructure, revision 2

**Job:** REV-PotentialAutomorphyInfrastructure~2; **issue:** [#6913](https://github.com/CBirkbeck/tauceti-explorer/issues/6913).  
**Reviewer:** Codex — codex-8yYLd0; **date:** 7 October 2026.  
**Verdict:** `accepted`. This is a finished independent review of the revision by Claude Code — claude-NTd9Ze ([revision issue #6934](https://github.com/CBirkbeck/tauceti-explorer/issues/6934)). This session wrote neither the original plan nor its revision.

The [packet](../packets/PotentialAutomorphyInfrastructure.json), [reader](../readmes/PotentialAutomorphyInfrastructure.md) and [suggested Lean file](../suggested/PotentialAutomorphyInfrastructure.lean) contain the corrections below. Acceptance is of a target-level planning pass under PROTOCOL section 0. All six stages remain `planned`, with precise remaining lists; none is `closed`. Seven explicit gaps and 36 supplier requests remain. Every implementation status is `unchecked`.

## Coverage and counts

| Item | Result |
| --- | --- |
| Nodes | All 123: 112 verified, 11 corrected, 0 added, 0 unverifiable |
| Definitions and constructions | All 29 |
| API obligations | All 122; added the retract constructor and extensionality |
| Unit-test obligations | All 90; added the tame uniformizer-change counterexample |
| Typed definition cores | All 14, with the disclosed local/numerical scope |
| Planets | All 34, retained |
| Pinned baseline citations | All 10 confirmed; none removed, added or replaced |
| Source findings | All 77: 76 confirmed, E3 rejected; E77 added |
| Source-coverage dispositions | All 155 checked against the target scope |
| Target-coverage entries | All 13 checked |
| Supplier contracts | Exact imported node statements and all 33 referenced stage statements checked; all 36 requests checked |
| Stages | PA.0–PA.5 planned; no stage closed; packet pass complete |

The node-by-node verdicts and reasons are in `review.checked`; every source finding has its own review by this job. The definition APIs and tests were checked against their uses, including the fourteen typed cores. Tests distinguish inverse-increasing left shuffles, paired CTG weights, contracting torus directions, weight normalization, stable ordinary images, finite diamond quotients, conjugate-row reversal and determinant oddness. Each definition retains at least three discriminating tests. The arithmetic test obligations in the final Lean comment are not presented as elaborated examples.

| Stage | Nodes | Verified | Corrected |
| --- | ---: | ---: | ---: |
| PA.0 | 8 | 6 | 2 |
| PA.1 | 15 | 14 | 1 |
| PA.2 | 47 | 45 | 2 |
| PA.3 | 6 | 6 | 0 |
| PA.4 | 25 | 22 | 3 |
| PA.5 | 22 | 19 | 3 |

Every target has an identified declaration and a prerequisite chain ending in the pinned libraries, another owner's node/requested stage, or a named gap. This is the `planned` standard; it is not gap-free proof closure. The internal node graph has no cycle. PA.5 does not consume PA.2–PA.4; soluble descent can therefore feed the lifting application. The Hida complex definition belongs to PA.3. Neither lifting branch imports the other branch's arithmetic verification.

## Corrections made in this review

| Node suffix | Correction and evidence |
| --- | --- |
| `equivariant-retract` | Added `EquivariantRetract.refl` and `EquivariantRetract.ext` to the API. Extensionality compares the actual inclusion and retraction maps; its prototype elaborates. The existing identity constructor already had a typed prototype. |
| `integral-kostant-decomposition` | The excerpt formerly quoted claim (2) of the preceding Theorem 4.2.1 proof. Replaced it with Lemma 4.2.2(2) itself on ACC p. 970, retaining p ≥ 2n−1 and the integral decomposition. |
| `selected-ideal-properness` | Replaced the sketch using a characteristic-zero automorphic representation with the finite torsion Iwahori Hecke-module argument. Khare–Thorne Lemmas 5.2–5.3 give the split spherical inclusion and support of every ordered distinct-root character. Requested those precise SR.1 extensions. |
| `diamond-derived-augmentation` | Added Khare–Thorne Lemma 5.4's selected-character trace isomorphism. An invertible spherical inclusion/trace index alone does not show this isomorphism. Kept derived reduction, Nakayama and diamond descent distinct. |
| `neatness-auxiliary-places` | Added the scalar residual element outside the cyclotomic subgroup, the finite forbidden sets and separately arranged lifting-profile premises. The theorem supplies auxiliary primes, H² vanishing and neatness; it no longer claims to establish every unrelated profile condition. Imported Chebotarev and upstream finite-module local Tate duality explicitly, and extended the ALS neatness request using the multiplicative eigenvalue/root-of-unity criterion, not just torsion-freeness of a stabilizer. |
| `fontaine-laffaille-base-change-fields` | Restricted the proof's final checklist to the field, image and local degree conditions actually constructed. The auxiliary places and other automorphic/weight hypotheses are supplied in the lifting application. Included both physical source pages 176–177. |
| `ordinary-base-change-fields` | Removed the statement's claim to prove ι-ordinarity of the base-changed π while its proof deferred that assertion. This node is the field/local arithmetic checklist. Ordinary lifting descent applies the separate soluble base-change and ι-ordinarity transport nodes. Included PDF pages 186–188. |
| `iota-ordinary-automorphic-representation` | Corrected BLGGT's false b-th-power assertion, including the normalized weight-unit factor. Added published-source E77 and the tame quartic-character counterexample; imported algebraic Hecke-character realization explicitly. |
| `ordinarily-automorphic-representation` | Made the definition conditional on a supplied attachment contract. AG2.6 provides CM and polarized totally real attachments; a quadratic CM base change alone is not a general unpolarized totally real attachment theorem. Restricted the local-flag API to imaginary CM and the twist API to realizations of algebraic Hecke characters. |
| `genericity-normal-closure-restriction` | Changed the proof's unbound E to its stated K and imported Chebotarev explicitly. The extension K/ℚ is explicitly finite, and the disjointness calculation consistently uses HK, Gal(K/ℚ) and FK. |
| `unitary-levi-weight-dictionary` | Corrected the zero-based first-block API to −λ_{τc,n−1−i}. The typed reverse operation and all three numerical tests already used this correct index. |

The Lean comments naming nonexistent RG2.6 dependencies now name the sole pending integral highest-weight owner, ReductiveGroupsIntegralRepresentationsPartII. The reader and named Lean obligations agree with the revised inventory. No arithmetic placeholder type was introduced to obtain a misleading compiled signature.

## Sources and independent findings

All twelve source versions actually compared have URLs, read dates and SHA-256 digests in `sourceVersions`. The primary passages used were:

| Text | Scope of direct reading |
| --- | --- |
| Allen et al., *Potential automorphy over CM fields* | [Author-hosted published Annals PDF](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), every node/finding passage and its proof context in §§2, 4–7; both lifting endpoint hypothesis lists and descent arguments |
| Qian, *Potential automorphy for GL_n* | [NSF-hosted Springer online-first copy](https://par.nsf.gov/servlets/purl/10388233), Definition 1.3, Lemmas 2.6 and 4.3, Remark 4.4 and the genericity/restriction arguments |
| Boxer–Calegari–Gee–Newton–Thorne, Bianchi Ramanujan/Sato–Tate | [Author copy](https://www.ma.imperial.ac.uk/~tsg/Index_files/SatoTate.pdf), §6.1 and symmetric-power uses |
| Boxer–Calegari–Gee–Pilloni, potentially modular abelian surfaces | [Author manuscript](https://www.ma.imperial.ac.uk/~gboxer/abeliansurfacesmodular.pdf), §9.1 definitions and all parts of Lemma 9.1.10 |
| Chenevier, determinants and pseudorepresentations | [arXiv text](https://arxiv.org/pdf/0809.0415), determinant-kernel inclusion and multiplicity-free reconstruction passages |
| BLGGT, *Potential automorphy and change of weight* | [Published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf), §2.1, pp. 537–538; [arXiv](https://arxiv.org/pdf/1010.2561) and [2013 author copy](https://virtualmath1.stanford.edu/~rltaylor/pa3.pdf), uniformizer assertion on p. 33 |
| Khare–Thorne, *Potential automorphy and the Leopoldt conjecture* | [Cambridge repository manuscript](https://www.repository.cam.ac.uk/bitstream/1810/254249/1/Khare%20et%20al%202016%20American%20Journal%20of%20Mathematics.pdf), §5, pp. 25–27, Lemmas 5.1–5.4 and proofs |
| Historical preprints | [ACC v1](https://arxiv.org/pdf/1812.09999v1), [ACC v2](https://arxiv.org/pdf/1812.09999v2) and [Qian v1](https://arxiv.org/pdf/2104.09761v1), limited to E71–E72's historical statement/numbering/page comparisons |

Qian journal pagination remains a concordance with the 37 physical pages of the online-first PDF; those journal numbers are not represented as printed page headers in the downloaded text. Geraghty's Lemmas 5.2 and 5.7, and the cited Henniart/Serre and Larsen–Pink/Larsen source leaves, remain explicitly unread in their primary editions. Their uses are precise owner requests or gaps. The accessible BLGGT definition does not verify those separate Geraghty lemmas.

All previous 76 findings were reread at their locators. The independent verdicts retain 75 confirmations and E3's rejection, and add one confirmation:

- **E77, new published-source error.** BLGGT p. 537 claims the commuting uniformizer-change diamond operator has trivial b-th power. For GL₁ over ℚ at l=5, b=1 and a quartic character of conductor 5, replacing 5 by 10 multiplies the operator by a primitive fourth root. The diamond order instead divides the exponent of (O_v/ϖ_v^b)×. For normalized operators there is also a weight unit. Both factors preserve unit eigenvalues, so uniformizer independence is valid with the corrected proof. The publisher article/volume correction listings and arXiv/author searches are recorded; no existing correction was located. The published, arXiv and 2013 copies repeat the exponent claim.
- **E3, rejected.** ACC Proposition 6.4.17's stronger D(S∞/ϖ) comparison implies its printed D(S∞) comparison by restriction of scalars. The weaker printed category is not an error. The plan correctly retains the stronger comparison needed by its application.
- **E11 and E13:** corrected the earlier review reasons. E11 removes ∂ from the Siegel-stratum expression; it does not substitute the full boundary. E13 replaces the mistaken Levi symbol π by the induced unitary symbol 𝔐.
- **E24, E35 and E53:** corrected the earlier review reasons to distinguish the torsion Hecke-image theorem from residual existence, use the rational-p monoid operator rather than a single local U_v, and identify T^S(K,𝒱) as the algebra in the first localization comparison.
- **E74:** corrected the earlier review's claim about cancellation. Qian's two sign errors cancel for every constant row, not just at weight zero; the corrected row is +λ and the normalization is l^{-jλ}.

The important retained findings include the prime-field correction to BCGP's residual SL₂ claim, normal-closure avoidance without changing the final theorem field, Qian's repaired v1 ordinary-automorphy gap, and the inability of global semisimplification to retain local monodromy. None is silently repaired by strengthening a supplier's theorem.

## Pinned baseline and library audit

The ten declarations were independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. No baseline citation was removed or added in this review.

| Declaration | Hypotheses/content checked |
| --- | --- |
| `CategoryTheory.Retract` | Inclusion A→B, retraction B→A, inclusion followed by retraction = identity |
| `CategoryTheory.Retract.map` | Functorial transport of both maps and their composite equation |
| `DerivedCategory` | Abelian category and the derived-category existence instance |
| `DerivedCategory.Q` | The localization functor from cochain complexes |
| `Module.support` | Commutative-ring module support via nontrivial prime localizations |
| `Matrix.charpoly` | Commutative ring, finite decidable matrix index, determinant of XI−M |
| `Subgroup.goursat_surjective` | Both projections surjective, normal quotient subgroups and isomorphism graph |
| `Equiv.Perm.permGroup` | Multiplication composes permutations in the convention used by the shuffle prototype |
| `finAddFlip` | Fin(m+n)≃Fin(n+m), exchanging the two blocks |
| `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` | Field F and 4≤Nat.card F imply simplicity of PSL₂(F); no Dickson or algebraic-form classification is implied |

Tau Ceti source searches used `f790474821cf4256814db967cb154e7af3d0c369`. There is no Tau Ceti declaration in this packet's baseline; roadmap imports are not passed off as implemented declarations. The shared Lean build's different Tau Ceti checkout is not imported. The reviewed library-coverage index has no dedicated PA entry; all six PA stage results in AUDIT-34 were also read. Its partial PA.4 hyperfilter result is already supplied, and no hyperfilter construction is replanned. The upstream ReductiveGroups and InductionRestriction reader documents were checked for scope and density.

## Red-team dispositions and remaining ownership

| Assigned finding | Disposition |
| --- | --- |
| RT-AREA-langlands-1/7 | Both unpolarized lifting endpoints are explicit PA.4 targets with distinct p-bounds, all residual/weight/local hypotheses and precise unramified conclusions. ML.2 is a downstream consumer. Ordinary support is at the lifting point, without an unjustified full-support theorem. |
| RT-AREA-langlands-1/21 | G7 owns Taylor–Wiles primes, diamonds and presentations. The enormous-image hypothesis and g=qn−n²[F⁺:ℚ] count are retained. PA.4 owns the arithmetic complexes and their verification. |
| RT-AREA-langlands-1/22 | L7, L8, R08.2, G7 and G8 are actual inputs to PA.3's arithmetic support verification. Corrected the revision's proposed blanket L7→P9 edge: P9 remains parameterized by abstract local data; only its separate arithmetic instance needs those L7 component inputs. |
| RT-AREA-geomlanglands/24 | ReductiveGroupsIntegralRepresentationsPartII is the sole integral highest-weight owner. Its pending stage remains a gap; no RG2.6 stage is invented. LP3 retains only its parameter-scheme assertions. |

The earlier review's three unverifiable nodes now have honest target-level contracts: the adjoint-monodromy node names its arithmetic-form gap, and the two lifting descents use the new PA.5 soluble descent node with an exact every-place cyclic base-change request. The ET.7a request records the future early ET.4b route from the confirmed restructuring; the requested extension is not assumed to exist already. No downstream ML.1 or ML.5 theorem is used as a lifting input.

The seven closure gaps remain: the pending integral highest-weight stage; unavailable arithmetic signatures; the unread Geraghty lemmas; extremely weak-system monodromy/rank-one leaves; uniform arithmetic tower freeness/reconstruction; ordinary Satake-image polynomial-law transfer; and arithmetic forms of products of adjoint PGL₂. The precise requests remain with their suppliers. None makes the corrected target-level statements contradictory, and none is claimed closed by prototype compilation.

Questions/actions for the orchestrator, without blocking acceptance: apply the packet's restructuring proposals; assign the pending integral highest-weight stage; route the arithmetic forms export once its design exists; and migrate the cyclic base-change request to early ET.4b when that stage is created. Later implementation must discharge the seven gaps and supplier extensions before any stage can be closed. No atlas data, supplier packet or upstream roadmap was edited here.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructure.json`: **0 errors, 0 warnings**.
- `scripts/check_errata.py` on an exact scratch `errata-v1` projection of this packet's source findings and versions: **OK**, all 77 findings.
- Packet/reader/suggested-file agreement, unique API/test names, review completeness, three tests per definition, unchanged implementation statuses and internal dependency-cycle check: **passed**.
- `lean-check research/blueprint/suggested/PotentialAutomorphyInfrastructure.lean`: **exit 0**, **92 warnings, all declaration uses `sorry`**. Memory was checked before compiling. Only individual Mathlib modules at the pinned commit were used.
- Swarm intake deliverable/private-path check: **5 files, 0 problems**.
- `git diff --check`: **passed**.

Compilation validates the available types and prototype signatures. The unelaborated arithmetic declarations and test obligations remain in the named final comment. The [handoff](../handoff/REV-PotentialAutomorphyInfrastructure~2.md) records what future closure work needs.
