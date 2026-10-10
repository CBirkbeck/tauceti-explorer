# Independent review: R03.4

Accepted on 2026-10-10 by Codex, session codex-kEeQE5, for issue #6275. The original planning job was performed by a different worker, codex-XcoeOq. This is acceptance of the corrected planning pass with explicit interface gaps. It does not certify implementation or proof closure.

The review checked all 15 original nodes and all 39 original baseline entries. After removing two library-covered lemmas, the packet contains 13 proposed nodes: seven theorems and six lemmas. It imports five accepted P7 nodes and four accepted R03.1 nodes. The resulting 47 baseline declarations were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti's historical baseline remains `f790474821cf4256814db967cb154e7af3d0c369`. No nodes were added. There are two narrowed requests and two recorded gaps. Four proposed planets plus the inherited characteristic-zero-point planet give five displays in this layer.

The packet's `review.checked` records every original node, including the two removed duplicates. Its `complete` status denotes a finished scoped pass; `planned` denotes dependency chains ending in checked declarations, imported owners, or explicit gaps. Neither status denotes a proved theorem.

The following corrections were made in place:

1. Removed `finite-maximal-power-quotients`. Pinned `Ideal.finite_quotient_pow` in `Mathlib/RingTheory/Ideal/Quotient/Index.lean:101` is more general, and `LocalRing/Quotient.lean:126` already installs its local specialization using `ResidueField`. Rewired the dimension-zero consumer and replaced the admitted prototype with a proved example using the general theorem. Removed the now-unused, valid `Finite.of_ideal_quotient` baseline entry.
2. Removed `local-hom-continuous-for-maximal-adic-topologies`. Pinned `WithIdeal.uniformContinuous_of_map_le` in `AdicTopology.lean:260` gives uniform continuity. Locality supplies the required ideal inclusion. Rewired all three point consumers and retained a proved specialization example.
3. Closed the finite-free precompleteness request using the pinned finite-coordinate completion equivalence and canonical-map surjectivity. The proof sketch spells out coordinate preimages and the compatibility identities. Current Tau Ceti also has `IsPrecomplete.pi` and `IsAdicComplete.pi`; upstream packaging should use them. No duplicate product-completeness target was added.
4. Cited the accepted `R03.1/completion-noetherian` statement directly. Its hypotheses hold for the maximal ideal of a Noetherian local ring. Removed redundant Noetherianity of the target completion from the proposed signature. The induced completed algebra map and finite residual-fibre comparison remain explicit supplier obligations.
5. Added `Submodule.fg_span` and `Module.finite_def` for finite-cardinality-to-module-finite conversion over the DVR. The reverse implication needs no finite coefficient ring. The forward conversion occurs over the finite residue field. The real priority instance `Module.Finite.of_finite` is also present at line 238, but is omitted by the shared declaration index; the packet uses the indexed spanning-set declarations instead.
6. Imported the exact R03.1 formal-smoothness, positive-truncation and compatible-lift-tower nodes. Recorded their fixed-residue scope and the separate finite-residue-change adaptation. The concrete prototype still requires an actual initial local residue point and compatible local successor lifts.
7. Updated LocalFieldsRamification references to current upstream, recorded already implemented finite IntermediateField structures and the integer-ring equivalence at separate current-library pins, and made locality of the coefficient map explicit. Narrowed the request to the topology adapter and constructed-point interface. These current implementations are not asserted to exist at the historical pins.
8. Corrected the source section locators: Corollary 4.7 is in §4.2, printed pp.45–46; Proposition 9.3 is in §9.1.3, with its statement on pp.83–84 and faithful-module argument on p.88. The old §9.2/pp.89–90 locator referred to a different part of the paper.
9. Replaced the root Mathlib import with individual modules, added the standard prototype note, updated correspondence and elaboration evidence, and recorded source versions and hashes. All source descriptions and mathematical explanations remain in our own words.

