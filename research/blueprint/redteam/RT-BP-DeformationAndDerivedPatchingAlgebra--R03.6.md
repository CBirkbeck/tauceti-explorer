# Red team: support, components and descent (R03.6)

**Job:** `RT-BP-DeformationAndDerivedPatchingAlgebra--R03.6` · **Target:** `BP-DeformationAndDerivedPatchingAlgebra--R03.6` · **Issue:** #4418
**Worker:** Codex, session `codex-5ebb6f` · **Date:** 2026-09-30
**Status:** complete · **Result:** one low-severity documentation finding.

The accepted packet survives the mathematical attacks below. I found no supported false theorem, wrong positive library citation, incorrect owner, or duplicated construction in this revision. Its reader omits three API entries added during review. This report is a source and contract check; no Lean compiled and no formalisation is claimed.

## Revision and independence

The checkout is commit `32f535d0f3655ba146c7667838acb986807bc48b`. The origin worker was ClaudeCode `cc-39fac3`; the independent reviewer was ClaudeCode `cc-fb70e5`. I did neither job. The target files and the independent review report were read in full. No target artifact was edited.

| Artifact | SHA-256 |
| --- | --- |
| `research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--R03.6.json` | `7d5095850eca12bc0d5930af24e45a800c675c46a491d99a38bf1eed5f5930be` |
| `research/blueprint/readmes/DeformationAndDerivedPatchingAlgebra--R03.6.md` | `5cb32739e0e0e2d6b2a7497f810abcee961f72e8c8cbb434012ef9811e3649c4` |
| `research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--R03.6.lean` | `3f00224a0dd269a8a3a5f894d93beeb5c07a3efe72d9400bdfd160d1d9a20063` |

## Finding 1: the reader omits three accepted API entries

**Kind:** other · **Severity:** low · **ID:** `RT-BP-DeformationAndDerivedPatchingAlgebra--R03.6/1`.

The *Object: modules supported on components* API paragraph in the reader, lines 194–196, enumerates four declarations. The corresponding packet node has seven: the independent review added a constructor, compatibility with Mathlib faithfulness, and the zero-module example. Their signatures are already present in the suggested file at lines 166, 173 and 178. None of their names occurs in the reader:

- `Module.IsSupportedOnComponents.mk`: introduce the predicate from the inclusion of minimal primes over the annihilator into the base minimal primes.
- `Module.isSupportedOnComponents_of_faithfulSMul`: a faithful module is supported on components.
- `Module.isSupportedOnComponents_of_subsingleton`: the zero module is supported on components.

PROTOCOL §8 requires the reader's named API to agree with the packet. This is a presentation omission, not missing mathematics: the accepted additions are in both implementation-planning artifacts. At the Mathlib pin, [Maps.lean:892](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L892) identifies zero annihilator with `FaithfulSMul`; line 901 identifies top annihilator with a subsingleton module. [MinimalPrime/Basic.lean:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean#L57) defines the ideal's minimal primes. These are the actual existing notions used by the accepted compatibility and example clauses.

**Fix:** add these three names and their roles to the reader's API paragraph. Retain the seven packet API entries and the existing suggested signatures. No new node, construction or theorem is required.

## Node-by-node attack record

Each row records the mathematical check of the statement, proof route, hypotheses and acceptance cases. Node identifiers below are the suffixes of `DeformationAndDerivedPatchingAlgebra:R03.6/`.

