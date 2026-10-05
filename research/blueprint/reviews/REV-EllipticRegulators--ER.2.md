# Independent review of EllipticRegulators ER.2

Accepted with corrections, 2026-10-05. Reviewer: Codex, session
`codex-9YrpZX`, job `REV-EllipticRegulators--ER.2`, issue #6435. The input was
written by Codex session `codex-aLxXqA` for #6483; this reviewer did not contribute
to that work.

This is an accepted, complete planning pass at target granularity. ER.2 remains
**planned**, every node remains implementation **unchecked**, and the early
M.8 export remains a supplier gap. Acceptance does not assert that the Deligne
complex, regulator or geometric comparisons have been implemented.

## Counts and changes

| Item | Reviewed result |
| --- | --- |
| New packet nodes | 5: 3 comparisons, 1 construction, 1 theorem |
| Node verdicts | 3 verified, 2 corrected, 0 added, 0 unverifiable |
| Accepted base ER.2 nodes reused | 5, retained by id |
| Baseline citations | 8 confirmed; 0 removed or replaced |
| API items / construction tests | 7 / 5 |
| Planets | 2, retained |
| Coverage | 1 planned stage, 0 closed stages |
| Gaps / requests | 1 / 2, retained and clarified |
| Source findings | E24–E26 confirmed; E27 added and confirmed |

Corrections made in the packet:

1. Replaced the attribution of a Hodge decomposition to C5 by the direct curve
   calculation: the de Rham complex has no terms in degrees at least two, so
   its truncated complex is zero and (F^2H^1_{mathrm{dR}}=0). Added the actual
   finer supplier `ComplexComparisonPartII:C5/repair-proper-de-rham-betti` for
   additive comparison. Narrowed the remaining C5 request to conjugation and
   oriented cup/trace/period compatibility, which that node explicitly leaves
   open. Updated the corresponding suggested-file comment.
2. Corrected Brunault's source title to the title on the retrieved thesis and
   the Proposition 67 quotation to (r_A(\gamma)=\widehat r_A(\eta^*\gamma)),
   locating its conclusion on p.69. The earlier subscript was not the source's
   wording. The comparison statement and its constant are unchanged.
3. Added explicit source ids and independent verdicts to E24–E26. Added E27,
   the unit-regulator differential variable slip, with its check and searches.
   Extended the author-copy version note to all four findings.
4. Added the top-level review and one verdict for every node. No new
   mathematical node, baseline replacement, API change or planet was needed.

## Sources and mathematical checks

The public PDFs were retrieved independently; all three SHA-256 hashes agree
with the packet. Relevant passages and equation signs were read from the text,
with page images used where extraction loses conjugation bars.

