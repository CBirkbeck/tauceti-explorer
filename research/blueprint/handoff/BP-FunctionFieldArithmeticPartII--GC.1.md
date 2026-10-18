# BP-FunctionFieldArithmeticPartII--GC.1

Job #8910. Worker: Codex (GPT-6), session `codex-B8iByz`, 18 October 2026. Branch: `codex-B8iByz-gc1-root-divisors`. The claim bot confirmed this session's claim at 00:50:16 UTC. This is the only job undertaken in this run.

## Completed planning pass

The packet is `complete` at target level. `FunctionFieldArithmeticPartII:GC.1` is **planned**, not closed, and `implementationStatus` remains `unchecked`. The four deliverables are the [packet](../packets/FunctionFieldArithmeticPartII--GC.1.json), [reader](../readmes/FunctionFieldArithmeticPartII--GC.1.md), [compact suggested file](../suggested/FunctionFieldArithmeticPartII--GC.1.lean), and this handoff.

There are thirteen new nodes: four constructions, seven theorems, and two comparisons; twenty-one construction API items; sixteen construction unit tests; eleven baseline declarations; one gap; and four supplier requests. The four imported parent definitions/constructions retain their own thirteen API items and thirteen tests in the reader; they are not counted as new nodes or new API. The sole new planet is **Ordered root divisors**. Combined with the parent's five GC.1 planets, the layer has six.

All ten accepted parent GC.1 targets are imported and mapped to refinements in `targetCoverage`. No parent node id was reused and the parent packet was not edited. The new material specifies the relative evaluation equivalence on objects, arrows and pullbacks; the effective open on arbitrary bases; scheme-theoretic incidence residuals; the frame-torsor differential and normal-crossing root charts; coarse descent and full nilpotent fibres; addition in coordinates; ordered inertia and geometric two-fibres; block/permutation coherence; the refined fixed-object Abel–Jacobi fibre; and the compatibility of all four Abel–Jacobi maps.

The collision check uses the full two-fibre ring with relations `s²+t²=0` and `st=0`, divided by the diagonal sign action. Its reduction is the classifying stack of the relative kernel. Thus neither the full coarse fibre nor the ordered two-fibre has been replaced by its reduction. Proper quasi-finiteness uses the nonrepresentable stack convention; no invertibility of the ordering factorial is assumed.

## Exact remaining work

`GC1-NATIVE-GEOMETRY` remains open. Adopt actual relative section-stack, two-pullback, quotient, coarse-map and Picard-stack carriers from the suppliers, then give typed geometric statements to all thirteen targets, twenty-one API items and sixteen tests listed in the suggested file's omission ledger. Check the chosen pullback and tensor transports, including their identity/composition and two-morphism coherence. The compact file's native coordinate fragment does not discharge this requirement.

The four bounded requests are recorded in the packet, without editing supplier files:

- **GC1-RESTRICTION — SF.1:** the finite étale restriction stack, its Weil-restriction quotient presentation, squaring, split-branch comparison and descent/pullback coherence.
- **GC1-PERMANENCE — SF.1:** the nonrepresentable quasi-finite interface, properness permanence and proper-source/separated-target theorem, proper finite-quotient charts, and the reduced zero-dimensional DM residual-gerbe decomposition.
- **GC1-CURVE-FAMILY — SF.3:** ordinary section restriction and the left-exact kernel for the branch divisor, actual sheaf/pullback functoriality, and the field-wise affine section model on arbitrary value algebras. No uniform vector-bundle or arbitrary pushforward-base-change assertion in small degree is used. Fibrewise vanishing must be distinguished from factoring through the zero section; the nilpotent example is not asserted to contradict the supplier's closed-complement statement.
- **GC1-SMOOTH-COORDINATES — SF.0:** the cotangent smoothness criterion and extension to étale coordinates beginning with specified independent functions.

The SF.0/SF.1/SF.3 follow-up packets have `needs_changes` reviews at this snapshot. Their exact nodes are planned imports, not claims of established library theorems. The four requests and the typed geometry gap are the precise resumption point. This pass has covered the stage's targets; no second job was claimed.

## Ownership and baseline checks

Current upstream **AlgebraicVectorBundles** L0A–L0B owns general tensor and pullback coherence. **JacobianChallenge** C/D owns ordinary relative symmetric/divisor and Picard geometry, integrated with SF.3's no-basepoint contracts. Both README and suggested signatures were read. Current roadmap commit: `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current Mathlib commit: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Those checkouts were read only; no builds ran there.

The exact elaboration baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet records eleven statements read at those pins and six byte-identical source-file receipts. Native formal-divisor `Sym` types are not relative symmetric schemes; native invertible sheaves are not a Picard stack. The reviewed audit has no Part II entry; FA.1/AUDIT-20 is the partly built arithmetic formal-divisor lane.

Generic root invariant calculations are imported from `RS.1/affine-invariants`; the root-Picard objects remain in GC.0. GC.3 owns the kernel-character consequence, and GC.4 owns the unrefined high-degree affine/weighted fibre geometry. No new target duplicates those contracts. The inspected R09.4/R09.5 follow-ups do not supply the general root quotient/coarse claims, so this packet does not cite them for that purpose. No tier ownership move or restructuring is proposed.

## Sources and validation

Read the public author-hosted published Yun–Zhang paper, *Annals of Mathematics* 189 (2019), 393–526: A.1.1–A.1.5, printed pp. 514–517; A.2.1 and the proof of Lemma A.7, pp. 519–520; the fibre equation in the proof of Lemma A.9, p. 521. SHA-256: `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`. The source's smooth classifying-map claim is in the proof of Lemma A.4 on p. 516. All repository statements are in the worker's own words.

Inherited source issues E2 and E5 retain their original ids, origins and confirmed review attribution. Their equations were rechecked locally against the published PDF; the parent's correction-search receipts are inherited, not represented as a new search. No additional source correction is asserted. The Stacks Project statements read are identified individually in the packet and reader, including 44.3.1–44.3.6, 101.37.1–101.37.5, 101.23.2, 101.24.1, 101.21.4 and 101.31.2. HTML is unpaginated. No source needed for this pass was unavailable, and no restricted-library book was required.

Validation completed:

- `check_blueprint.py` with the pinned declaration index: **zero errors, zero warnings**.
- Independent consistency checks: thirteen fresh ids; all ten parent targets covered; all API/test names present in the reader and omission ledger; six planets in the parent/refinement union; no private paths, control characters or source excerpts. The dependency graph reached through the parent and SF supplier contracts is acyclic (136 node contracts).
- The collision-ring nilpotent witnesses were additionally checked using explicit commuting matrices in characteristics 3, 5 and 7. This is a finite computation, not a formal proof of the geometric theorem.
- `lean-check` completed successfully in the shared pinned build after confirming 84 GiB available memory: **no errors and only eight admitted-proof warnings** (two theorem statements and six examples). The file has one light real-bodied abbreviation and no admitted data definition. No background Lean process was left running.

The scratch sources, generation scripts and local logs are disposable; all information needed for the next pass is in these four deliverables. The next pass starts with the four supplier contracts and the exact geometric omission ledger, rather than another source extraction or a replacement of the parent objects.