| Original node suffix | Verdict | Evidence and boundary |
| --- | --- | --- |
| `residual-fibre-finite-over-complete-subring` | corrected | Removed the obsolete finite-free supplier request. Pinned finite-coordinate completion transport supplies precompleteness; current Tau Ceti already has the product instance. Target separation is over B itself, so no desired A-finiteness is assumed. |
| `completed-residual-fibre-criterion` | corrected | Imported the exact accepted R03.1/completion-noetherian node and removed redundant completion Noetherianity from the signature. The induced completed map and finite residual-fibre comparison remain explicitly requested. |
| `finite-dvr-algebra-iff-finite-special-fibre` | corrected | Added finite spanning-set prerequisites for the reverse implication. The forward cardinality conversion is over the finite residue field; no finiteness of the DVR or flatness of the algebra is inferred. |
| `finiteness-of-deformation-rings-criteria` | verified | KW II §9.1.3 p.88 supplies the motivating faithful-module argument. The action embeds R into the Noetherian S-module End_S(M); all scalar-tower and commuting-action hypotheses are retained. |
| `finite-local-ring-of-dimension-zero` | corrected | Replaced the duplicate quotient-power prerequisite by Ideal.finite_quotient_pow and finite generation of the maximal ideal. Artinianity and nilpotence reduce the ring to one finite quotient. |
| `finite-local-ring-of-finite-prime-quotients` | verified | KW early Lemma 2.4 p.10 contains this algebraic tail. Finite prime quotients are fields, all primes are maximal, and the finite residue field and dimension-zero criterion give cardinal finiteness. |
| `dimension-one-iff-nonnilpotent-uniformizer` | verified | The accepted nilpotent-uniformizer theorem and pinned Artinian/dimension equivalences give both directions. Finiteness over the DVR supplies Noetherianity; locality puts the uniformizer in the maximal ideal. |
| `characteristic-zero-point-of-nonnilpotent-uniformizer` | verified | Read the accepted P7 point statement and the Corollary 4.7 argument at printed pp.45–46. The reformulation preserves the finite algebra, characteristic-zero fraction field and commuting scalar towers; neither topology nor a fixed target residue field is added. |
| `integer-ring-point-with-topology` | corrected | Made coefficient locality explicit and recorded the current implemented intermediate-field structures and integer-ring equivalence. The historical-pin signature is only AlgEquiv transport; the current-library topology adapter is an honest recorded gap. |
| `compatible-artinian-limit-is-local` | verified | The native reduction identity at level 1 and isLocalHom_of_comp prove unit reflection of the native lift. Existence and all reduction identities are reused, not replanned; level 0 alone would be insufficient. |
| `framed-point-from-artinian-lifting` | corrected | Imported the three exact R03.1 smooth-lifting nodes. Their fixed-residue category does not automatically contain a finite residue extension: the starting point and compatible local successor contract remain explicit inputs and a supplier adaptation request. |
| `framed-point-from-power-series-presentation` | corrected | Replaced the proposed continuity lemma by the stronger native adic theorem. An actual algebra equivalence and the native constant-coefficient unit criterion produce the point, even when E is incomplete and d=0. |
| `positive-framing-is-not-module-finite` | verified | A positive variable would be integral in a finite algebra. Its monic polynomial relation has coefficient 1 at the top variable degree, contradicting zero. Nontriviality and positive variable count are essential and explicit. |
| `finite-maximal-power-quotients` | corrected | Removed this duplicate planned lemma and rewired its consumers to mathlib:Ideal.finite_quotient_pow. A proved library-reuse example retains the exact specialization in the suggested file. |
| `local-hom-continuous-for-maximal-adic-topologies` | corrected | Removed this duplicate planned lemma and rewired its consumers to mathlib:WithIdeal.uniformContinuous_of_map_le. A proved library-reuse example retains the exact specialization in the suggested file. |