| Source | Passages checked |
| --- | --- |
| [Brunault's thesis, arXiv v1](https://arxiv.org/pdf/math/0602186v1) | Title page; pp.19–20, 22, 26–27; §§2.5–2.6 pp.63–70. Images pp.64–66 and 68 confirm Tate coefficients, conjugation and the cup representative. |
| [Schneider's published chapter](https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf) | §2 pp.7–9 and §4 p.28, including the page image of the higher-Chern product and character formulas. |
| [Nekovář's author copy](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf) | §§7.1–7.5 pp.21–24; the p.24 image independently checked for each source finding. |

Every locator and excerpt attached to the five nodes was checked. The
statements preserve smoothness, properness, the number-field hypothesis,
rational K₂ coefficients, and the chosen orientation and period data.

* **Deligne specialisation:** the proper-variety exact sequence has
  (H^1(\mathbb R(1))), rather than (H^1(\mathbb R(2))). Coefficient
  conjugation is minus one on the imaginary Tate line. Consequently total
  conjugation invariants are geometric minus eigenclasses. Brunault's wedge
  comparison sends them to imaginary-valued functionals on real differentials.
* **Orbit equivalence:** the dual real-period involution is
  ((a,b)\mapsto(a,\varepsilon a-b)). Its minus eigenline is ((0,b)) for
  both real lattice types. After geometric transport, a complex pair is a swap;
  its minus part is ((u,-u)), with two real coordinates. The stated inverse
  and change of complex representative follow from these equations.
* **Dimension:** a real orbit contributes one and a complex orbit contributes
  two. Thus the real target has dimension (r_1+2r_2=[F:\mathbb Q]), whereas
  the unrestricted embedding sum has dimension (2[F:\mathbb Q]). The
  examples over Q, Q(i) and Q(√2) distinguish these counts.
* **Symbol comparison:** Schneider's character sign at weight two and product
  sign at weights one and one cancel. The positive unit cup product has
  representative (i\eta), since (\pi_1(d\log f)=i\,d\arg f). Brunault's
  Stokes calculation gives (W(r_D)=2r_E), independently of any L-value
  formula. The puncture boundary estimate suffices for the integration by
  parts. Unit-modulus tame symbols only give a real-current class; rational
  tame triviality is required for a rational K₂ lift.
* **Oriented coordinate:** with intersection +1 and real period one, the
  determinant pairing is (-\nu(\gamma_2)). Division by i yields
  (-2\pi a(\gamma_2)=-\oint_{\gamma_2}\eta=2\operatorname{Im}r_E(\omega_0)).
  Shearing the transverse cycle adds a zero period. Simultaneous orientation
  reversal negates the coordinate. The separately scaled author-copy pairing
  is (J=W/(2\pi i)=r_E/(\pi i)=\mathrm{toReal}/(2\pi)).

E24 is the wrong Tate coefficient in a sentence; E25 omits i when writing the
cup representative using real darg; E26 repeats g in the conjugated
differential instead of f. All three corrections follow from the preceding
comparison/cup formulas. E27 prints df where the pair model requires

\[
d\varphi_f=\pi_0(df/f),\qquad \varphi_f=\log|f|.
\]

The local unit (f=e^z) at zero distinguishes the printed (df=dz) from the
required real differential (d\varphi_f=dx). All four are clear misprints,
classified as affecting nothing in the intended mathematics.

No relevant correction was found in the recorded searches. Direct access to
the author's alternate PDF and the AMS endmatter returned 403; the publisher
chapter was not retrieved. These findings concern the hashed Stanford author
copy alone. They make no assertion about the 1994 version of record.

## Baseline, suppliers and closure

All eight declarations were read from the existing Mathlib git objects at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, including their hypotheses:

| Declaration | Verified use |
| --- | --- |
| `Module.End.eigenspace` | Existing eigenspace submodule |
| `Module.End.mem_eigenspace_iff` | Membership means (fx=\mu x) |
| `NumberField.ComplexEmbedding.conjugate` | Star on complex embeddings |
| `NumberField.ComplexEmbedding.isReal_iff` | Fixed embeddings are real |
| `NumberField.InfinitePlace.nrRealPlaces` | Cardinality of real places |
| `NumberField.InfinitePlace.nrComplexPlaces` | Cardinality of complex places, each a pair |
| `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` | (r_1+2r_2=\mathrm{finrank}_{\mathbb Q}F) |
| `Complex.imCLM` | Imaginary part as a real continuous linear map |

The reviewed AUDIT-28 entry reports ER.2 unbuilt and its analytic ingredients
partial. Searches of both pinned library trees did not find a Deligne target
or symbol regulator supplying these claims. No existing implementation is
replanned. The Hodge-structure and contour-integration upstream roadmaps were
read as models for the source and interface standard.

The five accepted ER.2 nodes and the relevant ER.1 period, uniformisation and
embedding nodes were read, not copied into this packet. E.3's rational
restriction node supports lift independence without assuming a uniform
exponent annihilates all residue-field K₂. P.5's three cited nodes supply the
general η form, unramified current class and Beilinson comparison. Their
current/comparison prerequisites remain inherited planning work. C5's actual
proper-comparison node supplies an additive isomorphism, with cup/trace
compatibilities recorded separately; the correction respects this boundary.

Every ER.2 stage target is assigned in the coverage table, either to a new
specialisation, an accepted reused node, a finer supplier or the explicit early
M.8 gap. The two requests identify the consuming nodes and exact missing
statements. The local graph and a structural traversal of reachable packet
node prerequisites have no node cycles. Stage and reserved leaves are supplier
boundaries, not claims that their mathematics is closed.

RT-AREA-ktheory-2/7 is handled correctly in both packet and reader: generic
Deligne/Chern theory belongs to an early M.8 foundation, the general curve
formula/current/comparison to P.5, and elliptic embedding/rank/period/torsion
specialisations to ER.2. No dependency on the whole late M.8 stage is added.

## API, Lean and checks

The construction has a linear-equivalence constructor, forward and inverse
coordinate laws, extensionality, and membership lemmas for Mathlib eigenspaces.
The five tests cover rectangular and tilted real involutions, complex-pair
coordinates and independence, empty model index sets, and a plus-eigenvector
non-example. The empty case is a linear-algebra model, not a number field.
The two planets name the central orbit construction and dimension formula.

The suggested file's seven API signatures and five test propositions agree
with the packet. Additional computations distinguish i, 2π, the transverse
sign, orientation and torsion killing. The three unavailable geometric
comparison signatures are identified explicitly in comments. The file does
not assert them through arbitrary cohomology carriers or assumed comparison
fields.

Validation on the final files:

* `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.2.json`:
  zero errors and zero warnings.
* `check_errata.py` on a scratch `errata-v1` wrapper containing this packet's
  four findings and source versions: passed.
* `lean-check research/blueprint/suggested/EllipticRegulators--ER.2.lean`:
  exit 0, exactly 27 `sorry` warnings and no other warnings. Available memory
  was checked first. This checks elaboration of the period model, not proofs
  or the omitted cohomology signatures.
* The final diff is restricted to the issue's packet, suggested file, this
  report and its own handoff note; whitespace checks pass.

## Orchestrator follow-ups

No unresolved mathematical contradiction blocks acceptance. The maintainer
still needs to expose an acyclic early M.8 stage/node id and arrange its norm,
product and conjugation exports before implementation can close ER.2. C5's
conjugation and oriented pairing request remains open.

The reader is outside this review issue's editable deliverables. Its line 60
attributes a Hodge decomposition to C5; a later authorised reader update should
use the corrected finer comparison and direct curve filtration argument.
The mathematical vanishing in the following paragraph is correct. No reader,
other roadmap, atlas data or upstream file was edited in this review.