| Node | Attack/check |
| --- | --- |
| `nearly-faithful` | Radical containment is the definition; ideal nilpotence requires finite generation of the annihilator. Full-support equivalence requires a finite module. |
| `supported-on-components` | Minimal primes over Ann(M) are minimal primes of R; the finite-module union-of-components characterisation and all seven API items were checked. The three reader omissions are finding 1. |
| `nearly-faithful-iff-support-eq-univ` | Finite M has Supp(M)=V(Ann(M)); the faithful infinite module Q/Z over Z excludes the generic point, so finiteness cannot be removed. |
| `nearly-faithful-iff-minimal-primes-mem-support` | All minimal primes in support imply Ann(M) is nil without finiteness; the converse uses the finite support/annihilator criterion. |
| `nearly-faithful-restrict-scalars-surjective` | Surjective restriction of scalars transports the annihilator by comap; the kernel radical, not merely the zero radical of A, is required. |
| `radical-annihilator-quotient` | Supp(M/IM)=V(I) for finite nearly faithful M gives the stated radical equality. |
| `nearly-faithful-quotient` | Use the quotient-ring annihilator and the previous radical equality; no local or Noetherian hypothesis is needed. |
| `quotient-action-kernel-bound` | The compatible quotient action kills exactly the source kernel up to the radical bound; no surjectivity is used in this bound. |
| `quotient-action-nearly-faithful` | The reverse containment on I and surjectivity are separate inputs. The diagonal map into a product detects their necessity. |
| `support-base-change-subset` | Unconditional support inclusion follows from the local tensor identity; Z to F2 with M=Q makes it strict. |
| `support-base-change` | Finite-module fibre nonvanishing and the residue-field extension give equality for every coefficient map, including a nonflat quotient. |
| `support-base-change-flat` | The local ring map at each q is faithfully flat when the coefficient map is flat, so equality holds for arbitrary M. |
| `support-restrict-scalars-surjective` | Surjective restriction is valid for arbitrary modules. Besides the localization proof, it follows directly from the cyclic-annihilator support criterion: surjectivity identifies A*m with B*m and its annihilator with the contraction of Ann_B(m). |
| `nearly-faithful-base-change` | Finite near-faithful ascent uses full support and base-change equality; the nonfinite Q over Z counterexample was checked. |
| `nearly-faithful-of-base-change` | Lift only the minimal primes needed for descent. The flat projection k times k to k shows why lifting cannot be dropped. |
| `nearly-faithful-base-change-iff` | Faithfully flat coefficient change supplies all prime lifts. Q_p/Z_p over Z_p shows that faithful flatness alone does not replace finiteness. |
| `framing-augmentation-kernel` | Partition each nonconstant monomial by its first variable; finite sigma makes the sum finite. The infinite-variable degree-one series lies outside the algebraic variable ideal. |
| `framing-variables` | For any sigma, constant coefficient retracts constant series and lifts every prime; this does not use the finite-variable kernel formula. |
| `framing-quotient-nearly-faithful` | Finite sigma permits B/J to be identified with A and transports the scalar action on N/JN; the empty-variable case works. |
| `minimal-primes-of-torsion-free` | A ring nonzerodivisor avoids every minimal prime; localization gives the minimal-prime bijection even without Noetherianity. |
| `nearly-faithful-iff-minimal-primes-away-mem-support` | Finite support base change and minimal-prime contraction give the generic-component test; both module finiteness and ring regularity were stress-tested. |
| `nearly-faithful-after-inverting` | The localized module is finite; apply the generic minimal-prime test on both rings. |
| `faithful-iff-after-inverting` | Reduced localization and injectivity make R reduced. Near faithfulness then agrees with faithfulness; the stronger hypothesis is valid even though it can be weakened. |
| `maximal-depth-associated-primes-minimal` | The regular sequence includes nonzero quotient. The associated-prime depth bound gives top dimension; extending a maximal chain forces minimality. |
| `maximal-depth-annihilator-primes-top-dimensional` | Primes minimal over the annihilator are associated for finite modules over a Noetherian ring; inherit the top-dimensional statement. |
| `maximal-cm-support-top-components` | Maximal depth gives a union of top-dimensional components. The node k[[x,y]]/(xy), M=A/(x), prevents full support. |
| `nearly-faithful-maximal-depth-equidimensional` | Near faithfulness puts every minimal prime in the support; combine with maximal depth to force equidimensionality. |
| `maximal-cm-nearly-faithful-irreducible` | Nonzero M has an associated prime and thus a prime minimal over Ann(M); the unique base minimal prime lies in support. |
| `maximal-depth-nearly-faithful-irreducible-away` | A ring nonzerodivisor transports uniqueness of the generic-fibre minimal prime to the whole ring. The p*x example detects the missing regularity hypothesis. |
| `annihilator-group-stable` | Semilinearity and the inverse group element transport annihilator membership; finiteness is unnecessary. |
| `support-group-stable` | The cyclic-annihilator support criterion transports support under the comap orientation used in the signature. |
| `support-group-transitive` | Transitivity transports one supported minimal prime to all of them, then the nonfinite constructor gives near faithfulness. |
| `faithful-group-transitive` | Over a reduced ring the preceding nil annihilator is zero; dual numbers exclude omitting reducedness. |
| `nearly-faithful-lift-from-special-fibre` | The principal ideal theorem, catenary dimension function and equidimensionality identify the relevant special-fibre prime. Module regularity and uniqueness of the base component force the desired minimal prime into support. |
| `patching-radical-comparison` | The quotient action bounds ker(phi) by radical(I); the augmentation containment modulo Ann(M_infinity) gives the reverse radical inclusion. |
| `patching-nearly-faithful-descends` | Surjectivity is used at the quotient-action descent step, after radical comparison. |
| `patching-reduced-quotient-iso` | Both composites to reduced quotients have equal kernels and are surjective. The first isomorphism theorem also supplies the stated values on classes. |
| `patching-kernel-equals-ideal` | Regular-local maximal depth supplies a nonempty free basis; coordinate comparison gives ker(phi)=I without requiring surjectivity. |
| `patching-free-conclusion` | Surjectivity descends a basis and nontrivial R ensures the descended vectors are nonzero; the zero quotient counterexample was checked. |
| `r-to-t-kernel-nil` | Compatible restriction of scalars gives ker(R to T) inside Ann_R(H), hence nil. Faithful T action is stronger than needed here. |
| `r-to-t-kernel-nilpotent` | Noetherianity makes the nil kernel finitely generated and nilpotent; the infinite-variable nil-ideal example detects the distinction. |
| `r-red-equals-t-red` | A surjective map with nil kernel induces the compatible isomorphism of reduced quotients. |
| `t-reduced-iff-kernel-nilradical` | T is reduced iff its kernel is radical, and the nil-kernel radical is the source nilradical. |
| `r-equals-t-reduced` | With T reduced, the source reduced quotient maps isomorphically onto T; Taylor 4.1 concludes at exactly this quotient. |
| `torsion-in-kernel` | H-regularity cancels powers of the uniformizer in every scalar action; faithful T action puts all ring power torsion in the kernel. |
| `r-equals-t-torsion-free-quotient` | Localized faithfulness is equivalent to the kernel being power torsion under H-regularity. No finite-generation assumption is needed: regularity cancels the element-dependent powers in localized annihilator membership. |
| `torsion-in-nilradical` | Ring power torsion kills H under H-regularity; near faithfulness makes it nil. No T hypothesis is needed. |
| `t-reduced-iff-after-inverting` | H-regularity plus faithful T action makes the image uniformizer a T-nonzerodivisor; injectivity into localization and preservation of reducedness prove both directions. |
| `r-equals-t-free` | T-faithfulness identifies the map kernel with Ann_R(H); with surjectivity, R-faithfulness is exactly bijectivity. |
| `r-equals-t-of-free` | A nontrivial free module is faithful, and surjectivity then yields integral R=T. The zero module counterexample was checked. |
| `patched-module-support-theorem` | The irreducible-base maximal-depth criterion plus quotient descent is a conditional module theorem; it does not construct patching data. |
| `patched-module-away-support` | The generic minimal-prime support hypothesis gives near faithfulness before quotient descent; no Noetherian or depth assumption is needed. |
| `patched-module-r-equals-t` | For nonzero R the preceding free module theorem gives integral R=T. If R is zero the surjection forces T zero, so the signature remains correct without an H nonzero hypothesis. |