The public versions read were [Khare–Wintenberger, author final preprint of Serre’s modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), especially §2.1 pp.5–6, Proposition 2.1 in §2.2 pp.7–8, Corollary 4.7 in §4.2 pp.45–46, Proposition 9.3 in §9.1.3 pp.83–84 and p.88, and Theorem 10.1 in §10.1 pp.90–92; and [the earlier arXiv paper](https://arxiv.org/pdf/math/0412076), Lemma 2.4 p.10 and the restriction/finite-image argument on pp.14–15. The earlier lemma numbering is not substituted for the published Lemma 3.6. Both retrieved PDF hashes agree with the packet. These are scoped argument checks, not a claim that the entire papers have been error-audited. No source mistake was found in the arguments used here, so `sourceIssues` is empty.

The faithful-module argument requires a finite S-module, a faithful R-action, and the declared commuting scalar tower. Finiteness of an arbitrary nonfaithful module would not suffice. Cardinal finiteness of prime quotients implies dimension zero through their field structures; completeness is unnecessary for that tail. The characteristic-zero point requires a surviving uniformizer or positive dimension in a finite algebra; finiteness and nonzeroness alone would allow the residue field. Framing preserves the existence of local points while positive power-series variables prevent module finiteness. The arithmetic finite-image theorem, trace generation, and framed presentation remain with the packet's recorded owners.

For each baseline entry I read its statement and ambient hypotheses, rather than relying on the name index. All original entries were valid; the removal above is for redundancy. The nine added entries expose previously implicit library steps. The 23 Mathlib source-file hashes agree with the pinned tree. The grouped declaration inventory below lists all 47 retained entries; the packet records each one's exact role and source locator.

| Pinned Mathlib module | Confirmed declarations |
| --- | --- |
| `Mathlib/RingTheory/AdicCompletion/Functoriality.lean` | `surjective_of_mkQ_comp_surjective`, `AdicCompletion.piEquivFin`, `AdicCompletion.piEquivFin_apply`, `AdicCompletion.map_of` |
| `Mathlib/RingTheory/AdicCompletion/Basic.lean` | `IsHausdorff.of_map`, `AdicCompletion.of_surjective`, `AdicCompletion.of_surjective_iff` |
| `Mathlib/RingTheory/AdicCompletion/Noetherian.lean` | `IsHausdorff.of_isLocalRing` |
| `Mathlib/RingTheory/LocalRing/RingHom/Basic.lean` | `IsLocalRing.map_maximalIdeal_le`, `isLocalHom_of_comp` |
| `Mathlib/RingTheory/Finiteness/Cardinality.lean` | `Module.Finite.exists_fin'`, `Module.finite_of_finite`, `Module.finite_iff_finite` |
| `Mathlib/RingTheory/Finiteness/Basic.lean` | `Module.Finite.of_surjective`, `Module.Finite.quotient`, `Module.Finite.trans`, `Module.Finite.of_restrictScalars_finite`, `Submodule.fg_span` |
| `Mathlib/RingTheory/Noetherian/Basic.lean` | `isNoetherian_of_isNoetherianRing_of_finite`, `isNoetherian_linearMap`, `Module.Finite.of_injective`, `isNoetherian_of_tower` |
| `Mathlib/Algebra/Algebra/Tower.lean` | `Algebra.lsmul` |
| `Mathlib/RingTheory/HopkinsLevitzki.lean` | `IsNoetherianRing.isArtinianRing_of_krullDimLE_zero`, `isArtinianRing_iff_isNilpotent_maximalIdeal`, `isArtinianRing_iff_krullDimLE_zero` |
| `Mathlib/RingTheory/KrullDimension/Basic.lean` | `Ring.krullDimLE_zero_iff`, `Ring.krullDimLE_iff` |
| `Mathlib/RingTheory/IntegralDomain.lean` | `Finite.isField_of_domain` |
| `Mathlib/RingTheory/Ideal/Quotient/Basic.lean` | `Ideal.Quotient.maximal_of_isField` |
| `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | `IsDiscreteValuationRing.irreducible_iff_uniformizer` |
| `Mathlib/RingTheory/Nilpotent/Lemmas.lean` | `nilpotent_iff_mem_prime` |
| `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean` | `Ideal.hasBasis_nhds_zero_adic`, `WithIdeal.uniformContinuous_of_map_le` |
| `Mathlib/RingTheory/AdicCompletion/RingHom.lean` | `IsAdicComplete.liftAlgHom`, `IsAdicComplete.mkₐ_comp_liftAlgHom` |
| `Mathlib/RingTheory/MvPowerSeries/Inverse.lean` | `MvPowerSeries.isUnit_iff_constantCoeff` |
| `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | `MvPowerSeries.coeff_X_pow`, `MvPowerSeries.constantCoeff`, `MvPowerSeries.constantCoeff_C` |
| `Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Basic.lean` | `Algebra.finite_iff_isIntegral_and_finiteType` |
| `Mathlib/RingTheory/AdicCompletion/LocalRing.lean` | `AdicCompletion.maximalIdeal_eq_map`, `AdicCompletion.isLocalRing_of_fg`, `AdicCompletion.isAdicComplete_of_fg` |
| `Mathlib/RingTheory/Noetherian/Defs.lean` | `isNoetherian_def` |
| `Mathlib/RingTheory/Ideal/Quotient/Index.lean` | `Ideal.finite_quotient_pow` |
| `Mathlib/RingTheory/Finiteness/Defs.lean` | `Module.finite_def` |

The reviewed library audit's R03.4 entry assigns the arithmetic finiteness and lift applications to PotentialModularityAndCompatibleSystems R24.1/R24.2. I read their target statements, the GlobalGaloisDeformations Carayol trace and framed/unframed comparison statements, the five P7 suppliers, and the four R03.1 suppliers. The latter completion theorem is planned mathematics, not a pinned implementation. The R03.1 inverse-limit and series-evaluation statements have narrower coefficient-category hypotheses than the generic local-limit and zero-evaluation consumers retained here.

For upstream style and scope, I read the full atlas snapshot roadmaps SemisimpleAlgebras and LocalFieldsRamification, the current root writing checklist and contributing instructions, and the current relevant LocalFieldsRamification Layer 0 README and Suggested interfaces. I checked the nine post-snapshot roadmap directions and current Tau Ceti for relevant duplication. The current upstream commit is `e255659f8eb50cd472809d9d565c8f755acffd84`; current Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, with Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`.

Current [Tau Ceti's finite-product completion module](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/RingTheory/AdicCompletion/Pi.lean) supplies product precompleteness. Its [finite IntermediateField module](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/NumberTheory/LocalField/FiniteExtension/IntermediateField.lean) supplies actual induced structures and the nonarchimedean local-field instance. The [finite-extension basic module](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/NumberTheory/LocalField/FiniteExtension/Basic.lean) supplies `integerRingEquivIntegralClosure`. Its direction is from the integer ring to the integral closure, so the point consumer uses its inverse. No upstream files were changed and no build was run there.

There are no new definitions or construction nodes, hence no definition API or definition-unit-test obligations. The suggested file has 13 admitted theorem signatures, including the explicitly limited algebraic integer-ring adapter, nine admitted discrimination examples, and two proved library-reuse examples. The examples distinguish nilpotent from surviving uniformizers, module from cardinal finiteness, zero-variable evaluation, and the possible need for residue extension.

Validation completed on 2026-10-10:

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--R03.4.json`: zero errors and zero warnings, with the shared declaration index.
- `lean-check` on the suggested file at the pinned Mathlib: exit 0, exactly 22 admitted-proof warnings and no other warnings or errors. All 13 signatures and nine discrimination examples are still admitted; the two reuse examples are proved. The full constructed local-field point and newer Tau Ceti imports were not elaborated.
- Scoped `research/blueprint/intake.py check-files` and `git diff --check`: passed.

Assembly and packaging still need to reconcile the reader's two removed duplicate targets and obsolete finite-free request. The two packet gaps give the exact mathematical interfaces to resume: the induced completion map/residual-fibre comparison and residue-compatible smooth-lifting adaptation; and the current integer-ring topology adapter. No unresolved contradiction was found, and no further independent-review action is needed for this scoped pass.
