# BP-GL2ModularityLifting--R32.6

Issue #9926; Codex session `codex-uMJFd9`. This is a complete target-level planning pass for R32.6. The stage has coverage `planned`, with two explicit gaps and two supplier requests. It does not certify an independent proof of Serre modularity or an arithmetic Lean implementation.

## Delivered and ownership

The accepted `GL2ModularityLifting--R32.3.json` already scopes R32.3–R32.6 and owns seven R32.6 targets. This continuation imports all seven identifiers through `reusedNodes`, without copying their nodes or changing the accepted packet. It adds one theorem, `GL2ModularityLifting:R32.6/directed-polynomial-family-transfer`, composing local transfer with fixed-characteristic Frobenius recognition through common algebraic good-prime polynomials. The reader states all eight targets and the exact four branches, supplies proof steps, interface checks and worked applications, and distinguishes directed transfer from an equivalence whose target hypotheses have not been checked.

The new node has ten resolved prerequisites: nine blueprint nodes and one integrated-decomposition node. There are no new definitions or constructions, hence no new definition APIs or definition unit tests. Their existing supplier APIs remain with their owners. The new packet contributes one planet and cites two pinned Mathlib determinant declarations. Four Lean examples check the sign at two, inverse-square twisting and the residual ratio at three.

`RT-AREA-langlands-2/21` is handled by retaining R32.6 as the sole modern ramified-reducible transfer owner. The selected member's characteristic-zero irreducibility, oddness, regular de Rham property and precise Pan/ordinary-three branch remain explicit even when coefficient-prime Weil–Deligne compatibility is absent. DP's all-member de Rham data must not be inferred from a historical KW almost-strict carrier. R24.6 supplies adapters and consumes this transfer; its current packet already imports the relevant R32.6 nodes. No supplier files or atlas links were changed.

The accepted RS-08 restructuring preserves the R32 stages; its restrictions on R22 do not narrow this stage. The maintainer's BCDT 2001 extraction belongs to R22.5 and is outside this issue's scope. DeformationAndDerivedPatchingAlgebra is consumed through the existing lifting-node dependency chains; no patching construction is duplicated here.

## Assembly boundary

GL2ModularityLifting is tier 21 and PotentialModularityAndCompatibleSystems tier 22. The two pre-existing R32.6 system wrappers in the accepted R32.3 packet refer to R24.5. At assembly, express those wrappers by applying the lower-tier polynomial-data theorem written here, and retain generic system packaging in R24.5/R24.6. The new theorem has no R24 prerequisite and introduces no compatible-system carrier. There is no definition ownership move in this part. Keep the seven imported IDs single when assembling the parts.

Pinned source statements were checked at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also inspected. Existing ProfiniteArithmetic, LocalGaloisGroups, ModularForms and IntegralHeckeAndGaloisDeterminants work is imported, not replanned. The reviewed library audit contains no direct GL2ModularityLifting entry; its R31.6/R33.5 records route the independence obligation here. No positive library-coverage verdict is inferred from that absence.

## Exact open obligations

The existing owner `R32.6/globalisation-dependency-audit` is retained. The request to `CompletedCohomologyAndLocalGlobalCompatibility:R31.6` requires a certificate for the transitive globalisation and support inputs, with residual modularity retained where assumed:

- Tung dyadic §4.3: Calegari Proposition 3.2 and its Moret–Bailly input; Snowden Propositions 8.2.1–8.2.2 and descent through 8.1.1, 5.1.1, 7.6.1 and 4.4.2; published KW II Theorem 6.1 for the dyadic extension. Paškūnas Lemma 3.29 assumes an already automorphic residual representation; KW II Lemma 3.5 supplies its remaining local input. The published KW II passages were not verified in this run, and the differently numbered older preprint is not a substitute.
- CEG+16 §2.1 identifies EG14 Proposition A.2/Corollary A.7 and BLGGT14 potential automorphy as the suitable-globalisation leaves. The large-image and regular potentially diagonalizable lift hypotheses must be preserved.
- Emerton–Paškūnas Theorem 6.3 gives a union of support components. Tung Proposition 3.9 additionally uses local-ring irreducibility/reducedness and density to obtain faithfulness. Those hypotheses and the remaining patched-module inputs must appear in the certificate.
- BLGG13 Theorem A.4.1 assumes a potentially automorphic residual seed in addition to adequacy and regular potentially diagonalizable local lifts. Its change-of-weight/descent inputs and the seed must be certified; adequacy alone does not supply the seed.

The request to `SerreWeightAndLevelOptimisation:R20.6` requires the restricted weight-part proof used for the CM-induced residual representation in Emerton §7.4, without the full-Serre shortcut in §7.3. It also requires collation of Gee Theorem 4.4.12 as cited by Kisin (2.2.17). The current author PDF inspected here instead has Theorem 4.6.9, p.26, assuming residual modularity, p>2 split and irreducibility on the cyclotomic subgroup; its proof uses Proposition 4.6.6 and Lemma 4.6.8. Their numbering is not asserted to identify the same edition or statement.

The second gap is elaboration of the arithmetic signatures against the missing combined geometric-representation, residual, de Rham and attached-newform interfaces. All eight arithmetic targets remain README targets. The suggested file contains no surrogate modularity predicate, placeholder carrier, data definition or arithmetic implementation claim.

## Sources and verification

The packet records URLs, read dates, exact locators and downloaded hashes for fourteen sources. The reader's source-edition list specifies the passages inspected: DP's transfer/system and congruence applications; Pan's theorem and full-Serre remark; Tung's odd and dyadic lifting/support/globalisation inputs; the Skinner–Wiles main theorem, read visually on printed p.6; Paškūnas Lemma 3.29; Emerton §§7.3–7.4; Hu–Tan Theorem 6.3; Calegari Proposition 3.2; Snowden §8; Gee's author-edition weight theorem; BLGG A.4.1; CEG globalisation/component support; and EP Theorem 6.3 with its recalled geometric inputs. These targeted proof readings do not certify their unread transitive leaves. No passages, PDFs or source-text extracts are included in the repository.

The finite-order determinant qualification in the ordinary-three theorem retains the existing `GL2ModularityLifting/E10` finding; no duplicate source issue is created. Pan's unconditional residually irreducible consequence, Hu–Tan's final unconditional deduction and Emerton §7.3 are explicitly excluded from an independent Serre input cone. No new source error is claimed from the version or support distinctions above.

Validation:

- `python3 scripts/check_blueprint.py research/blueprint/packets/GL2ModularityLifting--R32.6.json`: zero errors and zero warnings; one theorem, zero API items, zero definition unit tests, one new planet, two baseline declarations, two gaps and two requests.
- `lean-check research/blueprint/suggested/GL2ModularityLifting--R32.6.lean`: exit 0, exactly four expected unproved-example warnings, no other warnings. These are convention checks; the arithmetic transfer theorem was not elaborated.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: four files, zero problems. Staged whitespace validation also passed.

Independent review should check the directed coefficient-embedding argument, every imported lifting branch, the all-member recognition conclusion and this ownership boundary. Proof closure requires the named supplier certificates; arithmetic elaboration requires the named supplier carriers.
