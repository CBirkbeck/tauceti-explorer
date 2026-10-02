# FIX-RT-BP-EllipticCurveModularity

Codex — `codex-J6LwjP`; issue #5045; 2 October 2026.

This job applies **RT-BP-EllipticCurveModularity/1**, the single confirmed finding
listed in the issue's instructions. The broader verification file confirms /2–/5
too; those are separate follow-up work and are not represented as resolved here.
Only this job's packet, reader, suggested file and fixes report change.

Removed the local lemma node
`EllipticCurveModularity:R29.3/strong-multiplicity-one-across-levels`.
Its theorem is a named target of the existing upstream owner:
`tauceti:TauCetiRoadmap/ModularForms#layer-5-strong-multiplicity-one-and-the-eigenform-characterization`.
The stage text explicitly plans the newform–newform cross-level theorem of
Miyake 4.6.19; reviewed **AUDIT-16** marks it absent from the pinned library,
distinct from the built fixed-space theorem. **RS-06** already imports Layer 5
instead of assigning general multiplicity one to this application roadmap.

The three consumers **newform-of-E**, **rational-coefficient-field** and
**modularity-theorem** now list Layer 5 as a prerequisite. A new request gives
the exact specialization: normalized newforms of weight two, trivial character,
nonzero levels M,M′ dividing the nonzero conductor N, with agreement at almost
all primes outside N, have equal levels and are equal after transport. The
finite set of prime divisors of N enlarges the exceptional set to match the
supplier's agreement outside MM′. The rationality argument also uses this
prime-agreement contract, not the stronger good-index assumption of the
pinned fixed-space theorem. The existence step still produces M_E dividing N;
R29.4 separately proves exact conductor M_E = N.

The **level-11/level-22 acceptance example** moves from the deleted lemma to
**newform-of-E**. At level 22 the level-11 newform contributes f(z),f(2z), with
no new part; oldforms must not become fake newforms of ambient level 22. Layer 4
remains the requested input for this oldform calculation, finiteness, and bad-prime
newform facts, and is explicitly named in newform-of-E's prerequisites. The
Layer 4 request drops the good-Hecke-eigenspace and existence/uniqueness fragment
that formerly reconstructed the Layer 5 theorem. No local proof of strong
multiplicity one remains.

The reader explains the imported theorem, its hypotheses and the preservation of
the initial/exact-level distinction. The commented contract
**eq_of_eigenvalue_eq_across_levels** in the suggested file now names the Layer 5
owner, nonzero levels, trivial characters, a finite exceptional set and agreement
only at good primes. It is explicitly an imported contract, not an elaborated
local declaration. The executable Lean content is unchanged.

The packet now has **20 local nodes and 17 open requests**. Its partial status,
source records, coverage states and historical independent review are retained.
The historical review's entry for the deleted lemma records what that review did;
it is not an active node or certification of these fixes. `fixRevision` records
the current scope, awaiting independent REV-FIX review.

The actual pinned **Newform** and
**Newform.eq_of_forall_notMem_eigenvalue_eq** declarations were read in Tau Ceti
at **f790474**. Newform carries nonzero level, integer weight and character data;
the theorem fixes level/weight/character and asks for equal eigenvalues at all
coprime indices outside a finite set. No cross-level or almost-all-primes result
is inferred from that statement. The Layer 5 document, its reviewed coverage and
RS-06 ownership entry were read. Cremona's public Chapter II was re-fetched on
2 October, matching SHA-256
`432fa5290b2b2ac0d623169e9198d928e5dd75acb490db2d58775630d0f6ea94`;
§2.7, printed pp. 25–26, gives the oldclass basis indexed by divisors of N/M.
No new source erratum is filed.

**Checker compatibility:** the checker matches `tauceti:` before consulting
atlas stage IDs. Following the existing AN.0 and ArithmeticStatistics packets,
canonical Layer 4/5 IDs are recorded in `upstreamPrerequisites`, exact supplier
requests and explicit source-to-consumer links. No roadmap stage is represented
as a baseline declaration. An explicit gap records this encoding obligation.
All 16 actual declarations resolve in the pinned index; the supplier stages and
all four import endpoints were separately checked against the atlas.

Validation: the stock blueprint checker with the pinned index reports **0 errors,
0 warnings**. Intake accepts all four deliverables, and whitespace checks pass.
Reference checks exclude the deleted node from every active prerequisite
and request, retain all three Layer 5 consumers, and preserve historical review data.
The finite-exception conversion and the oldform Fourier-coefficient independence
were checked with exact arithmetic; the fresh assembled dependency graph with the
new imports remains acyclic. No Lean compiled: no existing build at the pins was
available in the audited baseline checkout, and only comments in the suggested
file changed. No build, cache download or language server was started.
