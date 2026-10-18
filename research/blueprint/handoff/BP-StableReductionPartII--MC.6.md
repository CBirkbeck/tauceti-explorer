# BP-StableReductionPartII--MC.6

Completed by Codex, session `codex-JnN7fS`, for issue #8906, 18 October 2026.
The bot confirmed the claim in comment 6243984230. This is one complete
planning pass, not a checkpoint and not a claim of formalization.

## Delivered

Only the issue's packet, reader, suggested Lean file and this handoff are
changed. The packet has scope `StableReductionPartII:MC.6`, part `MC.6`,
status `complete`, and coverage `planned`. It contains 12 target nodes:
5 theorems, 2 constructions, 4 comparisons and 1 application; 10 construction
API items and 7 discriminating construction tests, with additional theorem
acceptance checks. It cites 7 native baseline declarations. All implementation
statuses are `unchecked`.

The two new constructions refine the existing smooth and compactified
Torelli nodes. Other targets finish supplier composition, extend graph
compactification to an already stable input, retain the signed full-level
fibre count, and specify the generic-finite/finite-cover positivity argument.
The arbitrary-field positivity target treats reduction and normalization of
geometric components explicitly, including imperfect fields.

No new planets are added: the parent already assigns six to MC.6. Keep those
six at assembly. No parent IDs are reused or edited, and no generic Picard,
determinant, semiabelian, intersection or compactification theory is planned
again here. No changes to upstream roadmaps or sources are proposed by this
part. The requested additions stay with the existing Part II/supplier owners.

## Exact imports that resolve parent requests

- `SchemeAndStackFoundations:SF.0/noetherian-normal-components` supplies the
  regular Noetherian component criterion. There is no need to assume that
  the entire fine-level scheme is integral or geometrically irreducible.
- `SchemeAndStackFoundations:SF.0/nagata-normalization-finite` supplies finite
  normalization in the finite field K(W₀), including inseparable extensions.
  The graph construction retains both the base coordinate and this field.
- JC1 and JC6 nodes are cited individually for family Picard, polarization,
  pullback, Lie–cohomology, rank-g Hodge and determinant comparisons.
- Current AlgebraicVectorBundles L0C already owns coherent sheaf determinant
  pullback; MC.5 imports it. No duplicate determinant construction is added.

## Remaining owner obligations

There are five precise requests and four recorded gaps. These are dependencies
of the specified targets, not additional unclaimed jobs taken by this run.

1. **JacobianChallengePartII JC1:** strong Torelli in every characteristic,
   including the sign/hyperelliptic uniqueness statement. Milne12.1 was read;
   the full §13 existence proof is not closed. Upstream JacobianChallenge D's
   universal property does not supply strong Torelli.
2. **NeronModelsAndSemistableAbelianVarieties R11.4:** canonical arbitrary-base
   represented Picard comparison and stable-curve scheme representation,
   including nonreduced test bases. Retain its G-stable-Picard,
   G-semiabelian-prefix and G-normalization-cohomology proof leaves. BLR source
   applicability is now independently checked here; the owner's packet was
   not edited or declared proof-closed. Its regular-DVR Picard node is not a
   substitute for the general stable-family theorem.
3. **ShimuraCompactifications C4:** use only the early semiabelian carrier,
   invariant differentials and fibrewise torus/abelian quotient interfaces
   for stable Picard. Do not import the full degeneration suffix back into
   this prefix. The polarized-trait compatibility needed for C5 uses the
   R11.3 semistable Jacobian degeneration interface at that subsequent step.
4. **ShimuraCompactifications C5:** the all-Z Siegel specialization and the
   exact minimal extension/Hodge-power contract on regular/normal bases,
   with polarized-trait compatibility and contraction independent of cone
   choices. FC V2.3 is all-characteristic, but existing good-prime PEL targets
   do not by themselves give this interface. IV5.1/5.7 require cone control;
   V6.7 purity is not a characteristic-p argument. Retain the supplier's
   theta-generation and Stein/base-change proof leaves. The request also
   requires the fixed-field coarse minimal model and any comparison with
   geometric fibres of the Z-model, without assuming coarse base change.
5. **SchemeAndStackFoundations SF.5:** combine weighted proper push, Chern
   projection and nef/big numerical targets into generic-finite ample
   pullback and finite-cover transfer. Include nonflat finite maps,
   inseparable degree, dimension zero, and field-extension/reduced-component
   detection. Retain its asymptotic-RR/Kodaira proof leaf.

A subsequent owner pass must discharge these contracts and their backward
chains before changing MC.6 to `closed`. The reader and packet already
state all targets, hypotheses, APIs, sources and acceptance examples for this
part. Packaging must retain these targets even though the compact Lean file
cannot yet express their heavy carriers.

## Source provenance

Read Yuan's hash-identified 21 August 2024 author manuscript, §§3.1 and3.4,
pp.41–46 and54–58; DGH arXiv2001.10276v3 §6.1 pp.23–25; Milne revised
2021 notes, Theorem12.1 and sign proof pp.38–39 and opening §13 pp.40–41;
Knudsen III published scan §6 pp.210–211, visually; and Stacks normal/regular
scheme lemmas cited in the packet. The source metadata gives URLs, versions
and PDF hashes where downloaded.

From the maintainer-cleared library, read BLR 8.4/1(a), pp.231–232, and 9.4/1
and 4, pp.259–261, and FC IV 5.1/5.3/5.7 pp.113–117, IV5.13 p.119, V 2.3/2.5
pp.150–153, and V §6 pp.180–185. These books were read in place. No book file,
extracted passage or source excerpt was copied into the repository or scratch.

Retain parent confirmed erratum E4 for graph closure. New finding
`StableReductionPartII/E15-MC6` records the author manuscript's p.56
smooth-Torelli finiteness overstatement, corrected to quasi-finiteness.
Its scope is explicitly the author manuscript; the published full text was
not collated. Author publications and Annals article pages were checked for
an existing correction, and none was located. The independent review must
verify this finding; this worker has not supplied its review verdict.

Missing proof readings are precisely the strong Torelli existence proof
beyond the opening of Milne§13, the owner normalization-cohomology chain,
the minimal contraction/Hodge extension argument, the C5 theta-generation
proof and the SF.5 asymptotic positivity inputs. No source closure is claimed
for them.

Current read-only TauCetiRoadmap was checked at
0d144d044dacebca17b654695b6f1ad58f159b27 and current TauCeti at
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read the relevant
JacobianChallenge, StableReduction and AlgebraicVectorBundles documents and
suggested signatures. No build was run in either read-only checkout.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.6.json`
  with the pinned declaration index: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/StableReductionPartII--MC.6.lean`:
  **elaborated successfully; only four expected proof-placeholder warnings**.
  The 70-line file states one native retained-base scheme milestone and three
  examples. It defines no data and explicitly lists all twelve README-only
  heavy targets. This is not an elaboration of the moduli targets themselves.
- `scripts/check_sorry_data.py`: passed; no data placeholders.
- Intake file checks, parent/import consistency and `git diff --check`: passed.

The branch starts with `codex-JnN7fS`. Submission references #8906 without
closing it. The worker stops after this one PR; no second claim is taken.
