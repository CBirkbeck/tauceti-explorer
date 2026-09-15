# Source-based roadmap expansion

## Objective

Expand every roadmap in the atlas into mathematical constructions and intermediate
results, preserving hypotheses and exposing shared prerequisites. Follow the proofs
in the supplied references. A larger graph is useful only when its extra nodes and
edges explain actual mathematics.

The starting catalogue has 180 roadmaps and 1,604 stage records. The expansion queue
accounts for each roadmap. A queue assignment is research work, not an executable
Lean proof ticket or a claim of mathematical completeness.

## Reading and decomposition

1. Read the current roadmap, its dependencies and consumers, and the selected primary
   reference. Read the proof and the auxiliary results it invokes, not just its
   theorem statement. Existing reviews help locate problems but do not replace sources.
2. Separate definitions, construction steps, comparison theorems and applications.
   Retain coefficient rings, topology, finiteness, flatness, descent, normalization
   and other hypotheses in each statement that needs them.
3. Give each new node a mathematical name, a precise statement, its required inputs,
   a source-based construction or proof route, and a concrete acceptance condition.
   A substantial theorem hidden inside an input needs its own node or an identified
   supplier and a dependency link.
4. Prefer an existing supplier to a duplicate construction. Read the supplier's
   statement before claiming it meets the consumer's needs. Record why each new
   directed edge is needed; shared vocabulary alone is not a dependency.
5. Record exact source titles, editions, locators and short verification excerpts.
   Mark a source as read only after inspecting it. If a proof invokes an unread
   reference, record that boundary as a gap and continue the available source work.
6. Check the local mathematical library before claiming a construction is new or
   already implemented. Unchecked implementation status remains unchecked. This
   atlas task does not add Lean placeholders or certify execution-ready proof tickets.
7. Review the statements and dependency composition independently. Check for missing
   assumptions, reversed or circular dependencies, unjustified generalization, and
   renamed packages that merely assume the intended conclusion.

No fixed node quota or artificial depth determines the decomposition. Its structure
comes from the source argument. Do not label a roadmap fully expanded while one of
its source arguments or imported prerequisites remains unexamined.

## Packet format

Researchers write separate JSON packets under `research/expansion/drafts/`.
Reviewed packets are promoted to `data/decompositions/`. One packet concerns one
roadmap; filenames use the roadmap ID with unsafe filename characters replaced.

```json
{
  "roadmapId": "ExistingRoadmapId",
  "status": "partial",
  "summary": "The mathematical scope actually expanded in this packet.",
  "sources": [{
    "id": "stable-source-id",
    "title": "Exact source title",
    "authors": "Source authors",
    "edition": "Version or publication year inspected",
    "url": "https://public-primary-source.example/paper",
    "sha256": "Hash of the source actually read, when available",
    "readSections": ["Exact sections/pages inspected"]
  }],
  "nodes": [{
    "id": "ExistingRoadmapId:ExistingStage/descriptive-mathematical-slug",
    "parentStageId": "ExistingRoadmapId:ExistingStage",
    "title": "Short mathematical title",
    "kind": "construction",
    "statement": "Precise mathematical output, including its scope.",
    "hypotheses": ["Actual hypotheses used by the cited result"],
    "proofSteps": ["A step in the argument, naming the results used"],
    "acceptance": ["A concrete property, comparison or example to verify"],
    "sources": [{
      "sourceId": "stable-source-id",
      "locator": "Section, theorem/lemma number and printed page",
      "excerpt": "A short literal passage checked in the source",
      "match": "How this passage supports the proposed mathematical statement"
    }],
    "implementationStatus": "unchecked"
  }],
  "links": [{
    "source": "AnExistingStageOrNewNodeId",
    "target": "AConsumerStageOrNewNodeId",
    "reason": "The specific output supplied and how the consumer uses it",
    "sources": [{"sourceId": "stable-source-id", "locator": "Exact proof location"}]
  }],
  "coverage": [{
    "stageId": "ExistingRoadmapId:ExistingStage",
    "status": "partial",
    "remaining": ["Specific source argument or prerequisite still to inspect"]
  }],
  "gaps": [{
    "title": "An unresolved mathematical input or missing reference",
    "neededBy": ["ExistingStageOrNewNodeId"],
    "detail": "What has and has not been verified; next source action"
  }]
}
```

`kind` is one of `definition`, `construction`, `lemma`, `theorem`, `comparison`, or
`application`. Coverage statuses are `not_read`, `partial`, or `source_decomposed`;
the last requires the whole stated stage argument and its imported inputs to have
been accounted for. Packet status remains `partial` until all its stages meet that
condition. Independent review and implementation status are separate facts.

Source files, extracted books, private filesystem paths and reference PDFs stay
outside the public repository. Packets contain authored mathematical descriptions,
bibliographic metadata, concise verification excerpts and public source links.

## Integration and integrity

Keep original stage IDs and source texts. New nodes refine an existing stage and
must not erase its original targets. Preserve recorded implementation evidence;
an expanded plan does not make its new mathematics complete. Validate references,
node ownership, dependency endpoints, and cycles before publishing a packet.

The whole-catalogue queue must distinguish pending reading, drafted decomposition,
independent review, and integrated material. Report those counts separately from
formalization progress. Neither an acyclic graph nor a successful site build proves
that the mathematics has no gaps.
