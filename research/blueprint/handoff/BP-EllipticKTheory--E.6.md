# BP-EllipticKTheory--E.6 handoff

Worker: Codex — codex-pMKZqt. Issue: #6481. Branch:
`codex-pMKZqt-elliptic-ktheory-e6`.

## Outcome and scope

The pass is complete. The packet has scope exactly `EllipticKTheory:E.6`, part
`E.6`, and stage coverage `planned`. It imports the seven accepted parent E.6
nodes by ID and adds six nodes: one definition and five theorems. There are
11 API items, three unit tests, three new planets and ten baseline declaration
citations. Together with the parent’s integral-part planet, the layer has four
planets, within the six-planet limit.

The parent’s sole recorded E.6 gap, uniqueness of the minimal regular model over
O_{F,S}, has a specified proof through existence, local-to-global terminality,
the local minimality criterion and unique marked isomorphisms. Restriction on
inverting primes has identity/composition coherence. No new mathematical gaps
or remaining refinements are recorded. No upstream roadmap, parent packet or
application file was edited, and no mathematics is claimed implemented.

Coverage is not `closed`: the two StableReduction stage imports and the
inherited parent K-theoretic imports remain planned interfaces. This is a
complete planning submission, not a checkpoint.

## Proof boundaries for the reviewer

The existence argument uses a projective starting model from the parent’s
projective-closure/resolution construction. Contract vertical exceptional
curves using Stacks 54.16.9(1). The image of the nonsmooth locus is a finite set
of base primes, and the total number of fibre components over this fixed set
strictly decreases. Smooth fibres have no exceptional component: locally their
components are uniformizer divisors with trivial normal sheaf. A contraction
preserves projectivity and regularity; integrality and the Dedekind
flat/torsion-free theorem preserve arithmetic flatness.

For the mapping property, take the parent’s common resolution and localize at
the base prime of its last point-blowup centre. Local terminality identifies the
map to the minimal model with the map factoring through the preceding local
model. The exceptional curve is therefore mapped to a point globally. The
surface blowdown universal property factors the global morphism. Induct down
the finite sequence. Morphism uniqueness uses the existing Mathlib
reduced-source/dominant-map/separated-target equality theorem; the arithmetic
generic fibre is not asserted to be open.

Minimality is defined by outgoing isomorphisms. Its equivalence with incoming
terminality and absence of local exceptional curves is proved, not assumed in
the definition. Positive genus and identity of the fixed generic curve remain
explicit. Inverting primes retains the same DVRs; arbitrary ramified base
change is not asserted to preserve regularity or minimality.

## Supplier contracts

The two requests are stated in full in the packet:

- StableReduction layer 4: exceptional curves, the projective Noetherian-base
  curve-on-surface contraction with a regular two-dimensional contracted point,
  and universal factorization of maps that send the exceptional curve to a
  point. The general contraction target in that layer covers this interface;
  this packet only applies it to finitely many arithmetic fibres.
- StableReduction layer 5: the DVR no-exceptional criterion, existence and
  positive-genus terminality/unique marked isomorphisms, with the regularity and
  dense-generic-fibre interface for local models.

The seven parent imports retain their original requests. The current audit
AUDIT-28’s E.6 entry, the stage description, the parent nodes and all link-map
entries mentioning E.6 were checked. StableReduction and JacobianChallenge
upstream documents were read as the two style comparisons. Searches of the
pinned declaration index/source trees distinguish the existing DVR
`TauCeti.Model`, minimal Weierstrass equations and numerical minimality from
regular proper arithmetic surfaces. A Mathlib open-PR search for “regular
model” and public Mathlib/Zulip searches found no replacement interface on
6 October 2026.

## Checks and Lean limitations

`python3 scripts/check_blueprint.py research/blueprint/packets/EllipticKTheory--E.6.json`
with the supplied pinned declaration index reports **zero errors and zero
warnings**. Source declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, not inferred from their names.

The **full suggested file is not compiled**. `lean-check` failed at the first
real Tau Ceti import: the shared prebuilt environment has no object file for
`TauCeti.AlgebraicGeometry.Curves.StableReduction.Model.Basic`; its
`TauCeti.AlgebraicGeometry.Fibers` object file is absent too. The real imports
are retained. No dependency build, Lake update/cache operation or language
server was started.

A separate Mathlib-only fragment elaborated at the pinned Mathlib commit with
only `sorry` warnings and no errors. Its scope is the parent arithmetic-model
carrier, generic inclusion, marked Hom/category, minimality API, the expressible
parts of the three tests, terminality implying outgoing minimality, and the
marked-isomorphism construction once both model maps exist. To reproduce that
fragment from the suggested file: omit the two Tau Ceti imports and the
`LocalComparison` section, replace the imported generic-fibre projection by its
definitionally equal pullback first projection, and add the individual Mathlib
Flat and Proper imports. The fragment does not validate the omitted local
comparison section or any commented geometric theorem/test instance.

The suggested file names every packet definition, API item and test. The full
elliptic-scheme test instances and named global theorems needing local
minimality/coherent-genus interfaces are explicit comments following the
protocol’s missing-vocabulary convention. Their mathematical statements remain
in the packet and reader. They are not replaced by empty predicates or assumed
theorem fields. Compiled signatures with unfinished proofs do not establish the
mathematics.

## Sources and source findings

Public sources downloaded and read on 6 October 2026, with exact versions and
SHA-256 recorded in the packet:

- Brian Conrad, *Minimal models for elliptic curves*, notes dated 21 November
  2015: §3, pp. 6–9, and Corollary 4.7 with its proof, p. 12.
- Stacks *Resolution of Surfaces*, PDF ed88ff78 (14 July 2026): §54.16,
  pp. 45–51, and §54.17, pp. 52–53.
- Stacks *Semistable Reduction*, same PDF edition: §55.8–55.10, pp. 33–40,
  including the positive-genus proof’s component/intersection argument.

The current HTML tags 0C2N, 0C6B and 0C9Z were also inspected. Two new source
misprints are recorded, awaiting independent confirmation: the reversed arrow
in the first proof sentence of 55.10.2, and the wrong ambient compactification
for the image open subscheme in 54.16.9(2). Both are notation slips with unchanged
theorem statements. No source needed for this continuation remains unread;
Liu’s book and the original Lipman papers are not claimed read or used as
unexamined additional inputs. The public Stacks proofs and explicit supplier
contracts give the source spine.

## Next action

Independent review checks the six nodes, particularly the finite termination
measure and the local-to-global factorization. Assembly incorporates this part
alongside the parent’s seven nodes and supersedes its recorded E.6 uniqueness
gap. No further blueprint refinement of E.6 is requested by this pass.
Implementation discharges the named supplier interfaces and restores full Lean
signature checking when the real modules are available in a prebuilt library.
All source hashes and continuation information needed after scratch cleanup
are in the deliverables.
