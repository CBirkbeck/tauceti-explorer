# BP-StableReductionPartII--MC.5 — completed planning pass

Issue #8905. Agent: Codex — codex-ebL2PU. Date: 2026-10-18.

The packet is **complete** and its sole stage, `StableReductionPartII:MC.5`, is
**planned**, not closed. This is a finished target-level planning pass, not a
checkpoint or an implementation. The seven remaining supplier obligations are
explicit below. No second issue was claimed.

## Deliverables and completed work

The packet, reader and suggested file have stem `StableReductionPartII--MC.5`.
The accepted `StableReductionPartII.json` was read and left unchanged. This part
imports all thirteen accepted MC.5 targets by their existing IDs and adds nine
distinct support targets: one construction, one definition, two comparisons,
four theorems and one lemma. The support targets expose the universal pairing,
the Hodge/derived-determinant comparison, the Noether defect, the pairing Chern
class, the rational torsion intermediate step, boundary monodromy, rational
descent, vertical principality and arbitrary-base pullback.

The new definition/construction nodes have eight API items and eight tests.
Two incoming foundation contracts have thirteen API items and twelve tests;
the inherited-definition API supplement has twelve API items and thirteen
tests. Thus the full part contains **33 API items and 33 discriminating tests**;
the standard packet checker counts only the eight/eight attached to new nodes.
There are nine verified pinned declarations, eleven acquired primary sources,
five existing-stage requests and three source findings awaiting independent
review. Retain four accepted MC.5 planets and add **Dualizing Deligne pairing**:
five planets in total, one newly declared here.

The reader gives the full mathematical statements, hypotheses, construction or
proof outlines, source locators, API and worked checks. In particular it keeps:

- Untwisted Hodge sheaves, ordered separating determinant signs and ordered
  nonseparating residues.
- Derived determinant grades distinct from the ordinary rank-g determinant.
- Rational Chow vanishing, torsion of the defect, integral Picard vanishing and
  a chosen line isomorphism as different conclusions.
- Stack inertia, including genus-two automorphisms, throughout the analytic
  quotient and Picard argument.
- The pulled-back boundary line on every base; its effective Cartier divisor
  interpretation only for a generically smooth integral Noetherian family.
- Residue-degree-weighted node thickness and the distinction between universal
  signs and all units on a family base, including characteristic two.

## Ownership and imports

Current upstream AlgebraicVectorBundles L0A–L0C supplies monoidal sheaves and
pullback, finite locally free rank, and ordinary exterior determinants. Its
README and Suggested file were inspected at
`0d144d044dacebca17b654695b6f1ad58f159b27`. These current-main imports postdate
the atlas stage registry: `upstreamImports` and `upstreamPrerequisites` record
immutable URLs rather than inventing library declarations or stage IDs.
Assembly must retain them. Current Tau Ceti was also inspected at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; it does not replace the pins.

StableReduction layer 2 already owns locally Noetherian nodal cohomology and
duality. SF.1 owns stack lines and descent; SF.3 owns the Picard groupoid and
scheme excision; SF.5 owns its existing Chow/Chern/GRR range. LV.5 owns surfaces,
mapping class groups and Dehn twists. NE.2/determinant-functor owns the virtual
determinant for associative rings. None is reconstructed here. The last search
of all current upstream README/Suggested files found no supplying generic
Deligne-pairing or determinant-of-cohomology construction. The available
read-only checkout has no SchemeAndStackFoundations directory; no uninspected
upstream extension is asserted to exist.

The generic integral determinant and pairing requirements are recorded as
`proposedSupplierContracts`, with full hypotheses, API and tests. They are not
generic nodes assigned to this moduli roadmap. The accepted base packet already
proposed the SchemeAndStackFoundations Part II extension; this part makes its
contracts precise. No definition was moved from a higher-tier roadmap, and no
other roadmap's packet was edited.

## Precise remaining work and where to resume

An independent review should first check the nine support targets and the
thirteen `importedTargets` overlays against the accepted base. Then assign
supplier owners/nodes for these seven obligations and retain them during
assembly:

| Obligation | Work needed |
| --- | --- |
| `GDET` | Assign SchemeAndStackFoundations, Part II; realize the existing virtual determinant in commutative graded lines, descend to scheme perfect complexes and supply proper flat finite-presentation pushforward with arbitrary derived base change. Import AV-L0A–L0C and compare to NE.2 instead of reconstructing its universal virtual category. |
| `GPAIR` | In the same extension, construct the integral pure-relative-dimension-one pairing on locally projective faithfully flat finitely presented families, with the four-determinant formula, coherent signs/bilinearity, norm and arbitrary base change. |
| `NODAL-BC` | Extend the existing locally Noetherian coherent-curve/duality lane to arbitrary bases for finitely presented stable families, with the same dualizing object, trace, Hodge rank and base-change maps. The pairing source alone does not supply this extension. |
| `CHOW-PIC` | Supply the compatible equivariant Picard/CH¹ and pairing Chern/proper-pushforward interface on the smooth Hilbert quotient presentation, then compare it with SF.5's stack-Chow carrier. Do not infer descent from equality on a plain atlas. |
| `TOPOLOGY` | Assign the analytic stack/Teichmüller, cover-descent, nodal-loop and normal-extension interface. Add Dehn-twist generation to the existing LV.5 direction, using Luo. Use the action groupoid with stabilizers and recover algebraic triviality via Hall on the proper DM compactification. |
| `DESCENT` | Extend flat-field-extension H⁰ and evaluation maps from schemes to the proper stable DM stack, and supply its integral universal global functions. Prove one-dimensionality before descending a rational section. |
| `DIVISORS` | Extend scheme rational-section/Cartier–Weil/excision theory to the smooth integral DM stack. Use reduced irreducible prime fibres to prove vertical divisors principal and integral Picard restriction injective. |

The five requests name StableReduction layer 2, SF.3, SF.5, LV.5 and SF.2.
The three `restructure` proposals explain the unassigned Part II extensions.
Do not label MC.5 closed until those exact inputs have supplier nodes and no
remaining gaps. The next pass should use these acquired sources and contracts,
then assemble the imported targets and support nodes; it should not repeat
source acquisition or ordinary vector-bundle planning.

## Sources and findings

All source statements and proof descriptions are in our own words. The packet
records exact editions, URLs, read dates, locators and acquired-file hashes;
no passages, PDFs or extracted texts enter the repository. The sources read are
Yuan's August 21, 2024 preprint, Theorem 3.3 and §3.1.2, pp. 41–43; Mumford 1977,
Theorem 5.10 and Lemma 5.14, printed pp. 100–105; Deligne 1987, §§6.1–6.4 and
Construction 7.2 through §7.5, printed pp. 141–151; Knudsen–Mumford 1976,
graded lines and determinants, printed pp. 20–21, 28 and 30–32; Eriksson–Freixas
i Montplet 2024, Definition 1.1, Propositions 4.14–4.15, Definition 4.16,
Proposition 6.1 and Corollary 6.9, printed pp. 258, 286–287, 310–312 and
316–318; and Knudsen III 1983, §4/Theorems 4.1–4.2, printed pp. 201–203.

The additional comparison sources are Edidin–Graham's 1997 v3, Theorem 1,
Corollary 1 and Propositions 14–19, preprint pp. 7–9 and 28–29; their 1999 v2,
Theorem 3.1, pp. 13–14; Luo's 1998 v1 main unnumbered theorem, p. 2; Hall's
2011 v2, Theorem 1 and Appendix A, pp. 1 and 17–18; and Frediani–Neumann's
2004 v1, Theorem 2.5, Proposition 2.6 and §2.3, pp. 11 and 17–19. These give
independent mathematical sources for previously unidentified analytic and
equivariant inputs; exact formal supplier nodes remain absent.

Moret-Bailly's 1989 paper, mentioned by Yuan, was not acquired and is not relied
on as a read source. The maintainer's library index was checked; no restricted
book was used. The publisher did not serve the Frediani–Neumann version of
record, so no comparison with that text is claimed.

Source findings **E15–E17** are scoped solely to Frediani–Neumann arXiv v1 proof
paragraphs: the forgotten-curve arrow map need not be an immersion; a fixed
source fibre is discrete rather than a product with Teichmüller space; and the
action nerve is not a constant-space product simplicial object. The reader
gives counterchecks and the corrected homotopy-quotient proof. These findings
do not reject the homotopy-equivalence conclusion. They require independent
review. The accepted base's E1–E14 are preserved and not copied; assembly must
keep the new IDs distinct. Correction searches and the precise read version are
recorded in `sourceIssues` and `sourceVersions`.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.5.json`: zero errors and zero warnings.
- The combined 22-node MC.5 graph, including supplementary edges on imported
  targets, was checked for cycles. New IDs, named gap/upstream references and
  packet/reader API/test statements were reconciled.
- `sourceIssues` and `sourceVersions` pass their shared validators. No excerpts,
  private absolute paths, source assets or Lean code occur in the packet/reader.
- `lean-check` on the suggested file returned exit 0 at Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The only output warnings were the
  thirteen expected omitted-proof warnings. Memory was checked before compiling.
- The suggested file has 99 lines, four theorem statements and nine examples,
  with no data definitions. It checks actual scheme-line comparison carriers
  and scalar signs. The full geometric targets remain in the reader because
  their carriers are absent at the pins. This compilation is not verification
  of those geometric targets.
- `git diff --check`: clean. Only this job's four deliverables are submitted.

No scratch file is needed to resume; all durable findings are in these four
deliverables. Scratch sources and logs are removed after submission.