## Source evidence and version scope

The six public PDFs were fetched afresh on **2026-09-30**. All six hashes equal the packet's recorded hashes. The reading is limited to the listed passages; I do not claim a complete reading of the six papers or a new line-by-line audit of all 144 repeated excerpt fields. Formulas in extracted text were interpreted with their hypotheses and proof, rather than treating substring matching as mathematical verification. Khare–Wintenberger is the packet's author-copy version with its own pagination.

| Public source | Passages read | SHA-256 |
| --- | --- | --- |
| [Taylor-AutomorphyII-2008](https://www.numdam.org/article/PMIHES_2008__108__183_0.pdf) | Definition 2.1; Lemmas 2.2(1),(2) and 2.3 with proofs, pp. 187–188; Theorem 4.1 statement p. 212 and end of proof pp. 220–221. | `f9014a899bcccaa56035314f196b15b581abe63d56cb9d9a285ce9e93f1030bc` |
| [CalegariGeraghty-2018](https://www.math.uchicago.edu/~fcale/papers/CG.pdf) | Lemmas 6.1–6.2 for boundaries; Theorem 6.3 setup and (iv), PDF pp. 90–91; Theorem 6.4 and proof, Remark 6.5, Proposition 6.6 and following paragraph, PDF pp. 93–95. | `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5` |
| [CalegariGeraghty-2018-correction](https://link.springer.com/content/pdf/10.1007/s00222-021-01095-5.pdf) | Entire two-page correction, including the completed-group-ring and power-series repairs. | `c60cfe362940e641ee2cd60c61c1429961f18d3d16b4a6857df4ea7993111ee7` |
| [Kisin-FiniteFlatModularity-2009](https://annals.math.princeton.edu/wp-content/uploads/annals-v170-n3-p03-p.pdf) | Section 3.3 opening, Proposition 3.3.1 and proof, Lemma 3.3.4 and proof, pp. 1157–1159. | `076f8bb6ec683633f7742d27504b97f5feaef2ddbae2bc5dc4325eb8386f4ee7` |
| [KhareWintenberger-SerreII](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | Propositions 9.2(III), 9.3(III); proof of 9.2(III), Lemma 9.6(b) and proof, end of 9.3(III), author-copy pp. 81, 83–84, 88–89. | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| [ACCplus-PotentialAutomorphyCM](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | Section 6.3.5 through Proposition 6.3.8 statement, pp. 1050–1052; definition/use of near faithfulness after (6.5.10), p. 1066, and final support descent in 6.5. | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` |

The two already recorded source issues are not new findings. Taylor Lemma 2.3 omits the zero-module exclusion; the packet's regular-sequence hypothesis includes a nonzero quotient. Calegari–Geraghty Theorem 6.4(1) needs the regularity hypothesis on the patched ring rather than the finite-level ring; the packet uses that corrected ring and completed power-series notation. The published correction accounts for the bracket changes. I make no additional published-source erratum claim.

All tagged passages used by the nodes were read again, with proofs where present:

[00E0](https://stacks.math.columbia.edu/tag/00E0), [00E3](https://stacks.math.columbia.edu/tag/00E3), [00E5](https://stacks.math.columbia.edu/tag/00E5), [00EU](https://stacks.math.columbia.edu/tag/00EU), [00HI](https://stacks.math.columbia.edu/tag/00HI), [00HQ](https://stacks.math.columbia.edu/tag/00HQ), [00HR](https://stacks.math.columbia.edu/tag/00HR), [00IM](https://stacks.math.columbia.edu/tag/00IM), [00KV](https://stacks.math.columbia.edu/tag/00KV), [00L2](https://stacks.math.columbia.edu/tag/00L2), [00L3](https://stacks.math.columbia.edu/tag/00L3), [00LD](https://stacks.math.columbia.edu/tag/00LD), [00NF](https://stacks.math.columbia.edu/tag/00NF), [00O7](https://stacks.math.columbia.edu/tag/00O7), [02CE](https://stacks.math.columbia.edu/tag/02CE), [05BY](https://stacks.math.columbia.edu/tag/05BY), [090V](https://stacks.math.columbia.edu/tag/090V), [0BK4](https://stacks.math.columbia.edu/tag/0BK4), [0BUR](https://stacks.math.columbia.edu/tag/0BUR), [0BUS](https://stacks.math.columbia.edu/tag/0BUS), [0ECF](https://stacks.math.columbia.edu/tag/0ECF), [0EGG](https://stacks.math.columbia.edu/tag/0EGG), [0FCC](https://stacks.math.columbia.edu/tag/0FCC).

The critical distinctions agree with these sources: finite-module support is V(Ann); arbitrary base-change inclusion becomes equality with module finiteness or coefficient-map flatness; nil and nilpotent ideals agree under finite generation; maximal depth gives top-dimensional component support; special-fibre lifting has catenarity, equidimensionality, module regularity and uniqueness hypotheses. The generalized non-Noetherian and arbitrary-module statements were checked directly, not attributed to Taylor beyond his stated scope.

## Baseline, closure and ownership

All **126 positive Mathlib references** were checked by reading their statements/types in the actual cited files at commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, then comparing their assumptions and conclusions with `provides` and the consuming proof. Definition bodies, the regular-sequence nonzero clause, local-ring map and tensor-cancellation scalar towers, and the finite-local-Krull-dimension instance were inspected separately. Namespace suffix search alone was not treated as evidence: in particular `Ideal.annihilator_quotient` is the root-qualified theorem in `Ideal/Colon.lean:173`, not the similarly named submodule theorem.

The accepted `AUDIT-17` coverage for R03.6 identifies the generic supports, annihilators and quotient interfaces as partial baseline material and the near-faithfulness/patching conclusions as new targets. Tau Ceti's baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. This report makes no new exhaustive claim that a declaration is absent from Tau Ceti.

The integrated R03.3 depth node explicitly contains the associated-prime inequality needed here. The two finer R03.3 imports are supplied by the P7 packet: `catenary-iff-dimension-function` and `free-of-maximal-depth-regular-local`. Their statements and proof inputs were read; they supply exactly the displayed uses. Nonempty associated primes and finite local Krull dimension are already in Mathlib. This checks the target's imports, not the completeness of every surrounding packet.

The construction of patching data remains R03.5/P8's task. The module-level theorems here are conditional on explicit data and need no patched-complex-existence theorem as a prerequisite. Perfect-complex support, amplitude, ACC+ 6.3.8 and comparison of two patched systems remain in P9. The audited overlap stages `PotentialAutomorphyInfrastructure:PA.3`, `GL2ModularityLifting:R22.4`, and `CompletedCohomologyAndLocalGlobalCompatibility:R31.5` apply the generic algebra with arithmetic inputs. Their stage descriptions were checked against this division of ownership; I found no duplicated construction in the target packet.

The dependency graph resolves and is acyclic. There are 294 baseline prerequisite occurrences, 84 internal-node occurrences, one integrated-node occurrence and three cross-packet-node occurrences (two distinct nodes). The packet has 53 nodes, 22 API items, 11 counted tests and six planets, with no gaps or requests. All lemma/theorem nodes retain one proposed declaration. The reader/API list is the only recorded mismatch.

## Acceptance tests and validation

Both object definitions have distinguishing tests. The radical definition is separated from nilpotence by the infinite-variable nil ideal, from faithfulness by dual numbers, and from nonzero-module/full-support shortcuts by integer quotients and the reducible node. The support-on-components definition distinguishes the zero module, Z/2 over Z, a faithful finite domain module, and a module supported on only one component.

The further acceptance examples test missing finiteness, flatness versus faithful flatness, finite versus arbitrary variable sets, nonzerodivisors of the ring versus regularity on the module, semilinearity, transitivity, equidimensionality, uniqueness of the lifted component, surjectivity and nontriviality of the finite-level quotient. The suggested file was read completely and compared with the mathematical signatures; the counterexample/acceptance checks are static mathematical checks, not executed Lean tests.

- `check_blueprint.py` with the actual pinned declaration index: **0 errors, 0 warnings**.
- `check_redteam.py` on this result: **ok**. Its CLI derives the identifier with `path.name.split(".")[0]`, truncating dotted stage identifiers. The `redteam` and finding IDs use that parser-compatible prefix; `job`, `target`, the deliverable filenames and this report retain the full R03.6 identity. This does not change the mathematical target.
- JSON parsing and `git diff --check`: pass.
- Only the two issue deliverables are changed; accepted target hashes remain as above.
- **No Lean compiled.** No build was created or updated.

## Positive baseline source ledger

The ledger provides locators for all 126 references whose contracts were inspected. For names with more than one syntactic suffix hit, the correct namespace was checked in context; no generated suffix match substitutes for the fully qualified declaration.

| Reference | Pinned source locator |
| --- | --- |
| `mathlib:CovBy` | [Mathlib/Order/Defs/PartialOrder.lean:160](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Order/Defs/PartialOrder.lean#L160) |
| `mathlib:FaithfulSMul` | [Mathlib/Algebra/Group/Action/Faithful.lean:47](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Faithful.lean#L47) |
| `mathlib:Ideal.FG.isNilpotent_iff_le_nilradical` | [Mathlib/RingTheory/Noetherian/Nilpotent.lean:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Noetherian/Nilpotent.lean#L30) |
| `mathlib:Ideal.annihilator_quotient` | [Mathlib/RingTheory/Ideal/Colon.lean:173](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Colon.lean#L173) |
| `mathlib:Ideal.comap_radical` | [Mathlib/RingTheory/Ideal/Maps.lean:674](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L674) |
| `mathlib:Ideal.disjoint_nonZeroDivisors_of_mem_minimalPrimes` | [Mathlib/RingTheory/Ideal/MinimalPrime/Localization.lean:91](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Localization.lean#L91) |
| `mathlib:Ideal.exists_minimalPrimes_le` | [Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean:75](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean#L75) |
| `mathlib:Ideal.height_le_one_of_isPrincipal_of_mem_minimalPrimes` | [Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean:108](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/KrullsHeightTheorem.lean#L108) |
| `mathlib:Ideal.isRadical_iff_quotient_reduced` | [Mathlib/RingTheory/Ideal/Quotient/Nilpotent.lean:17](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Nilpotent.lean#L17) |
| `mathlib:Ideal.map_radical_of_surjective` | [Mathlib/RingTheory/Ideal/Maps.lean:1141](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L1141) |
| `mathlib:Ideal.minimalPrimes` | [Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean#L57) |
| `mathlib:Ideal.radical` | [Mathlib/RingTheory/Ideal/Operations.lean:798](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Operations.lean#L798) |
| `mathlib:Ideal.sInf_minimalPrimes` | [Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean:116](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean#L116) |
| `mathlib:IsLocalRing.maximalIdeal` | [Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean:30](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean#L30) |
| `mathlib:IsLocalization.Away` | [Mathlib/RingTheory/Localization/Away/Basic.lean:50](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Away/Basic.lean#L50) |
| `mathlib:IsLocalization.eq_iff_exists` | [Mathlib/RingTheory/Localization/Defs.lean:165](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Defs.lean#L165) |
| `mathlib:IsLocalization.minimalPrimes_comap` | [Mathlib/RingTheory/Ideal/MinimalPrime/Localization.lean:205](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Localization.lean#L205) |
| `mathlib:IsRegularLocalRing` | [Mathlib/RingTheory/RegularLocalRing/Defs.lean:51](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RegularLocalRing/Defs.lean#L51) |
| `mathlib:IsSMulRegular` | [Mathlib/Algebra/Regular/SMul.lean:39](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Regular/SMul.lean#L39) |
| `mathlib:IsSMulRegular.notMem_of_mem_minimalPrimes` | [Mathlib/RingTheory/Ideal/MinimalPrime/Localization.lean:82](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Localization.lean#L82) |
| `mathlib:LinearEquiv.annihilator_eq` | [Mathlib/RingTheory/Ideal/Maps.lean:882](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L882) |
| `mathlib:LinearMap.annihilator_le_of_injective` | [Mathlib/RingTheory/Ideal/Maps.lean:872](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L872) |
| `mathlib:Localization.Away` | [Mathlib/GroupTheory/MonoidLocalization/Away.lean:140](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/MonoidLocalization/Away.lean#L140) |
| `mathlib:LocalizedModule.Away` | [Mathlib/Algebra/Module/LocalizedModule/Basic.lean:1460](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LocalizedModule/Basic.lean#L1460) |
| `mathlib:LocalizedModule.equivTensorProduct` | [Mathlib/RingTheory/Localization/BaseChange.lean:68](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/BaseChange.lean#L68) |
| `mathlib:Module.FaithfullyFlat` | [Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean#L63) |
| `mathlib:Module.FaithfullyFlat.of_flat_of_isLocalHom` | [Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean:60](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean#L60) |
| `mathlib:Module.Finite.base_change` | [Mathlib/RingTheory/TensorProduct/Finite.lean:80](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Finite.lean#L80) |
| `mathlib:Module.Flat` | [Mathlib/RingTheory/Flat/Basic.lean:113](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean#L113) |
| `mathlib:Module.Free.chooseBasis` | [Mathlib/LinearAlgebra/FreeModule/Basic.lean:88](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean#L88) |
| `mathlib:Module.IsTorsionBySet.module` | [Mathlib/Algebra/Module/Torsion/Basic.lean:579](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Torsion/Basic.lean#L579) |
| `mathlib:Module.annihilator` | [Mathlib/RingTheory/Ideal/Maps.lean:860](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L860) |
| `mathlib:Module.annihilator_eq_bot` | [Mathlib/RingTheory/Ideal/Maps.lean:892](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L892) |
| `mathlib:Module.annihilator_eq_top_iff` | [Mathlib/RingTheory/Ideal/Maps.lean:901](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L901) |
| `mathlib:Module.associatedPrimes.minimalPrimes_annihilator_subset_associatedPrimes` | [Mathlib/RingTheory/Ideal/AssociatedPrime/Localization.lean:127](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/AssociatedPrime/Localization.lean#L127) |
| `mathlib:Module.comap_annihilator` | [Mathlib/RingTheory/Ideal/Maps.lean:886](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L886) |
| `mathlib:Module.isTorsionBySet_quotient_ideal_smul` | [Mathlib/Algebra/Module/Torsion/Basic.lean:646](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Torsion/Basic.lean#L646) |
| `mathlib:Module.mem_support_iff_exists_annihilator` | [Mathlib/RingTheory/Support.lean:70](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L70) |
| `mathlib:Module.mem_support_iff_nontrivial_residueField_tensorProduct` | [Mathlib/RingTheory/LocalRing/Module.lean:112](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/Module.lean#L112) |
| `mathlib:Module.mem_support_iff_of_finite` | [Mathlib/RingTheory/Support.lean:202](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L202) |
| `mathlib:Module.mem_support_mono` | [Mathlib/RingTheory/Support.lean:75](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L75) |
| `mathlib:Module.support` | [Mathlib/RingTheory/Support.lean:49](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L49) |
| `mathlib:Module.support_eq_zeroLocus` | [Mathlib/RingTheory/Support.lean:218](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L218) |
| `mathlib:Module.support_of_algebra` | [Mathlib/RingTheory/Support.lean:138](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L138) |
| `mathlib:Module.support_quotient` | [Mathlib/RingTheory/Support.lean:251](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L251) |
| `mathlib:Module.support_subset_preimage_comap` | [Mathlib/RingTheory/Spectrum/Prime/Module.lean:51](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Module.lean#L51) |
| `mathlib:MulSemiringAction.toRingHom` | [Mathlib/Algebra/Ring/Action/Basic.lean:71](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Ring/Action/Basic.lean#L71) |
| `mathlib:MvPowerSeries` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:86](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L86) |
| `mathlib:MvPowerSeries.X` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:374](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L374) |
| `mathlib:MvPowerSeries.constantCoeff` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:435](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L435) |
| `mathlib:PrimeSpectrum.comap` | [Mathlib/RingTheory/Spectrum/Prime/RingHom.lean:34](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/RingHom.lean#L34) |
| `mathlib:PrimeSpectrum.comap_surjective_of_faithfullyFlat` | [Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean:146](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Algebra.lean#L146) |
| `mathlib:PrimeSpectrum.localization_away_comap_range` | [Mathlib/RingTheory/Spectrum/Prime/Topology.lean:590](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Topology.lean#L590) |
| `mathlib:PrimeSpectrum.localization_comap_injective` | [Mathlib/RingTheory/Spectrum/Prime/Topology.lean:342](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Topology.lean#L342) |
| `mathlib:PrimeSpectrum.zeroLocus_eq_univ_iff` | [Mathlib/RingTheory/Spectrum/Prime/Basic.lean:302](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Basic.lean#L302) |
| `mathlib:PrimeSpectrum.zeroLocus_subset_zeroLocus_iff` | [Mathlib/RingTheory/Spectrum/Prime/Basic.lean:242](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Basic.lean#L242) |
| `mathlib:RingHom.ker` | [Mathlib/RingTheory/Ideal/Maps.lean:746](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L746) |
| `mathlib:RingHom.quotientKerEquivOfSurjective` | [Mathlib/RingTheory/Ideal/Quotient/Operations.lean:89](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Operations.lean#L89) |
| `mathlib:RingTheory.Sequence.IsRegular` | [Mathlib/RingTheory/Regular/RegularSequence.lean:146](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean#L146) |
| `mathlib:SMulDistribClass` | [Mathlib/Algebra/Group/Action/Defs.lean:230](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Action/Defs.lean#L230) |
| `mathlib:TensorProduct.quotTensorEquivQuotSMul` | [Mathlib/LinearAlgebra/TensorProduct/Quotient.lean:153](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Quotient.lean#L153) |
| `mathlib:associatedPrimes` | [Mathlib/RingTheory/Ideal/AssociatedPrime/Basic.lean:103](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/AssociatedPrime/Basic.lean#L103) |
| `mathlib:isReduced_localizationPreserves` | [Mathlib/RingTheory/LocalProperties/Reduced.lean:28](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalProperties/Reduced.lean#L28) |
| `mathlib:isReduced_of_injective` | [Mathlib/RingTheory/Nilpotent/Defs.lean:144](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Nilpotent/Defs.lean#L144) |
| `mathlib:minimalPrimes` | [Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean:63](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean#L63) |
| `mathlib:minimalPrimes.equivIrreducibleComponents` | [Mathlib/RingTheory/Spectrum/Prime/Topology.lean:1249](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Topology.lean#L1249) |
| `mathlib:nilradical` | [Mathlib/RingTheory/Nilpotent/Lemmas.lean:48](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Nilpotent/Lemmas.lean#L48) |
| `mathlib:nilradical_eq_bot_iff` | [Mathlib/RingTheory/Nilpotent/Lemmas.lean:69](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Nilpotent/Lemmas.lean#L69) |
| `mathlib:nonZeroDivisors` | [Mathlib/Algebra/GroupWithZero/NonZeroDivisors.lean:98](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/NonZeroDivisors.lean#L98) |
| `mathlib:ringKrullDim` | [Mathlib/RingTheory/KrullDimension/Basic.lean:29](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/KrullDimension/Basic.lean#L29) |
| `mathlib:ringKrullDim_quotient` | [Mathlib/RingTheory/KrullDimension/NonZeroDivisors.lean:31](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/KrullDimension/NonZeroDivisors.lean#L31) |
| `mathlib:associatedPrimes.nonempty` | [Mathlib/RingTheory/Ideal/AssociatedPrime/Basic.lean:220](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/AssociatedPrime/Basic.lean#L220) |
| `mathlib:ringKrullDim_lt_top` | [Mathlib/RingTheory/KrullDimension/Basic.lean:86](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/KrullDimension/Basic.lean#L86) |
| `mathlib:MvPowerSeries.C` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:334](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L334) |
| `mathlib:MvPowerSeries.coeff` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:137](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L137) |
| `mathlib:MvPowerSeries.ext` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:145](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L145) |
| `mathlib:MvPowerSeries.coeff_monomial_mul` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:230](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L230) |
| `mathlib:MvPowerSeries.constantCoeff_C` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:451](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L451) |
| `mathlib:MvPowerSeries.constantCoeff_comp_C` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:455](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L455) |
| `mathlib:MvPowerSeries.constantCoeff_X` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:467](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L467) |
| `mathlib:MvPowerSeries.c_eq_algebraMap` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean:786](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean#L786) |
| `mathlib:Ideal.comap_comap` | [Mathlib/RingTheory/Ideal/Maps.lean:166](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L166) |
| `mathlib:Ideal.comap_id` | [Mathlib/RingTheory/Ideal/Maps.lean:149](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L149) |
| `mathlib:Localization.localRingHom` | [Mathlib/RingTheory/Localization/AtPrime/Basic.lean:240](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/AtPrime/Basic.lean#L240) |
| `mathlib:Localization.localRingHom_to_map` | [Mathlib/RingTheory/Localization/AtPrime/Basic.lean:245](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/AtPrime/Basic.lean#L245) |
| `mathlib:Localization.isLocalHom_localRingHom` | [Mathlib/RingTheory/Localization/AtPrime/Basic.lean:264](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/AtPrime/Basic.lean#L264) |
| `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange` | [Mathlib/LinearAlgebra/TensorProduct/Tower.lean:436](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Tower.lean#L436) |
| `mathlib:TensorProduct.AlgebraTensorModule.cancelBaseChange_tmul` | [Mathlib/LinearAlgebra/TensorProduct/Tower.lean:447](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Tower.lean#L447) |
| `mathlib:Module.mem_support_iff` | [Mathlib/RingTheory/Support.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L52) |
| `mathlib:Module.flat_iff_of_isLocalization` | [Mathlib/RingTheory/Flat/Localization.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Localization.lean#L52) |
| `mathlib:Localization.flat` | [Mathlib/RingTheory/Flat/Localization.lean:45](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Localization.lean#L45) |
| `mathlib:Module.FaithfullyFlat.lTensor_nontrivial` | [Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:114](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean#L114) |
| `mathlib:Ideal.ResidueField.map` | [Mathlib/RingTheory/LocalRing/ResidueField/Ideal.lean:38](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/ResidueField/Ideal.lean#L38) |
| `mathlib:Ideal.ResidueField.map_algebraMap` | [Mathlib/RingTheory/LocalRing/ResidueField/Ideal.lean:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/ResidueField/Ideal.lean#L43) |
| `mathlib:Module.Basis.ofVectorSpace` | [Mathlib/LinearAlgebra/Basis/VectorSpace.lean:152](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/VectorSpace.lean#L152) |
| `mathlib:Module.FaithfullyFlat.finsupp` | [Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:203](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean#L203) |
| `mathlib:Module.FaithfullyFlat.of_linearEquiv` | [Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:182](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean#L182) |
| `mathlib:LinearEquiv.support_eq` | [Mathlib/RingTheory/Support.lean:191](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Support.lean#L191) |
| `mathlib:Module.Finite.of_isLocalizedModule` | [Mathlib/RingTheory/Localization/Finiteness.lean:171](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Finiteness.lean#L171) |
| `mathlib:IsLocalization.injective` | [Mathlib/RingTheory/Localization/Defs.lean:941](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Defs.lean#L941) |
| `mathlib:Submonoid.powers_le` | [Mathlib/Algebra/Group/Submonoid/Membership.lean:337](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Submonoid/Membership.lean#L337) |
| `mathlib:Ideal.mk_ker` | [Mathlib/RingTheory/Ideal/Quotient/Operations.lean:133](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Operations.lean#L133) |
| `mathlib:ringKrullDim_quotient_le` | [Mathlib/RingTheory/KrullDimension/Basic.lean:66](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/KrullDimension/Basic.lean#L66) |
| `mathlib:RingTheory.Sequence.IsRegular.nontrivial` | [Mathlib/RingTheory/Regular/RegularSequence.lean:498](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean#L498) |
| `mathlib:Module.mem_annihilator` | [Mathlib/RingTheory/Ideal/Maps.lean:862](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L862) |
| `mathlib:Submodule.mem_annihilator_span_singleton` | [Mathlib/RingTheory/Ideal/Maps.lean:1012](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L1012) |
| `mathlib:Ideal.radical_le_radical_iff` | [Mathlib/RingTheory/Ideal/Operations.lean:843](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Operations.lean#L843) |
| `mathlib:Ideal.quotEquivOfEq` | [Mathlib/RingTheory/Ideal/Quotient/Defs.lean:212](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Defs.lean#L212) |
| `mathlib:Submodule.mem_ideal_smul_span_iff_exists_sum` | [Mathlib/RingTheory/Ideal/Operations.lean:175](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Operations.lean#L175) |
| `mathlib:Module.Free` | [Mathlib/LinearAlgebra/FreeModule/Basic.lean:43](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean#L43) |
| `mathlib:Module.Basis.mk` | [Mathlib/LinearAlgebra/Basis/Basic.lean:111](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Basic.lean#L111) |
| `mathlib:Module.Free.of_basis` | [Mathlib/LinearAlgebra/FreeModule/Basic.lean:65](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean#L65) |
| `mathlib:Ideal.Quotient.eq_zero_iff_mem` | [Mathlib/RingTheory/Ideal/Quotient/Defs.lean:111](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/Defs.lean#L111) |
| `mathlib:Submonoid.mem_powers_iff` | [Mathlib/Algebra/Group/Submonoid/Membership.lean:322](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Submonoid/Membership.lean#L322) |
| `mathlib:IsSMulRegular.pow` | [Mathlib/Algebra/Regular/SMul.lean:156](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Regular/SMul.lean#L156) |
| `mathlib:LocalizedModule.induction_on` | [Mathlib/Algebra/Module/LocalizedModule/Basic.lean:108](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LocalizedModule/Basic.lean#L108) |
| `mathlib:LocalizedModule.smul'_mk` | [Mathlib/Algebra/Module/LocalizedModule/Basic.lean:269](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LocalizedModule/Basic.lean#L269) |
| `mathlib:LocalizedModule.mk_eq` | [Mathlib/Algebra/Module/LocalizedModule/Basic.lean:103](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/LocalizedModule/Basic.lean#L103) |
| `mathlib:IsLocalization.surj` | [Mathlib/RingTheory/Localization/Defs.lean:133](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Defs.lean#L133) |
| `mathlib:IsLocalization.map_units` | [Mathlib/RingTheory/Localization/Defs.lean:127](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Localization/Defs.lean#L127) |
| `mathlib:algebraMap_smul` | [Mathlib/Algebra/Algebra/Basic.lean:409](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Basic.lean#L409) |
| `mathlib:isSMulRegular_algebraMap_iff` | [Mathlib/Algebra/Algebra/Basic.lean:412](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Basic.lean#L412) |
| `mathlib:RingHom.injective_iff_ker_eq_bot` | [Mathlib/RingTheory/Ideal/Maps.lean:805](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Maps.lean#L805) |
| `mathlib:isNoetherianRing_iff_ideal_fg` | [Mathlib/RingTheory/Noetherian/Defs.lean:203](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Noetherian/Defs.lean#L203) |
| `mathlib:Module.Basis.index_nonempty` | [Mathlib/LinearAlgebra/Basis/Basic.lean:81](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Basic.lean#L81) |
| `mathlib:Module.Basis.repr_self` | [Mathlib/LinearAlgebra/Basis/Defs.lean:132](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Basis/Defs.lean#L132) |
